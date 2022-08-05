import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula/bloc/cubits.dart';
import 'package:formula/widgets/formula_image.dart';
import 'package:formula/widgets/size_transition_wrapper.dart';
import 'package:formula/widgets/standings_card.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<PageCubit, bool>(
        builder: (context, pageState) => Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).padding.top,
              left: 15,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FormulaImage.logoWhite(
                      width: 50,
                      height: 50,
                    ),
                    const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder<PageCubit, bool>(
              builder: (context, pageState) => AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: MediaQuery.of(context).padding.top + (pageState ? 200 : 60),
                left: 15,
                child: const Text(
                  'Standings',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 58,
                    letterSpacing: 1.15,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                const SizeTransitionWrapper(
                  child: SizedBox(
                    height: 500,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: pageState ? const NeverScrollableScrollPhysics() : null,
                    itemCount: allStandingCards.length + 1,
                    itemBuilder: (context, index) => index == 0
                        ? AnimatedSize(
                            duration: const Duration(milliseconds: 300),
                            child: SizedBox(height: pageState ? 0 : 200),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: allStandingCards[index - 1],
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

final allStandingCards = <Widget>[
  StandingsCard(
    label: "Drivers",
    image: FormulaImage.f1Driver(),
  ),
  StandingsCard(
    label: "Constructors",
    image: FormulaImage.f1Car(),
  ),
];

// Navigator.of(context).push(
// PageRouteBuilder(
// transitionDuration: const Duration(milliseconds: 600),
// pageBuilder: (context, animation, secondaryAnimation) => const Drivers(),
// transitionsBuilder: (
// BuildContext context,
//     Animation<double> animation,
// Animation<double> secondaryAnimation,
//     Widget child,
// ) =>
// ScaleTransition(
// scale: animation,
// child: child,
// ),
// ),
// );
