
import 'package:flutter/material.dart';
import 'package:portfolio_components/portfolio_components.dart';
import 'package:portfolio_components/src/widgets/common/models/pf_tab_item.dart';

/// A responsive tab layout that only handles the tab buttons
class PFTabLayout extends StatefulWidget {
  final List<PFTabItem> items;
  final ValueChanged<int> onTabSelected;

  const PFTabLayout({
    super.key,
    required this.items,
    required this.onTabSelected,
  });

  @override
  State<PFTabLayout> createState() => _PFTabLayoutState();
}

class _PFTabLayoutState extends State<PFTabLayout> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < PFAppSize.mobile;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: isMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: List.generate(widget.items.length, (index) {
          final isSelected = _selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: OutlinedButton(
              onPressed: () {
                setState(() => _selectedIndex = index);
                widget.onTabSelected(index);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: isSelected
                    ? PFAppColors.primary
                    : PFAppColors.scaffoldBackground,
                foregroundColor: isSelected ? Colors.white : PFAppColors.primary,
                side: BorderSide(color: PFAppColors.primary),
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
              ),
              child: PFText(
                widget.items[index].name,
                style: PFAppTypography.semiBold,
                fontSize: PFAppSize.s14,
                textColor: isSelected ? Colors.white : PFAppColors.primary,
              ),
            ),
          );
        }),
      ),
    );
  }
}
