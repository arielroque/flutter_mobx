import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    autorun((_) => {print(email)});
  }

  @observable
  String email = "";

  @action
  void setEmail(String email) => this.email = email;

  @observable
  String password = "";

  @action
  void setPassword(String password) => this.password = password;

  @observable
  bool isPasswordVisible = false;

  @action
  void togglePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @observable
  bool loading = false;
  
  @observable
  bool loggedIn = false;

  @action
  Future<void> login() async {
    loading = true;

    Future.delayed(Duration(seconds: 2), () {
      loading = false;
      loggedIn = true;
    });
  }

  @computed
  bool get isValidEmail => RegExp(
          r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])")
      .hasMatch(email);

  @computed
  bool get isValidPassword => password.length > 6;

  @computed
  Function get loginPressed =>
      (isValidEmail && isValidPassword && !loading) ? login : null;

  @action
  void logout(){
    loggedIn = false;
  }
}
