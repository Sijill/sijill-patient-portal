import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/today_schedule_response/today_schedule_response.dart';
import 'package:sijil_patient_portal/domain/repositories/home_tab/home_tab_repository.dart';

@injectable
class TodayScheduleUseCase {
  HomeTabRepository homeTabRepository;
  TodayScheduleUseCase({required this.homeTabRepository});
  Future<TodayScheduleResponse> invoke() {
    return homeTabRepository.getTodaySchedule();
  }
}
