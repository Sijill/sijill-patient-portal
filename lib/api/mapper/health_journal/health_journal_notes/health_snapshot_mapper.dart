import 'package:sijil_patient_portal/api/model/health_journal/response/health_journal_notes/health_snapshot_dto.dart';
import 'package:sijil_patient_portal/domain/entities/health_journal/response/health_journal_notes/health_snapshot.dart';

extension HealthSnapshotMapper on HealthSnapshotDto {
  HealthSnapshot convertToHealthSnapshot() {
    return HealthSnapshot(
      advice: advice,
      disclaimer: disclaimer,
      model: model,
      status: status,
      summary: summary,
      unavailableReason: unavailableReason,
      urgencyLevel: urgencyLevel,
      watchouts: watchouts,
      whenToContactDoctor: whenToContactDoctor,
    );
  }
}
