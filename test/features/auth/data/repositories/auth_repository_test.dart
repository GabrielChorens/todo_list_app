import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list_app/core/services/network_service/instances.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/features/auth/data/repositories/auth_repository.dart';

class MockReqResService extends Mock implements ReqResService {}

void main() {
  late AuthRepository authRepository;
  late MockReqResService mockReqResService;

  setUp(() {
    mockReqResService = MockReqResService();
    authRepository = AuthRepository(mockReqResService);
  });

  setUpAll(() {
    registerFallbackValue(Uri());
    registerFallbackValue(<String, dynamic>{});
  });

  group('AuthRepository', () {
    const email = 'test@example.com';
    const password = 'password123';

    test('login success', () async {
      when(
        () => mockReqResService.fetch<User>(
          any(),
          body: any<Map<String, dynamic>>(named: 'body'),
          successDataParser: any(named: 'successDataParser'),
        ),
      ).thenAnswer((_) async => right(const User(id: 1, email: email)));

      final result = await authRepository.login(
        email,
        password,
        onSuccess: (user, token) {},
      );

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected right, got left'),
        (r) => expect(r.email, email),
      );
    });

    test('register success', () async {
      when(
        () => mockReqResService.fetch<User>(
          any(),
          body: any<Map<String, dynamic>>(named: 'body'),
          successDataParser: any(named: 'successDataParser'),
        ),
      ).thenAnswer((_) async => right(const User(id: 1, email: email)));

      final result = await authRepository.register(
        email,
        password,
        onSuccess: (user, token) {},
      );

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected right, got left'),
        (r) => expect(r.email, email),
      );
    });

    test('logout success', () async {
      final result = await authRepository.logout(() {});

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected right, got left'),
        (r) => expect(r, unit),
      );
    });
  });
}
