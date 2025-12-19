import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/register_usecase.dart';

/// Estados do registro
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final User user;
  RegisterSuccess(this.user);
}

class RegisterFailure extends RegisterState {
  final String message;
  RegisterFailure(this.message);
}

/// Eventos do registro
abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final String name;
  final String email;
  final String password;

  RegisterSubmitted({
    required this.name,
    required this.email,
    required this.password,
  });
}

/// Bloc de registro
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterBloc({required this.registerUseCase}) : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    emit(RegisterLoading());

    try {
      final user = await registerUseCase(
        name: event.name,
        email: event.email,
        password: event.password,
      );

      emit(RegisterSuccess(user));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
