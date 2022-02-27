import 'package:equatable/equatable.dart';

enum TileStatus { tapped, untapped }

class TileState extends Equatable {
  const TileState({
    this.opacity = 1.0,
    this.scale = 1.0,
    this.status = TileStatus.untapped,
  });

  final double opacity;
  final double scale;
  final TileStatus status;

  TileState copyWith({
    TileStatus? status,
    double? opacity,
    double? scale,
  }) {
    return TileState(
      opacity: opacity ?? this.opacity,
      scale: scale ?? this.scale,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [opacity, scale];
}
