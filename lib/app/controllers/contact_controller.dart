import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  final RxBool isSubmitting = false.obs;
  final RxString formStatusMessage = ''.obs;

  // Contact Info matching prompt
  final String phone = '01616945469';
  final String email = 'forhdalam502@gmail.com';
  final String github = 'https://github.com/forhad-05';
  final String linkedin = 'https://www.linkedin.com/in/md-forhad-alam-11104b2b8';
  final String facebook = 'https://www.facebook.com/forhadalam.sajid';

  Future<void> launchURL(String urlString) async {
    final Uri uri = Uri.parse(urlString);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar('Error', 'Could not open link: $urlString',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': 'Portfolio Inquiry from ${nameController.text}',
        'body': messageController.text,
      },
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      Get.snackbar('Contact', 'Opening mail app for $email');
    }
  }

  void submitForm() async {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        messageController.text.trim().isEmpty) {
      Get.snackbar(
        'Required Fields',
        'Please complete all fields before sending.',
        backgroundColor: Colors.redAccent.withOpacity(0.8),
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isSubmitting.value = true;
    await Future.delayed(const Duration(seconds: 1));
    isSubmitting.value = false;

    Get.snackbar(
      'Message Sent',
      'Thank you ${nameController.text}! Your message has been received.',
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );

    nameController.clear();
    emailController.clear();
    messageController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.onClose();
  }
}
