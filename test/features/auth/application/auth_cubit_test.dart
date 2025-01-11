import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/shared/application/core_controller_cubit.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/core/utils/async_cubit_state_management/async_cubit_state_management.dart';
import 'package:todo_list_app/features/auth/application/auth_cubit.dart';
import 'package:todo_list_app/features/auth/data/repositories/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockCoreControllerCubit extends Mock implements CoreControllerCubit {}

void main() {
  late AuthCubit authCubit;
  late MockAuthRepository mockAuthRepository;
  late MockCoreControllerCubit mockCoreControllerCubit;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockCoreControllerCubit = MockCoreControllerCubit();
    authCubit = AuthCubit(mockAuthRepository, mockCoreControllerCubit);
  });

  group('AuthCubit', () {
    const email = 'test@example.com';
    const password = '123456';
    const user = User(id: 1, email: email);

    blocTest<AuthCubit, AsyncState<AppExceptions, User>>(
      'emits [loading, success] when login is successful',
      build: () {
        when(
          () => mockAuthRepository.login(
            email,
            password,
            onSuccess: any(named: 'onSuccess'),
          ),
        ).thenAnswer((_) async => right(user));
        return authCubit;
      },
      act: (cubit) => cubit.login(email, password),
      expect: () => [
        const AsyncState<AppExceptions, User>.loading(),
        const AsyncState<AppExceptions, User>.success(data: user),
      ],
      verify: (_) {
        verify(
          () => mockAuthRepository.login(
            email,
            password,
            onSuccess: any(named: 'onSuccess'),
          ),
        ).called(1);
      },
    );

    blocTest<AuthCubit, AsyncState<AppExceptions, User>>(
      'emits [loading, error] when login fails due to incorrect password',
      build: () => authCubit,
      act: (cubit) => cubit.login(email, 'wrongpassword'),
      expect: () => [
        const AsyncState<AppExceptions, User>.loading(),
        const AsyncState<AppExceptions, User>.error(
          error: AppExceptions.passwordNotMatch(),
        ),
      ],
      verify: (_) {
        verifyNever(
          () => mockAuthRepository.login(
            email,
            'wrongpassword',
            onSuccess: any(named: 'onSuccess'),
          ),
        );
      },
    );

    blocTest<AuthCubit, AsyncState<AppExceptions, User>>(
      'emits [loading, success] when register is successful',
      build: () {
        when(
          () => mockAuthRepository.register(
            email,
            password,
            onSuccess: any(named: 'onSuccess'),
          ),
        ).thenAnswer((_) async => right(user));
        return authCubit;
      },
      act: (cubit) => cubit.register(email, password),
      expect: () => [
        const AsyncState<AppExceptions, User>.loading(),
        const AsyncState<AppExceptions, User>.success(data: user),
      ],
      verify: (_) {
        verify(
          () => mockAuthRepository.register(
            email,
            password,
            onSuccess: any(named: 'onSuccess'),
          ),
        ).called(1);
      },
    );

    blocTest<AuthCubit, AsyncState<AppExceptions, User>>(
      'emits [loading, error] when register fails',
      build: () {
        when(
          () => mockAuthRepository.register(
            email,
            password,
            onSuccess: any(named: 'onSuccess'),
          ),
        ).thenAnswer((_) async => left(const AppExceptions.unknownError()));
        return authCubit;
      },
      act: (cubit) => cubit.register(email, password),
      expect: () => [
        const AsyncState<AppExceptions, User>.loading(),
        const AsyncState<AppExceptions, User>.error(
          error: AppExceptions.unknownError(),
        ),
      ],
      verify: (_) {
        verify(
          () => mockAuthRepository.register(
            email,
            password,
            onSuccess: any(named: 'onSuccess'),
          ),
        ).called(1);
      },
    );
  });
}
