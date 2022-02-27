import 'package:equatable/equatable.dart';

abstract class TileEvent extends Equatable {
  const TileEvent();

  @override
  List<Object> get props => [];
}

class TilePressed extends TileEvent {
  const TilePressed();

  @override
  List<Object> get props => [];
}

class Scrolled extends TileEvent {
  const Scrolled();

  @override
  List<Object> get props => [];
}

class TileReleased extends TileEvent {
  const TileReleased();

  @override
  List<Object> get props => [];
}
