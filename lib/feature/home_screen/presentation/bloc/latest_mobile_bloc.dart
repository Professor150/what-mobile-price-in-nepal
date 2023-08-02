import 'package:bloc/bloc.dart';

abstract class SelectedBrandEvent {}

class BrandSelected extends SelectedBrandEvent {
  final int selectedIndex;
  BrandSelected(this.selectedIndex);
}

class SelectedBrandState {
  final int selectedIndex;
  SelectedBrandState(this.selectedIndex);
}

// BLoc

class SelectedBrandBloc extends Bloc<SelectedBrandEvent, SelectedBrandState> {
  SelectedBrandBloc() : super(SelectedBrandState(0));

  Stream<SelectedBrandState> mapEventToState(SelectedBrandEvent event) async* {
    if (event is BrandSelected) {
      yield SelectedBrandState(event.selectedIndex);
    }
  }
}
