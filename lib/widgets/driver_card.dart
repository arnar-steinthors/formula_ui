import 'package:flutter/material.dart';

import 'driver_tag.dart';

class DriverCard extends StatelessWidget {
  const DriverCard({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.position,
    required this.points,
    required this.teamName,
    required this.driverHeadshot,
  }) : super(key: key);

  final String firstName;
  final String lastName;
  final int position;
  final int points;
  final String teamName;
  final Widget driverHeadshot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        height: 220,
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          position.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          firstName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 24,
                            letterSpacing: -1,
                          ),
                        ),
                        FittedBox(
                          child: Text(
                            lastName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              letterSpacing: 0.25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: driverHeadshot,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Center(
                child: Divider(
                  thickness: 1.25,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  DriverTag(
                    text: Text(
                      '${points.toString()} PTS',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  DriverTag(
                    text: Text(
                      teamName,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const DriverTag(
                    text: Text(
                      'Bio',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const Spacer(),
                  Transform.rotate(
                    angle: -0.8,
                    child: const Icon(
                      Icons.arrow_downward,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
