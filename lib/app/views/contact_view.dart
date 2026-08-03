import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';
import '../theme/app_colors.dart';
import '../widgets/section_header.dart';
import '../widgets/custom_button.dart';

class ContactView extends GetView<ContactController> {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 850;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.0 : 60.0,
        vertical: 40.0,
      ),
      child: Column(
        children: [
          const SectionHeader(
            title: "Get In Touch",
            subtitle: "Contact Information & Form",
          ),
          const SizedBox(height: 30),
          isMobile
              ? Column(
                  children: [
                    _buildContactInfoCards(),
                    const SizedBox(height: 30),
                    _buildContactForm(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: _buildContactInfoCards()),
                    const SizedBox(width: 40),
                    Expanded(flex: 6, child: _buildContactForm()),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildContactInfoCards() {
    return Column(
      children: [
        _buildInfoCard(
          icon: Icons.phone_android_rounded,
          title: "Phone Number",
          value: controller.phone,
          onTap: () => controller.launchURL('tel:${controller.phone}'),
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          icon: Icons.email_rounded,
          title: "Email Address",
          value: controller.email,
          onTap: () => controller.sendEmail(),
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          icon: Icons.code_rounded,
          title: "GitHub Profile",
          value: controller.github,
          onTap: () => controller.launchURL(controller.github),
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          icon: Icons.work_rounded,
          title: "LinkedIn Profile",
          value: controller.linkedin,
          onTap: () => controller.launchURL(controller.linkedin),
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          icon: Icons.facebook_rounded,
          title: "Facebook Profile",
          value: controller.facebook,
          onTap: () => controller.launchURL(controller.facebook),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(color: AppColors.surfaceLight),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.secondary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: AppColors.secondary, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded,
                size: 14, color: AppColors.textMuted),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(color: AppColors.surfaceLight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Send Me a Message",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Feel free to reach out for collaborations or inquiries.",
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          _buildTextField(
            controller: controller.nameController,
            label: "Your Name",
            icon: Icons.person_outline_rounded,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: controller.emailController,
            label: "Your Email",
            icon: Icons.mail_outline_rounded,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: controller.messageController,
            label: "Your Message",
            icon: Icons.chat_bubble_outline_rounded,
            maxLines: 4,
          ),
          const SizedBox(height: 24),
          Obx(
            () => SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: controller.isSubmitting.value ? "Sending..." : "Send Message",
                icon: Icons.send_rounded,
                onPressed: () => controller.submitForm(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      style: const TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.textSecondary),
        prefixIcon: Icon(icon, color: AppColors.primaryLight, size: 20),
        filled: true,
        fillColor: AppColors.surface,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.surfaceLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.secondary, width: 2),
        ),
      ),
    );
  }
}
