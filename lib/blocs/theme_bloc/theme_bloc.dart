import 'package:equatable/equatable.dart';

import '../bloc_exports.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<UpdateAppTheme>(_onUpdateTheme);
  }

  void _onUpdateTheme(UpdateAppTheme event, Emitter<ThemeState> emit) {
    final isDarkTheme = state.isDarkTheme;

    emit(ThemeState(isDarkTheme: !isDarkTheme));
  }
}
