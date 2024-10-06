import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/presentation/widgets/responsive_space.dart';
import '../../../../core/routes/app_navigators.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_text_styles.dart';

class WebView extends StatefulWidget {
   const WebView({super.key,
     // required this.url
   });
   // final String url;

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
   final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)

    ..loadRequest(Uri.parse('https://https://youtube.com'));
  @override
  void initState() {

  //    controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //
  //     ..loadRequest(Uri.parse('https://riyaldigitel.com/api/transactions-with-mobile-filter?account_id=1&&start_date="2024-08-21&&end_date="2024-08-31'));    super.initState();
  //
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
