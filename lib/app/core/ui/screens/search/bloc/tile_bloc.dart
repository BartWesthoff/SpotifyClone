import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/app/core/ui/screens/search/bloc/tile_event.dart';
import 'package:spotifyclone/app/core/ui/screens/search/bloc/tile_state.dart';

class TileBloc extends Bloc<TileEvent, TileState> {
  /// {@macro counter_bloc}
  TileBloc() : super(const TileState()) {
    on<TilePressed>(_onPressed);
    on<TileReleased>(_onReleased);
    on<Scrolled>(_onScrolled);
  }

  void _onPressed(
    TilePressed event,
    Emitter<TileState> emit,
  ) {
    emit(state.copyWith(opacity: 0.5, scale: 0.97, status: TileStatus.tapped));
  }

  void _onScrolled(
    Scrolled event,
    Emitter<TileState> emit,
  ) {
    emit(state.copyWith(opacity: 1.0, scale: 1, status: TileStatus.untapped));
  }

  void _onReleased(
    TileReleased event,
    Emitter<TileState> emit,
  ) {
    emit(state.copyWith(opacity: 1.0, scale: 1.0, status: TileStatus.untapped));
  }
}
