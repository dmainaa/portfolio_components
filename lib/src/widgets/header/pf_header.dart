import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_size.dart';
import '../common/models/pf_link.dart';
import '../text/pf_text_link.dart';



class PFHeader extends StatelessWidget implements PreferredSizeWidget {
  final List<PFLink> links;
  final String title;

  const PFHeader({
    super.key,
    required this.links,
    required this.title
  });

  @override
  Size get preferredSize => const Size.fromHeight(PFAppSize.s64);

  void _showMobileMenu(BuildContext context) {
    final appBarHeight = preferredSize.height;
    final screenWidth = MediaQuery.of(context).size.width;

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: '',
      pageBuilder: (_, __, ___) {
        return Stack(
          children: [
            Positioned(
              top: appBarHeight,
              left: 0,
              right: 0,
              child: Material(
                elevation: 4, // default dialog elevation
                color: PFAppColors.scaffoldBackground,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: links
                      .map(
                        (link) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: PFAppSize.s12,
                            horizontal: PFAppSize.s20,
                          ),
                          child: PFTextLink(
                            label: link.title,
                            icon: link.icon,
                            fontSize: PFAppSize.s14, // smaller links
                            onTap: () {
                              Navigator.pop(context);
                              link.onTap();
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < PFAppSize.mobile;

    return Container(
            decoration: BoxDecoration(
        color: PFAppColors.scaffoldBackground,
        border: Border(
          bottom: BorderSide(
            color: PFAppColors.primary,
            width: 1, // thin bottom border
          ),
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: PFAppSize.s20, // keep it aligned left with padding
        title:  Align(
          alignment: Alignment.centerLeft,
          child: PFGradientTitle(
            text: title,
            
          ),
        ),
        actions: [
          if (!isMobile)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: PFAppSize.s20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: links
                    .map(
                      (link) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: PFAppSize.s12),
                        child: PFTextLink(
                          label: link.title,
                          icon: link.icon,
                          fontSize: PFAppSize.s14, // smaller links
                          onTap: link.onTap,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => _showMobileMenu(context),
            ),
        ],
      ),
    );
  }
}
