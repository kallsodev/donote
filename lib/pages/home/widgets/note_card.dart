import 'package:donote/models/note_model.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class NoteCard extends StatelessWidget {
  final NoteModel note;

  const NoteCard({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: (note.color ?? Theme.of(context).colorScheme.tertiary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
                  child: Text(
                    note.title,
                    style: Theme.of(context).textTheme.headline4,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 8.0),
              child: Text(
                note.stringData,
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  timeago.format(note.lastModifiedAt, locale: 'en_short'),
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
