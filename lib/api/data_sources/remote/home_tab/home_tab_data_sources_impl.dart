import 'package:injectable/injectable.dart';
import 'package:sijil_patient_portal/api/mapper/home_tab/home_reminder_counters_mapper.dart';
import 'package:sijil_patient_portal/api/web_service.dart';
import 'package:sijil_patient_portal/data/data_sources/remote/home_tab/home_tab_data_sources.dart';
import 'package:sijil_patient_portal/domain/entities/home_tab/response/home_reminder_counters_response/home_reminder_counters_response.dart';

@Injectable(as: HomeTabDataSources)
class HomeTabDataSourcesImpl extends HomeTabDataSources {
  WebService webService;
  HomeTabDataSourcesImpl({required this.webService});
  @override
  Future<HomeReminderCountersResponse> homeReminderCounters() async {
    final homeReminderCountersResponseDto = await webService
        .homeReminderCounters();

    //todo: HomeReminderCountersResponseDto => HomeReminderCountersResponse
    return homeReminderCountersResponseDto
        .convertToHomeReminderCountersResponse();
  }
}
