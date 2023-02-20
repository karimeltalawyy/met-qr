abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppCreateStudentSuccessState extends AppStates {}

class AppCreateStudentLoadingState extends AppStates {}

class AppCreateStudentErrorState extends AppStates {
  final String? error;

  AppCreateStudentErrorState(this.error);
}
class AppChangeBottomNavState extends AppStates {}

