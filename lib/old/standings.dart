import 'package:flutter/material.dart';
import 'package:formula/widgets/formula_image.dart';
import 'package:formula/old/screen_base_old.dart';
import 'package:formula/old/standings_card.dart';

class Standings extends StatefulWidget {
  const Standings({
    Key? key,
    required this.onDriversTap,
  }) : super(key: key);

  final VoidCallback onDriversTap;

  @override
  State<Standings> createState() => _StandingsState();
}

class _StandingsState extends State<Standings> {
  double imageOffset = 50;
  bool fillScreen = false;

  Future<void> animateThenCallback() async {
    setState(() {
      imageOffset = 1000;
      fillScreen = true;
    });
    await Future.delayed(const Duration(milliseconds: 100));
    widget.onDriversTap();
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      imageOffset = 50;
      fillScreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScreenBaseOld.standings(
          children: [
            GestureDetector(
              onTap: animateThenCallback,
              child: AnimatedSize(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: fillScreen ? MediaQuery.of(context).size.height : null,
                  width: fillScreen ? MediaQuery.of(context).size.width : null,
                  child: StandingsCardOld(
                    right: -imageOffset,
                    left: imageOffset,
                    image: FormulaImage.f1Driver(),
                    text: const Text(
                      'Drivers',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),
            StandingsCardOld(
              image: FormulaImage.f1Car(),
              text: const Text(
                'Constructors',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 26),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
