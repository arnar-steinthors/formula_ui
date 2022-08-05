import 'package:flutter/material.dart';
import 'package:formula/widgets/formula_image.dart';
import 'package:formula/widgets/size_transition_wrapper.dart';

/// This setup does not work, will have to redo how the screen is set up
class ScreenBaseOld extends StatefulWidget {
  const ScreenBaseOld._({
    Key? key,
    required this.children,
    required this.icon,
    required this.backgroundColor,
    required this.title,
    required this.activeColor,
  }) : super(key: key);

  final List<Widget> children;
  final Widget icon;
  final Color backgroundColor;
  final Color activeColor;
  final String title;

  factory ScreenBaseOld.standings({required List<Widget> children}) {
    return ScreenBaseOld._(
      icon: FormulaImage.logoWhite(
        width: 50,
        height: 50,
      ),
      backgroundColor: Colors.black,
      activeColor: Colors.white,
      title: 'Standings',
      children: children,
    );
  }

  factory ScreenBaseOld.drivers({required List<Widget> children}) {
    return ScreenBaseOld._(
      icon: FormulaImage.logoBlack(
        width: 50,
        height: 50,
      ),
      backgroundColor: Colors.white,
      title: 'Drivers',
      activeColor: Colors.black,
      children: children,
    );
  }

  @override
  State<ScreenBaseOld> createState() => _ScreenBaseOldState();
}

class _ScreenBaseOldState extends State<ScreenBaseOld> {
  // ignore, part of unsuccessful attempt
  static const double _kNormalDividerHeight = 10;
  static const double _kOnDragDividerHeight = 40;
  late double dividerHeight;

  @override
  void initState() {
    dividerHeight = _kNormalDividerHeight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.icon,
                  Icon(
                    Icons.menu,
                    color: widget.activeColor,
                  ),
                ],
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    // weird clipping happens if we remove this padding
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: Column(
                      children: [
                        const SizedBox(height: 100),
                        SizeTransitionWrapper(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.9,
                          ),
                        ),
                        ...[
                          for (var child in widget.children) ...[
                            child,
                            SizedBox(
                              height: dividerHeight,
                            )
                          ]
                        ],
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: widget.activeColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      letterSpacing: 1.1,
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
