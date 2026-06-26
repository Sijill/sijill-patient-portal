import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:sijil_patient_portal/core/utils/app_assets.dart';

import 'package:sijil_patient_portal/domain/entities/medical_history/response/get_medical_history_response/get_medical_history_response.dart';

String safeFileName(String name) {
  final cleaned = name
      .trim()
      .replaceAll(RegExp(r'\.pdf$', caseSensitive: false), '')
      .replaceAll(RegExp(r'[<>:"/\\|?*]'), '')
      .replaceAll(RegExp(r'\s+'), '_')
      .replaceAll(RegExp(r'_+'), '_');

  return cleaned.isEmpty ? 'Medical_History' : cleaned;
}

Future<void> printPdf(GetMedicalHistoryResponse data) async {
  final encounter = data.encounter;

  if (encounter == null) return;

  final pdf = pw.Document();

  final logoSvg = await rootBundle.loadString(AppAssets.logo);

  String formatDate(DateTime? date) {
    if (date == null) {
      return '-';
    }

    return DateFormat('dd MMM yyyy').format(date);
  }

  pdf.addPage(
    pw.MultiPage(
      margin: const pw.EdgeInsets.all(24),

      build: (_) => [
        /// HEADER
        pw.Container(
          width: double.infinity,

          padding: const pw.EdgeInsets.all(20),

          decoration: pw.BoxDecoration(
            color: PdfColors.teal50,

            borderRadius: pw.BorderRadius.circular(12),
          ),

          child: pw.Column(
            children: [
              pw.SvgImage(svg: logoSvg, height: 100, width: 91),

              pw.SizedBox(height: 16),

              pw.Text(
                'Medical History',

                style: pw.TextStyle(
                  fontSize: 26,

                  fontWeight: pw.FontWeight.bold,
                ),
              ),

              pw.SizedBox(height: 8),

              pw.Text(formatDate(encounter.encounterDate)),
            ],
          ),
        ),

        pw.SizedBox(height: 24),

        /// INFO
        _card(
          title: 'Encounter Information',

          child: pw.Column(
            children: [
              _row('Doctor', encounter.doctorName),

              _row('Speciality', encounter.doctorSpeciality),

              _row('Location', encounter.location),
            ],
          ),
        ),

        /// PRIMARY
        if (encounter.primaryDiagnosis != null) ...[
          pw.SizedBox(height: 20),

          _card(
            title: 'Primary Diagnosis',

            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,

              children: [
                pw.Text(
                  encounter.primaryDiagnosis?.icd11Title ?? '',

                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),

                pw.SizedBox(height: 4),

                pw.Text(encounter.primaryDiagnosis?.icd11Code ?? ''),
              ],
            ),
          ),
        ],

        /// SYMPTOMS
        if (!(encounter.symptomsAndComplaints?.isEmpty ?? true)) ...[
          pw.SizedBox(height: 20),

          _card(
            title: 'Symptoms & Complaints',

            child: pw.Column(
              children: encounter.symptomsAndComplaints!
                  .map((e) => pw.Bullet(text: e.toString()))
                  .toList(),
            ),
          ),
        ],

        /// DIAGNOSES
        if (!(encounter.diagnoses?.isEmpty ?? true)) ...[
          pw.SizedBox(height: 20),

          _card(
            title: 'Diagnoses',

            child: pw.Column(
              children: encounter.diagnoses!
                  .map(
                    (d) => pw.Container(
                      width: double.infinity,

                      margin: const pw.EdgeInsets.only(bottom: 10),

                      padding: const pw.EdgeInsets.all(12),

                      decoration: pw.BoxDecoration(
                        border: pw.Border.all(color: PdfColors.grey300),
                      ),

                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,

                        children: [
                          pw.Text(
                            d.icd11Title ?? '',

                            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                          ),

                          pw.SizedBox(height: 4),

                          pw.Text('ICD: ${d.icd11Code}'),

                          if (d.clinicalDescription?.isNotEmpty ?? false)
                            pw.Padding(
                              padding: const pw.EdgeInsets.only(top: 8),

                              child: pw.Text(d.clinicalDescription!),
                            ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],

        /// MEDICATIONS
        if (!(encounter.prescribedMedications?.isEmpty ?? true)) ...[
          pw.NewPage(freeSpace: 180),

          _card(
            title: 'Prescribed Medications',

            child: pw.Table(
              border: pw.TableBorder.all(),

              columnWidths: {
                0: const pw.FlexColumnWidth(2),

                1: const pw.FlexColumnWidth(1.5),

                2: const pw.FlexColumnWidth(3),
              },

              children: [
                pw.TableRow(
                  children: [
                    _cell('Medication'),

                    _cell('Dose'),

                    _cell('Frequency'),
                  ],
                ),

                ...encounter.prescribedMedications!.map(
                  (m) => pw.TableRow(
                    children: [
                      _cell(m.medicationName ?? ''),

                      _cell('${m.dosageAmount ?? ''} ${m.dosageUnit ?? ''}'),

                      _cell(m.frequency ?? ''),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    ),
  );

  final fileName = safeFileName('Medical History');

  await Printing.layoutPdf(
    name: fileName.endsWith('.pdf') ? fileName : '$fileName.pdf',
    onLayout: (_) async => pdf.save(),
  );
}

pw.Widget _card({required String title, required pw.Widget child}) {
  return pw.Container(
    width: double.infinity,

    padding: const pw.EdgeInsets.all(16),

    decoration: pw.BoxDecoration(
      border: pw.Border.all(color: PdfColors.grey),

      borderRadius: pw.BorderRadius.circular(10),
    ),

    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,

      children: [
        pw.Text(
          title,

          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),

        pw.SizedBox(height: 12),

        child,
      ],
    ),
  );
}

pw.Widget _row(String title, dynamic value) {
  return pw.Padding(
    padding: const pw.EdgeInsets.only(bottom: 10),

    child: pw.Row(
      children: [
        pw.Expanded(flex: 2, child: pw.Text(title)),

        pw.Expanded(flex: 4, child: pw.Text(value?.toString() ?? '-')),
      ],
    ),
  );
}

pw.Widget _cell(String text) {
  return pw.Padding(padding: const pw.EdgeInsets.all(8), child: pw.Text(text));
}
