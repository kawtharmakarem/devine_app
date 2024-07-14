import 'dart:io';

import 'package:divinecontrol/utils/app_constants.dart';
import 'package:divinecontrol/utils/app_pdffiles.dart';
import 'package:divinecontrol/widgets/settings_widgets/custom_pdfbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ReferencesScreen extends StatefulWidget {
  const ReferencesScreen({super.key});

  @override
  State<ReferencesScreen> createState() => _ReferencesScreenState();
}

class _ReferencesScreenState extends State<ReferencesScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return SettingsScreen(
      title: "References",
      children: [
        SizedBox(
          height: height * 0.03,
        ),
        CustomPdfButton(
          title: 'About Us',
          onTap: () async {
            const path = AppPdf.aboutUs;
            final file = await PDFApi.loadAssets(path);
            openPDF(file);
          },
        ),
        SizedBox(
          height: height * 0.03,
        ),
        CustomPdfButton(
          title: 'Disclaimer',
          onTap: () async {
            const path = AppPdf.disclaimer;
            final file = await PDFApi.loadAssets(path);
            openPDF(file);
          },
        ),
        SizedBox(
          height: height * 0.03,
        ),
        CustomPdfButton(
          title: 'FAQS',
          onTap: () async {
            const path = AppPdf.fAQS;
            final file = await PDFApi.loadAssets(path);
            openPDF(file);
          },
        ),
        SizedBox(
          height: height * 0.03,
        ),
        CustomPdfButton(
          title: 'privacy policy',
          onTap: () async {
            const path = AppPdf.privacyPolicy;
            final file = await PDFApi.loadAssets(path);
            openPDF(file);
          },
        ),
        SizedBox(
          height: height * 0.03,
        ),
        CustomPdfButton(
          title: 'terms and conditions',
          onTap: () async {
            const path = AppPdf.termsAndConditions;
            final file = await PDFApi.loadAssets(path);
            openPDF(file);
          },
        ),
      ],
    );
  }

  void openPDF(File file) {
    // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //   return PDFViewerPage(file: file,);
    // }));
    Get.to(() => PDFViewerPage(file: file),
        transition: Transition.size,
        duration: const Duration(seconds: AppConstants.durationSecond));
  }
}

class PDFApi {
  static Future<File> loadAssets(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    return _storeFile(path, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationCacheDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}

class PDFViewerPage extends StatefulWidget {
  const PDFViewerPage({super.key, required this.file});
  final File file;

  @override
  State<PDFViewerPage> createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}
