import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../styles/color.dart';
import '../../../widget/default_text.dart';

class PDFSViewerScreen extends StatefulWidget {
  final String text;
  final File selectedCV;

  const PDFSViewerScreen({super.key, required this.text, required this.selectedCV});

  @override
  State<PDFSViewerScreen> createState() => _PDFSViewerScreenState();
}

class _PDFSViewerScreenState extends State<PDFSViewerScreen> with WidgetsBindingObserver {
late PdfViewerController pdfViewerController;

@override
  void initState() {
    // TODO: implement initState
  pdfViewerController = PdfViewerController();
  super.initState();

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      appBarTitlePDF(widget.text, context),
      body: SfPdfViewer.file(widget.selectedCV,
        controller: pdfViewerController,
      ),
    );
  }
AppBar appBarTitlePDF(String title, context, {Color? backgroundColor}) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Iconsax.arrow_left,
        color: AppTheme.black,
      ),
    ),
    backgroundColor: AppTheme.white,
    title: DefaultText(
        text: title,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppTheme.black),
    centerTitle: true,
  );
}

}