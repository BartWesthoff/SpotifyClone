import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/app/core/ui/screens/search/screen/search_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ScrollBloc(),
        child: BlocBuilder<ScrollBloc, bool>(builder: (context, scroll) {
          return SearchView(scrollState: scroll);
        }));
  }
}

abstract class ScrollEvent extends Equatable {
  const ScrollEvent();

  @override
  List<Object> get props => [];
}

class ScrollStarted extends ScrollEvent {
  const ScrollStarted();

  @override
  List<Object> get props => [];
}

class ScrollEnded extends ScrollEvent {
  const ScrollEnded();

  @override
  List<Object> get props => [];
}

class ScrollBloc extends Bloc<ScrollEvent, bool> {
  /// {@macro counter_bloc}
  ScrollBloc() : super(false) {
    on<ScrollStarted>(_onScrollStart);
    on<ScrollEnded>(_onScrollEnd);
  }

  void _onScrollStart(
    ScrollStarted event,
    Emitter<bool> emit,
  ) {
    emit(true);
  }

  void _onScrollEnd(
    ScrollEnded event,
    Emitter<bool> emit,
  ) {
    emit(false);
  }
}

// enum ScrollStatus { ScrollStarted, ScrollStopped, undifined }
//
// class ScrollState extends Equatable {
//   const ScrollState({
//     this.status = ScrollStatus.undifined,
//   });
//
//   final ScrollStatus status;
//
//   ScrollState copyWith({
//     ScrollStatus? status,
//   }) {
//     return ScrollState(
//       status: status ?? this.status,
//     );
//   }
//
//   @override
//   List<Object?> get props => [];
// }

class SwipeDetector extends StatelessWidget {
  final Widget child;
  final Function? onSwipeLeft;
  final Function? onSwipeRight;
  final Function? onSwipeUp;
  final Function? onSwipeDown;

  const SwipeDetector(
      {Key? key,
      required this.child,
      this.onSwipeLeft,
      this.onSwipeRight,
      this.onSwipeUp,
      this.onSwipeDown})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        // Note: Sensitivity is integer used when you don't want to mess up vertical drag
        int sensitivity = 0;
        if (details.delta.dx > sensitivity) {
          if (onSwipeLeft != null) onSwipeLeft!();
        } else if (details.delta.dx < -sensitivity) {
          if (onSwipeRight != null) onSwipeRight!();
        }
      },
      onVerticalDragUpdate: (details) {
        int sensitivity = 0;

        if (details.delta.dy > sensitivity) {
          if (onSwipeDown != null) onSwipeDown!();
        } else if (details.delta.dy < -sensitivity) {
          if (onSwipeUp != null) onSwipeUp!();
        }
      },
      child: child,
    );
  }
}
