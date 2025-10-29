import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';

class PFResumeDialog extends StatelessWidget {
  final PFResume resume;
  final VoidCallback? onDownloadPDF;

  const PFResumeDialog({
    super.key,
    required this.resume,
    this.onDownloadPDF,
  });

  static Future<void> show(
    BuildContext context, {
    required PFResume resume,
    VoidCallback? onDownloadPDF,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Resume',
      barrierColor: Colors.black.withValues(alpha: 0.7),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.9, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: PFResumeDialog(
              resume: resume,
              onDownloadPDF: onDownloadPDF,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < PFAppSize.mobile;

    return SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(isMobile ? PFAppSize.s16 : PFAppSize.s50),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 900,
                    maxHeight: size.height * 0.9,
                  ),
                  decoration: BoxDecoration(
                    color: PFAppColors.scaffoldBackground.withValues(alpha: 0.95),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: PFAppColors.primary.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildHeader(context),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(
                            isMobile ? PFAppSize.s20 : PFAppSize.s40,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildResumeHeader(),
                              const PFSpacer(size: PFAppSize.s40),
                              _buildSummary(),
                              const PFSpacer(size: PFAppSize.s40),
                              _buildWorkExperience(),
                              const PFSpacer(size: PFAppSize.s40),
                              _buildEducation(),
                              const PFSpacer(size: PFAppSize.s40),
                              _buildSkills(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: PFAppSize.s20,
        vertical: PFAppSize.s16,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: PFAppColors.primary.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PFText(
              'Resume',
              style: PFAppTypography.bold.copyWith(
                fontSize: PFAppSize.s24,
                color: PFAppColors.defaultTextColor,
              ),
              maxLines: 1,
            ),
          ),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (onDownloadPDF != null)
                  TextButton.icon(
                    onPressed: onDownloadPDF,
                    icon: const Icon(
                      Icons.download,
                      color: PFAppColors.primary,
                      size: 20,
                    ),
                    label: PFText(
                      'Download PDF',
                      style: PFAppTypography.semiBold.copyWith(
                        fontSize: PFAppSize.s14,
                        color: PFAppColors.primary,
                      ),
                      maxLines: 1,
                    ),
                  ),
                const SizedBox(width: PFAppSize.s8),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResumeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(PFAppSize.s24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                PFAppColors.primary.withValues(alpha: 0.3),
                PFAppColors.accent.withValues(alpha: 0.3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(PFAppSize.s12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PFText(
                resume.name,
                style: PFAppTypography.bold.copyWith(
                  fontSize: 32,
                  color: PFAppColors.defaultTextColor,
                ),
                maxLines: 3,
              ),
              const PFSpacer(size: PFAppSize.s8),
              PFText(
                resume.title,
                style: PFAppTypography.semiBold.copyWith(
                  fontSize: 20,
                  color: PFAppColors.accent,
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
        const PFSpacer(size: PFAppSize.s20),
        Wrap(
          spacing: PFAppSize.s24,
          runSpacing: PFAppSize.s12,
          children: [
            _buildContactItem(Icons.email, resume.email),
            _buildContactItem(Icons.phone, resume.phone),
            _buildContactItem(Icons.location_on, resume.location),
            _buildContactItem(Icons.language, resume.website),
          ],
        ),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: PFAppColors.primary, size: 16),
        const SizedBox(width: PFAppSize.s8),
        Flexible(
          child: PFText(
            text,
            style: PFAppTypography.regular.copyWith(
              fontSize: PFAppSize.s14,
              color: PFAppColors.defaultTextColor,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }

  Widget _buildSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Professional Summary'),
        const PFSpacer(size: PFAppSize.s16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(PFAppSize.s20),
          decoration: BoxDecoration(
            color: PFAppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(PFAppSize.s12),
            border: Border.all(
              color: PFAppColors.primary.withValues(alpha: 0.2),
            ),
          ),
          child: PFText(
            resume.summary,
            style: PFAppTypography.regular.copyWith(
              fontSize: PFAppSize.s14,
              color: PFAppColors.defaultTextColor,
              height: 1.6,
            ),
            maxLines: null,
          ),
        ),
      ],
    );
  }

  Widget _buildWorkExperience() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Work Experience', icon: Icons.work),
        const PFSpacer(size: PFAppSize.s16),
        ...resume.workExperience.map((exp) => Padding(
              padding: const EdgeInsets.only(bottom: PFAppSize.s24),
              child: _buildExperienceCard(exp),
            )),
      ],
    );
  }

  Widget _buildExperienceCard(PFWorkExperience experience) {
    return Container(
      padding: const EdgeInsets.all(PFAppSize.s20),
      decoration: BoxDecoration(
        border: Border.all(
          color: PFAppColors.primary.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.circular(PFAppSize.s12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PFText(
                      experience.position,
                      style: PFAppTypography.bold.copyWith(
                        fontSize: PFAppSize.s16,
                        color: PFAppColors.defaultTextColor,
                      ),
                      maxLines: null,
                    ),
                    const PFSpacer(size: PFAppSize.s4),
                    PFText(
                      experience.company,
                      style: PFAppTypography.regular.copyWith(
                        fontSize: PFAppSize.s14,
                        color: PFAppColors.accent,
                      ),
                      maxLines: null,
                    ),
                  ],
                ),
              ),
              Flexible(
                child: PFText(
                  experience.period,
                  style: PFAppTypography.semiBold.copyWith(
                    fontSize: PFAppSize.s12,
                    color: PFAppColors.primary,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const PFSpacer(size: PFAppSize.s12),
          PFText(
            experience.description,
            style: PFAppTypography.regular.copyWith(
              fontSize: PFAppSize.s14,
              color: PFAppColors.defaultTextColor,
              height: 1.5,
            ),
            maxLines: null,
          ),
          if (experience.achievements.isNotEmpty) ...[
            const PFSpacer(size: PFAppSize.s12),
            ...experience.achievements.map(
              (achievement) => Padding(
                padding: const EdgeInsets.only(bottom: PFAppSize.s8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6, right: 12),
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: PFAppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Expanded(
                      child: PFText(
                        achievement,
                        style: PFAppTypography.regular.copyWith(
                          fontSize: PFAppSize.s14,
                          color: PFAppColors.defaultTextColor,
                        ),
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEducation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Education', icon: Icons.school),
        const PFSpacer(size: PFAppSize.s16),
        ...resume.education.map((edu) => Padding(
              padding: const EdgeInsets.only(bottom: PFAppSize.s16),
              child: Container(
                padding: const EdgeInsets.all(PFAppSize.s20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: PFAppColors.primary.withValues(alpha: 0.2),
                  ),
                  borderRadius: BorderRadius.circular(PFAppSize.s12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PFText(
                            edu.degree,
                            style: PFAppTypography.bold.copyWith(
                              fontSize: PFAppSize.s16,
                              color: PFAppColors.defaultTextColor,
                            ),
                            maxLines: null,
                          ),
                          const PFSpacer(size: PFAppSize.s4),
                          PFText(
                            edu.institution,
                            style: PFAppTypography.regular.copyWith(
                              fontSize: PFAppSize.s14,
                              color: PFAppColors.accent,
                            ),
                            maxLines: null,
                          ),
                          if (edu.description != null) ...[
                            const PFSpacer(size: PFAppSize.s8),
                            PFText(
                              edu.description!,
                              style: PFAppTypography.regular.copyWith(
                                fontSize: PFAppSize.s14,
                                color: PFAppColors.defaultTextColor,
                              ),
                              maxLines: null,
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(width: PFAppSize.s12),
                    Flexible(
                      child: PFText(
                        edu.period,
                        style: PFAppTypography.semiBold.copyWith(
                          fontSize: PFAppSize.s12,
                          color: PFAppColors.primary,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildSkills() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Skills', icon: Icons.code),
        const PFSpacer(size: PFAppSize.s16),
        Wrap(
          spacing: PFAppSize.s12,
          runSpacing: PFAppSize.s12,
          children: resume.skills
              .map((skill) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: PFAppSize.s16,
                      vertical: PFAppSize.s8,
                    ),
                    decoration: BoxDecoration(
                      color: PFAppColors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(PFAppSize.s20),
                      border: Border.all(
                        color: PFAppColors.primary.withValues(alpha: 0.3),
                      ),
                    ),
                    child: PFText(
                      skill,
                      style: PFAppTypography.semiBold.copyWith(
                        fontSize: PFAppSize.s14,
                        color: PFAppColors.defaultTextColor,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, {IconData? icon}) {
    return Row(
      children: [
        if (icon != null) ...[
          Icon(icon, color: PFAppColors.accent, size: 24),
          const SizedBox(width: PFAppSize.s12),
        ],
        Expanded(
          child: PFText(
            title,
            style: PFAppTypography.bold.copyWith(
              fontSize: PFAppSize.s20,
              color: PFAppColors.accent,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
