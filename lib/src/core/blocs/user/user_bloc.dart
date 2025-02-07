import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';
import 'package:smart_lifters/src/db/schemas/user/user_repo.dart';
// import 'user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitial(props: {
    'height': 140.0,
    'weight': 45.0,
    'isKG': true,
    'gender': 'Male',
    'age': 24,
    'goal': 'Shape Body',
    'physical_level': 'Beginner'
  })) {
    on<UpdateOnboardingDataEvent>((event, emit) async {
      final updatedMap = Map<String, Object>.from(state.props);
      updatedMap[event.field] = event.value;
      emit(UserBoarding(props: updatedMap));
    });
    on<CompleteOnboardingEvent>((event, emit) async {
      if(state.props.isNotEmpty) {
        emit(UserNotLoggedIn(props: state.props));
      } else {
        emit(UserError(message: "Onboarding is incomplete", props: state.props));
      }
    });
    on<SignupEvent>((event, emit) async {
      emit(UserLoading(props: state.props));
        // Login Logic checks, whatever
        // emit(UserAuthenticated(name: 'A Sporty Person', email: event.email));
        try {
          // User user = await userRepository.createNewUser({
          //   ...state.props,
          //   'name': event.name,
          //   'email': event.email,
          //   'password': event.password
          // });
          User user = User.fromMap(state.props).copyWith(
            name: event.name,
            email: event.email,
          );
          emit(UserAuthenticated(user: user, props: state.props));
        } catch(error) {
          print(error);
          emit(UserError(message: "User login error", props: state.props));
      }
    });
    on<LoginEvent>((event, emit) async {
      emit(UserLoading(props: state.props));
      try {
      // Login Logic checks, whatever
        emit(UserAuthenticated(user: User.fromMap(state.props).copyWith(
          name: event.name,
        ), props: state.props));
      } catch (e) {
        emit(UserError(message: e.toString(), props: state.props));
      }
    });
  }
}
