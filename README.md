# Flutter Mobx

A Flutter task app to learn how to use the MobX state manager

## Concepts 
 <img src="https://github.com/mobxjs/mobx.dart/raw/master/docs/src/images/mobx-triad.png">
 
 ### Observables
  - Observables are the variables that we want to observe the change of state
   ```
  @observable
  int value = 0;
 ```
  
 
 ### Computed Observables
 
   - Values that are derived from observables. State in MobX = Core-State + Derived-State
   ```
    @observable
  String firstName;

  @observable
  String lastName;

  @computed
  String get fullName => '$firstName, $lastName';
   ```
 
 
 ### Actions
 
  - actions is how we change the states of an observable variable. It is recommended to always use an action to perform a mutation on a variable.
  ```
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
  ```
 
 ### Reactions 
  - Reactions are the observers of the reactive-system and get notified whenever an observable they track is changed.In the following example, we waiting for a change in loggedIn variable, when this variable was changed (reaction), call an action.

 
 ```
 reaction((_) => loginStore.loggedIn, (loggedIn) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ListScreen(),
      ));
    });
 
 ```
 
 ### Observer
  - Widget used in UI to rebuild a child widget when he was updated
  
  ```
  Observer(
    builder: (_) => Text(
          '${_counter.value}'))
  ```

## Adding MobX in a Flutter Project

 1. Add the following dependencies in pubspec.yaml
 
    - Mobx:
       https://pub.dev/packages/mobx

    - Flutter Mobx
       https://pub.dev/packages/flutter_mobx

    Example:
    ```
    dependencies:
       flutter:
           sdk: flutter
       mobx: ^1.0.0
       flutter_mobx: ^1.0.0
    ```
 2. Add the following developer dependencies in pubspec.yaml
 
     - Build Runner:
       https://pub.dev/packages/build_runner

     - Mobx codegen:
       https://pub.dev/packages/mobx_codegen

     Example:
     ```
     dev_dependencies:
     flutter_test:
         sdk: flutter
     build_runner: ^1.7.2
     mobx_codegen: ^1.0.0
    ```
