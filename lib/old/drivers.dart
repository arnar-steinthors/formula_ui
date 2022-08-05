import 'package:flutter/material.dart';
import 'package:formula/widgets/driver_card.dart';
import 'package:formula/widgets/formula_image.dart';
import 'package:formula/old/screen_base_old.dart';

class DriversOld extends StatelessWidget {
  const DriversOld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBaseOld.drivers(
      children: [
        DriverCard(
          firstName: 'Charles',
          lastName: 'Leclerc',
          position: 1,
          points: 104,
          teamName: 'Ferrari',
          driverHeadshot: FormulaImage.charles(
            fit: BoxFit.cover,
          ),
        ),
        DriverCard(
          firstName: 'Max',
          lastName: 'Verstappen',
          position: 2,
          points: 85,
          teamName: 'Red Bull Racing',
          driverHeadshot: FormulaImage.verstappen(
            fit: BoxFit.cover,
          ),
        ),
        DriverCard(
          firstName: 'Sergio',
          lastName: 'Perez',
          position: 3,
          points: 66,
          teamName: 'Red Bull Racing',
          driverHeadshot: FormulaImage.perez(
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
