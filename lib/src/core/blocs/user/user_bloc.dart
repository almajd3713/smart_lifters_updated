import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:smart_lifters/src/db/prefs.dart';
import 'package:smart_lifters/src/db/schemas/user/user.dart';
import 'package:smart_lifters/src/db/schemas/user/user_repo.dart';
import 'package:http/http.dart' as http;
// import 'user.dart';


part 'user_event.dart';
part 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  final userRepo = UserRepository(usersBox: localData);
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
        try {
          User user = User.fromMap(state.props).copyWith(
            name: event.name,
            email: event.email,
            hashedPassword: event.password
          );
          User returnedUser = await userRepo.createNewUser(user);
          localData.put('current_user_id', returnedUser.id);
          emit(UserAuthenticated(user: returnedUser, props: state.props));
        } catch(e) {
          print(e.toString());
          localData.put('current_user_id', null);
          emit(UserError(message: e.toString(), props: state.props));
      }
    });
    on<LoginEvent>((event, emit) async {
      emit(UserLoading(props: state.props));
      try {
        User returnedUser = await userRepo.getUser(event.name, event.password);
        localData.put('current_user_id', returnedUser.id);
        emit(UserAuthenticated(user: returnedUser, props: state.props));
      } catch (e) {
        print(e.toString());
        localData.put('current_user_id', null);
        emit(UserError(message: e.toString(), props: state.props));
      }
    });
    on<LoginEventById>((event, emit) async {
      try {
        User returnedUser = await userRepo.getUserById(event.userId);
        localData.put('current_user_id', returnedUser.id);
        emit(UserAuthenticated(user: returnedUser, props: state.props));
      } catch(e) {
        localData.put('current_user_id', null);
        emit(UserError(message: e.toString(), props: state.props));
      }
    });
    on<LogoutEvent>((event, emit) async {
      localData.put('current_user_id', null);
      emit(UserUnauthenticated(props: state.props));
    });
  }
}
