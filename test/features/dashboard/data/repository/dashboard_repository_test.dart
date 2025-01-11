import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_list_app/core/exceptions/app_exceptions.dart';
import 'package:todo_list_app/core/services/network_service/instances.dart';
import 'package:todo_list_app/core/services/network_service/network_service.dart';
import 'package:todo_list_app/core/shared/domain/entities/user.dart';
import 'package:todo_list_app/features/dashboard/data/repository/dashboard_repository.dart';

class MockReqResService extends Mock implements ReqResService {}

void main() {
  late DashboardRepository dashboardRepository;
  late MockReqResService mockReqResService;

  setUp(() {
    mockReqResService = MockReqResService();
    dashboardRepository = DashboardRepository(reqResService: mockReqResService);
  });

  setUpAll(() {
    registerFallbackValue(Uri());
    registerFallbackValue(DioRequestMethod.get);
    registerFallbackValue(<String, dynamic>{});
  });

  group('DashboardRepository', () {
    test('getUsers success', () async {
      final users = [const User(id: 1, email: 'test@example.com')].toIList();
      when(
        () => mockReqResService.fetch<IList<User>>(
          any<String>(),
          method: any(named: 'method'),
          successDataParser: any(named: 'successDataParser'),
        ),
      ).thenAnswer((_) async => right(users));

      final result = await dashboardRepository.getUsers();

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('Expected right, got left'),
        (r) => expect(r, users),
      );
    });

    test('getUsers failure', () async {
      when(
        () => mockReqResService.fetch<IList<User>>(
          any<String>(),
          method: any(named: 'method'),
          successDataParser: any(named: 'successDataParser'),
        ),
      ).thenAnswer((_) async => left(const UnknownError()));

      final result = await dashboardRepository.getUsers();

      expect(result.isLeft(), true);
      result.fold(
        (l) => expect(l, isA<UnknownError>()),
        (r) => fail('Expected left, got right'),
      );
    });
  });
}
