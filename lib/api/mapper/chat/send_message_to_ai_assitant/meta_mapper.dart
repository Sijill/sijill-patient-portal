import 'package:sijil_patient_portal/api/model/chat/response/send_message_to_ai_assistant_response/meta_dto.dart';
import 'package:sijil_patient_portal/domain/entities/chat/response/send_message_to_ai_assistant_response/meta.dart';

extension MetaMapper on MetaDto {
  Meta convertToMeta() {
    return Meta(latencyMs: latencyMs, model: model);
  }
}
