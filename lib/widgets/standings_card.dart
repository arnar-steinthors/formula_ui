import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formula/bloc/cubits.dart';
import 'package:formula/widgets/driver_card.dart';
import 'package:formula/widgets/size_transition_wrapper.dart';
import 'package:formula/widgets/formula_image.dart';

class StandingsCard extends StatefulWidget {
  const StandingsCard({
    Key? key,
    required this.label,
    required this.image,
  }) : super(key: key);

  final String label;
  final Widget image;

  @override
  State<StandingsCard> createState() => _StandingsCardState();
}

class _StandingsCardState extends State<StandingsCard> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 400),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, bool>(
      builder: (context, pageState) => BlocProvider(
        create: (_) => CardCubit(),
        child: BlocBuilder<CardCubit, bool>(
          builder: (context, state) => GestureDetector(
            onTap: () {
              context.read<CardCubit>().toggle();
              context.read<PageCubit>().toggle();
            },
            child: BlocListener<CardCubit, bool>(
              listener: (context, state) => state ? _controller.forward() : _controller.reverse(),
              child: AnimatedContainer(
                height: state
                    ? MediaQuery.of(context).size.height
                    : pageState
                        ? 0
                        : 300,
                width: double.infinity,
                margin: state ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white,
                ),
                clipBehavior: Clip.hardEdge,
                duration: const Duration(milliseconds: 600),
                child: Stack(
                  children: [
                    if (state)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 200),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizeTransitionWrapper(
                                child: SizedBox(
                                  height: 1000,
                                ),
                              ),
                              ...allDriversCards,
                            ],
                          ),
                        ),
                      ),
                    if (state)
                      Positioned(
                        top: MediaQuery.of(context).padding.top,
                        left: 15,
                        child: FadeTransition(
                          opacity: _animation,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FormulaImage.logoBlack(
                                  width: 50,
                                  height: 50,
                                ),
                                const Icon(
                                  Icons.menu,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 600),
                      top: state ? MediaQuery.of(context).size.height * 0.8 : 0,
                      left: state ? MediaQuery.of(context).size.width : 25,
                      child: widget.image,
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 400),
                      top: state ? MediaQuery.of(context).padding.top + 60 : 10,
                      left: 15,
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 400),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: state ? 58 : 36,
                          letterSpacing: 1.15,
                        ),
                        child: Text(
                          widget.label,
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
    );
  }
}

final allDriversCards = <Widget>[
  DriverCard(
    firstName: 'Charles',
    lastName: 'Leclerc',
    position: 1,
    points: 104,
    teamName: 'Ferrari',
    driverHeadshot: FormulaImage.charles(),
  ),
  DriverCard(
    firstName: 'Max',
    lastName: 'Verstappen',
    position: 2,
    points: 85,
    teamName: 'Red Bull Racing',
    driverHeadshot: FormulaImage.verstappen(),
  ),
  DriverCard(
    firstName: 'Sergio',
    lastName: 'Perez',
    position: 3,
    points: 66,
    teamName: 'Red Bull Racing',
    driverHeadshot: FormulaImage.perez(),
  ),
  DriverCard(
    firstName: 'Charles',
    lastName: 'Leclerc',
    position: 1,
    points: 104,
    teamName: 'Ferrari',
    driverHeadshot: FormulaImage.charles(),
  ),
  DriverCard(
    firstName: 'Max',
    lastName: 'Verstappen',
    position: 2,
    points: 85,
    teamName: 'Red Bull Racing',
    driverHeadshot: FormulaImage.verstappen(),
  ),
  DriverCard(
    firstName: 'Sergio',
    lastName: 'Perez',
    position: 3,
    points: 66,
    teamName: 'Red Bull Racing',
    driverHeadshot: FormulaImage.perez(),
  ),
];
