import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/home_tab/home_tab_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/home_reminder_counters_response/home_reminder_counters_response.dart';
import 'package:sijil_patient_portal/domain/repositories/home_tab/home_tab_repository.dart';

@Injectable(as: HomeTabRepository)
class HomeTabRepositoryImpl extends HomeTabRepository {
  HomeTabDataSources homeTabDataSources;
  HomeTabRepositoryImpl({required this.homeTabDataSources});
  @override
  Future<HomeReminderCountersResponse> homeReminderCounters() {
    return homeTabDataSources.homeReminderCounters();
  }
}
