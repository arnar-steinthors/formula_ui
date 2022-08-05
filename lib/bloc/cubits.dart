import 'package:flutter_bloc/flutter_bloc.dart';

class CardCubit extends Cubit<bool> {
  CardCubit() : super(false);

  void toggle() => emit(!state);
}

class PageCubit extends Cubit<bool> {
  PageCubit() : super(false);

  void toggle() => emit(!state);
}
