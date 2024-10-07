import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/presentation/widgets/responsive_space.dart';
import '../../../../core/routes/app_navigators.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_styles.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';

class WebView extends StatefulWidget {
   const WebView({super.key, required this.startDate, required this.endDate,
     // required this.url
   });
    final String startDate,endDate;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final controller ;
  final _flutterMediaDownloaderPlugin = MediaDownload();

  @override
  void initState() {
    super.initState();

  controller =
    WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
          setState(() {

          });
        },
        onPageStarted: (String url) {
          setState(() {

          });
        },
        onPageFinished: (String url)async {
          _flutterMediaDownloaderPlugin.downloadMedia(context,'https://riyaldigitel.com/transactions-with-mobile-filter?account_id=1&&start_date=${widget.startDate}&&end_date=${widget.endDate}');
        },

      ),
    )

      ..loadRequest(Uri.parse('https://riyaldigitel.com/transactions-with-mobile-filter?account_id=1&&start_date=${widget.startDate}&&end_date=${widget.endDate}'));
    }


   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         leading: Image.asset(AppImages.drawerIcon),
         title: Text(
           'تفاصيل العمليات',
           style: AppTextStyles.textStyle16,
         ),
         backgroundColor: AppColors.secondary,
         centerTitle: true,
         actions: [
           GestureDetector(
               onTap: () {
                 goBack();
               },
               child: const Icon(
                 Icons.arrow_forward_ios,
                 color: Colors.white,
               )),
           horizontalSpacer(20)
         ],
       ),
       body: WebViewWidget(controller: controller),
     );
   }
}
