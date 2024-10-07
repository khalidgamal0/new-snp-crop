import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomUrlLauncher with WidgetsBindingObserver {
  bool _isLaunchingUrl = false;
  bool _backToHome = false;
  Function? _onBackToHome;

  // Singleton pattern
  static final CustomUrlLauncher _instance = CustomUrlLauncher._internal();

  factory CustomUrlLauncher() {
    return _instance;
  }

  CustomUrlLauncher._internal();

  void urlLauncher(BuildContext context, String url,
      {bool backToHome = false, Function? onBackToHome}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      try {
        _isLaunchingUrl = true; // Set to true when launching URL
        _backToHome = backToHome; // Store if backToHome is needed
        _onBackToHome = onBackToHome; // Store callback function

        await launchUrl(
          Uri.parse(url),
          // Use external browser
        );

        // Optionally, you can navigate back here if needed
        // navigateBack(context);
      } catch (error) {
        print('Error launching URL: $error');
      }
    } else {
      throw 'Could not launch $url';
    }
  }

  void navigateBack(BuildContext context) {
    if (_isLaunchingUrl) {
      _isLaunchingUrl = false; // Reset the flag

      if (_backToHome) {

      }

      // Execute the callback function if provided
      if (_onBackToHome != null) {
        _onBackToHome!();
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      navigateBack(Get.context!); // Pass your context here
    }
  }

  void init() {
    WidgetsBinding.instance
        .addObserver(this); // Listen for app lifecycle changes
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Clean up
  }
}


void urlLuncher(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(
      Uri.parse(url),
    );
  } else {
    throw 'Could not launch $url';
  }
}


