import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/app/core/ui/screens/search/bloc/tile_bloc.dart';
import 'package:spotifyclone/app/core/ui/screens/search/bloc/tile_event.dart';
import 'package:spotifyclone/app/core/ui/screens/search/bloc/tile_state.dart';
import 'package:spotifyclone/app/core/ui/screens/search/screen/search_screen.dart';
import 'package:spotifyclone/app/core/ui/screens/search/widgets/tile_widget.dart';

class ExploreAlbumTile extends StatelessWidget {
  final Color color;
  final String genre;

  ExploreAlbumTile({
    Key? key,
    required this.color,
    required this.genre,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TileBloc(),
      child: BlocBuilder<TileBloc, TileState>(
        builder: (context, count) {
          return context.read<ScrollBloc>().state
              ? GestureDetector(
                  onVerticalDragDown: (details) {
                    context.read<TileBloc>().add(TileReleased());
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  onVerticalDragStart: (details) {
                    context.read<TileBloc>().add(TileReleased());
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  onVerticalDragUpdate: (details) {
                    context.read<TileBloc>().add(TilePressed());
                    print("drag update");
                  },
                  onTapUp: (details) {
                    context.read<TileBloc>().add(TileReleased());
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  onTapDown: (details) {
                    context.read<TileBloc>().add(TilePressed());
                    print("ontapdown");
                    // context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  child: Tile(
                      color: color,
                      genre: genre,
                      state: count,
                      scrolling: context.read<ScrollBloc>().state),
                )
              :
              // Container(
              //         color: Colors.grey,
              //         height: 100,
              //         width: MediaQuery.of(context).size.width / 2 - 16,
              GestureDetector(
                  // onVerticalDragDown: (details) =>
                  // {context.read<TileBloc>().add(TileReleased())},

                  // onVerticalDragUpdate: (details) {
                  //   context.read<TileBloc>().add(TilePressed());
                  //   print("drag update");
                  // },
                  onLongPressUp: () {
                    context.read<TileBloc>().add(TileReleased());
                    print("long press up2");
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },

                  onTapUp: (details) {
                    context.read<TileBloc>().add(TileReleased());
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },
                  onTapDown: (details) {
                    context.read<TileBloc>().add(TilePressed());
                    print("ontapdown2");
                    context.read<ScrollBloc>().add(ScrollEnded());
                  },

                  child: Tile(
                      color: color,
                      genre: genre,
                      state: count,
                      scrolling: context.read<ScrollBloc>().state),
                );
        },
      ),
    );
    //   },
    // ));
  }
}
