import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';



class PFHeader extends StatelessWidget implements PreferredSizeWidget {
  final List<PFLink> links;
  final String title;

  const PFHeader({
    super.key,
    required this.links,
    required this.title
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  void _showMobileMenu(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black.withValues(alpha: 0.5),
      pageBuilder: (_, __, ___) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(PFAppSize.s16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          color: PFAppColors.scaffoldBackground.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: PFAppColors.primary.withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: links
                              .asMap()
                              .entries
                              .map(
                                (entry) {
                                  final index = entry.key;
                                  final link = entry.value;
                                  final isLast = index == links.length - 1;

                                  return InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      link.onTap();
                                    },
                                    borderRadius: isLast
                                      ? const BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        )
                                      : null,
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: PFAppSize.s16,
                                        horizontal: PFAppSize.s20,
                                      ),
                                      decoration: BoxDecoration(
                                        border: isLast
                                          ? null
                                          : Border(
                                              bottom: BorderSide(
                                                color: PFAppColors.primary.withValues(alpha: 0.2),
                                                width: 0.5,
                                              ),
                                            ),
                                      ),
                                      child: PFText(
                                        link.title,
                                        style: PFAppTypography.semiBold.copyWith(
                                          fontSize: PFAppSize.s16,
                                          color: PFAppColors.defaultTextColor,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < PFAppSize.mobile;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? PFAppSize.s16 : PFAppSize.s50,
          vertical: PFAppSize.s12,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50), // Stadium border
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                color: PFAppColors.scaffoldBackground.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: PFAppColors.primary.withValues(alpha: 0.3),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: PFAppColors.primary.withValues(alpha: 0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: PFAppSize.s20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Title/Logo
                    PFGradientTitle(
                      text: title,
                    ),
                    // Navigation Links
                    if (!isMobile)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: links
                            .map(
                              (link) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: PFAppSize.s12),
                                child: PFTextLink(
                                  label: link.title,
                                  icon: link.icon,
                                  fontSize: PFAppSize.s14,
                                  onTap: link.onTap,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    // Mobile Menu Button
                    if (isMobile)
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () => _showMobileMenu(context),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
