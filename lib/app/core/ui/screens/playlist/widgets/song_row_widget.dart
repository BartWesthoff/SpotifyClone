import 'package:flutter/material.dart';
import 'package:spotifyclone/app/core/data/models/song_model.dart';

class SongRow extends StatelessWidget {
  final int number;
  final bool numbered;
  final Song song;
  const SongRow({
    Key? key,
    required this.number,
    required this.numbered,
    required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Row(
          children: [
            if (numbered)
              Row(
                children: [
                  Text(
                    number.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(width: 24.0),
                ],
              ),
            Image.asset('assets/images/album_cover_1.jpg'),
            const SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  song.title,
                  style: TextStyle(
                    color: song.active
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    if (song.lyrics)
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Container(
                          padding: const EdgeInsets.all(2.0),
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          height: 15,
                          child: const Center(
                            child: Text(
                              "LYRICS",
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'GothamMedium',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (song.explicit)
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          width: 15,
                          height: 15,
                          child: const Center(
                            child: Text(
                              "E",
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'GothamMedium',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    Text(
                      song.artistNames,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            const Icon(Icons.more_vert_sharp, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
