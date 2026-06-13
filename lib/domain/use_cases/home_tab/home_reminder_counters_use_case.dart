import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/home_reminder_counters_response/home_reminder_counters_response.dart';
import 'package:sijil_patient_portal/domain/repositories/home_tab/home_tab_repository.dart';

@injectable
class HomeReminderCountersUseCase {
  HomeTabRepository homeTabRepository;
  HomeReminderCountersUseCase({required this.homeTabRepository});
  Future<HomeReminderCountersResponse> invoke() {
    return homeTabRepository.homeReminderCounters();
  }
}
