import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

///ignore: must_be_immutable
class UMSidebar extends StatefulWidget {
  final ValueChanged<int>? onTap;
  double widthSwitch;
  double borderRadius;
  double sideBarWidth;
  double sideBarSmallWidth;
  List<SideBarItem> sidebarItems;
  bool settingsDivider;
  UMSidebar({
    super.key,
    this.borderRadius = 20,
    this.sideBarWidth = 260,
    this.sideBarSmallWidth = 84,
    this.settingsDivider = true,
    required this.sidebarItems,
    required this.widthSwitch,
    required this.onTap,
  });

  @override
  State<UMSidebar> createState() => _UMSidebarState();
}

class _UMSidebarState extends State<UMSidebar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;
  late double _height;
  late double _width;
  late double sideBarItemHeight = 48;
  int itemIndex = 0;
  bool _minimize = false;

  @override
  void initState() {
    super.initState();
    if (widget.sidebarItems.isEmpty) {
      throw "Side bar Items Can't be empty";
    }
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _widthAnimation =
        Tween<double>(begin: widget.sideBarSmallWidth, end: widget.sideBarWidth)
            .animate(_animationController);

    // Listen to changes in minimization to trigger animation
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void moveToNewIndex(int index) {
    setState(() {
      itemIndex = index;
    });
    widget.onTap?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    if (_width >= widget.widthSwitch &&
        !_minimize &&
        !_animationController.isCompleted) {
      _animationController.forward();
    } else if ((_width < widget.widthSwitch || _minimize) &&
        !_animationController.isDismissed) {
      _animationController.reverse();
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) => Container(
        height: _height,
        margin: const EdgeInsets.all(20),
        width: _widthAnimation.value,
        decoration: BoxDecoration(
          color: ShadTheme.of(context).colorScheme.card.withOpacity(0.9),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: child,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: _width >= widget.widthSwitch && !_minimize ? 20 : 18,
                top: 24),
            child: _width >= widget.widthSwitch && !_minimize
                ? Row(
                    children: [
                      const Icon(Icons.hexagon_outlined, size: 50),
                      Text(
                        "  Utility Master",
                        style: ShadTheme.of(context).textTheme.h4,
                      ),
                    ],
                  )
                : const Row(
                    children: [
                      Icon(Icons.hexagon_outlined, size: 50),
                    ],
                  ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                        top: 40,
                        left: _width >= widget.widthSwitch && !_minimize
                            ? 20
                            : 18,
                        right: _width >= widget.widthSwitch && !_minimize
                            ? 20
                            : 18,
                        bottom: 24),
                    child: Column(
                      children: [
                        SizedBox(
                          height: _height - 300,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (index == widget.sidebarItems.length - 1) {
                                return Container(); // Skip last item in the list
                              }
                              return sideBarItem(
                                  textStyle:
                                      ShadTheme.of(context).textTheme.table,
                                  unSelectedIconColor: ShadTheme.of(context)
                                      .colorScheme
                                      .foreground,
                                  unSelectedTextColor: ShadTheme.of(context)
                                      .colorScheme
                                      .cardForeground,
                                  widthSwitch: widget.widthSwitch,
                                  minimize: _minimize,
                                  height: sideBarItemHeight,
                                  hoverColor: ShadTheme.of(context)
                                      .colorScheme
                                      .selection,
                                  splashColor: ShadTheme.of(context)
                                      .colorScheme
                                      .background,
                                  highlightColor: ShadTheme.of(context)
                                      .colorScheme
                                      .background,
                                  width: _width,
                                  icon: widget
                                          .sidebarItems[index].iconUnselected ??
                                      widget.sidebarItems[index].iconSelected,
                                  text: widget.sidebarItems[index].text,
                                  onTap: () => moveToNewIndex(index),
                                  isSelected: index == itemIndex);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 8);
                            },
                            itemCount: widget.sidebarItems.length - 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Moving last item to the bottom:
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: sideBarItem(
                textStyle: ShadTheme.of(context).textTheme.table,
                unSelectedIconColor:
                    ShadTheme.of(context).colorScheme.foreground,
                unSelectedTextColor:
                    ShadTheme.of(context).colorScheme.cardForeground,
                widthSwitch: widget.widthSwitch,
                minimize: _minimize,
                height: sideBarItemHeight,
                hoverColor: ShadTheme.of(context).colorScheme.selection,
                splashColor: ShadTheme.of(context).colorScheme.background,
                highlightColor: ShadTheme.of(context).colorScheme.background,
                width: _width,
                icon: widget.sidebarItems.last.iconUnselected ??
                    widget.sidebarItems.last.iconSelected,
                text: widget.sidebarItems.last.text,
                onTap: () => moveToNewIndex(widget.sidebarItems.length - 1),
                isSelected: itemIndex == widget.sidebarItems.length - 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget sideBarItem({
  required IconData icon,
  required String text,
  required double width,
  required double widthSwitch,
  required bool minimize,
  required double height,
  required Color hoverColor,
  required Color unSelectedIconColor,
  required Color splashColor,
  required Color highlightColor,
  required Color unSelectedTextColor,
  required Function() onTap,
  required TextStyle textStyle,
  required bool isSelected,
}) {
  return Material(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(12),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    child: InkWell(
      onTap: onTap,
      hoverColor: hoverColor,
      splashColor: splashColor,
      highlightColor: highlightColor,
      child: Container(
        color: isSelected
            ? Colors.grey
            : Colors.transparent, // Highlight if selected
        height: height,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              icon,
              color: unSelectedIconColor,
            ),
            if (width >= widthSwitch && !minimize)
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  text,
                  overflow: TextOverflow.clip,
                  style: textStyle.copyWith(color: unSelectedTextColor),
                  textAlign: TextAlign.left,
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

class SideBarItem {
  final IconData iconSelected;
  final IconData? iconUnselected;
  final String text;
  bool isSelected = false; // Add this property

  SideBarItem({
    required this.iconSelected,
    this.iconUnselected,
    required this.text,
  });
}
