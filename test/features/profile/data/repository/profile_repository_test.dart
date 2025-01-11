import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/services/network_service/instances.dart';
import 'package:todo_list_app/core/services/network_service/network_service.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/features/profile/data/repository/profile_repository.dart';

class MockReqResService extends Mock implements ReqResService {}

void main() {
  late ProfileRepository profileRepository;
  late MockReqResService mockReqResService;

  setUp(() {
    mockReqResService = MockReqResService();
    profileRepository = ProfileRepository(reqResService: mockReqResService);
  });

  setUpAll(() {
    registerFallbackValue(Uri());
    registerFallbackValue(<String, dynamic>{});
    registerFallbackValue(DioRequestMethod.get);
  });

  group('ProfileRepository', () {
    const userId = 1;
    const email = 'test@example.com';
    const user = User(id: userId, email: email);

    test('getUserProfile success', () async {
      when(
        () => mockReqResService.fetch<User>(
          any(),
          method: any(named: 'method'),
          successDataParser: any(named: 'successDataParser'),
        ),
      ).thenAnswer((_) async => right(user));

      final result = await profileRepository.getUserProfile(userId);

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected right, got left'),
        (r) => expect(r.email, email),
      );
    });

    test('getUserProfile failure', () async {
      when(
        () => mockReqResService.fetch<User>(
          any(),
          method: any(named: 'method'),
          successDataParser: any(named: 'successDataParser'),
        ),
      ).thenAnswer((_) async => left(const UnknownError()));

      final result = await profileRepository.getUserProfile(userId);

      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l, isA<UnknownError>()),
        (r) => fail('Expected left, got right'),
      );
    });

    test('updateUserProfile success', () async {
      final updatedUser = user.copyWith(email: 'updated@example.com');
      when(
        () => mockReqResService.fetch<User>(
          any(),
          method: any(named: 'method'),
          successDataParser: any(named: 'successDataParser'),
        ),
      ).thenAnswer((_) async => right(updatedUser));

      final result = await profileRepository.updateUserProfile(updatedUser);

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected right, got left'),
        (r) => expect(r.email, 'updated@example.com'),
      );
    });
  });
}
