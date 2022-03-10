import 'package:bloc/bloc.dart';
import 'package:smart_plantation/common/user/user_repository.dart';
import 'package:smart_plantation/context/bloc/auth/auth_event.dart';
import 'package:smart_plantation/context/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late UserRepository userRepository;

  AuthBloc(AuthState initialState) : super(initialState);

  AuthState get initialState => AuthInitialState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    try {
      if (event is AppStartedEvent) {
        var user = await userRepository.getCurrentUser();
        if (user != null) {
          yield AuthenticatedState(user: user);
        } else {
          yield UnAuthenticatedState();
        }
      }
    } catch (e) {
      yield UnAuthenticatedState();
    }
  }
}
