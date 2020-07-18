import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermobx/screens/login/store/login_store.dart';
import 'package:fluttermobx/widgets/custom_icon_button.dart';
import 'package:fluttermobx/widgets/custom_text_field.dart';
import 'package:mobx/mobx.dart';

import '../list/list_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();
  ReactionDisposer disposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // different of autorun approach, this verify just when change the value
    disposer = reaction((_) => loginStore.loggedIn, (loggedIn) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ListScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 16,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Observer(
                      builder: (_) {
                        return CustomTextField(
                          hint: 'E-mail',
                          prefix: Icon(Icons.account_circle),
                          textInputType: TextInputType.emailAddress,
                          onChanged: (email) {
                            this.loginStore.setEmail(email);
                          },
                          enabled: !loginStore.loading,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Observer(
                      builder: (_) {
                        return CustomTextField(
                          hint: 'Senha',
                          prefix: Icon(Icons.lock),
                          obscure: !loginStore.isPasswordVisible,
                          onChanged: (password) {
                            this.loginStore.setPassword(password);
                          },
                          enabled: !loginStore.loading,
                          suffix: CustomIconButton(
                            radius: 32,
                            iconData: loginStore.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            onTap: () {
                              loginStore.togglePasswordVisibility();
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 44,
                      child: Observer(
                        builder: (_) {
                          return RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: !loginStore.loading
                                  ? Text('Login')
                                  : CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    ),
                              color: Theme.of(context).primaryColor,
                              disabledColor:
                                  Theme.of(context).primaryColor.withAlpha(100),
                              textColor: Colors.white,
                              onPressed: loginStore.loginPressed);
                        },
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    //needs before super.dispose()
    disposer();
    super.dispose();
  }
}
