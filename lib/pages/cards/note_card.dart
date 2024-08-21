import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/note.dart';
import 'package:flutter_notes_app/pages/note_view_page.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.index, required this.siNoteSupprimer});

  final Note note;
  final int index;
  final Function(int) siNoteSupprimer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteViewPage(note: note,index: index,siNoteSupprimer: siNoteSupprimer,)));
      },
      child: Card(
              // color: const Color.fromARGB(255, 62, 62, 62),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.titre,
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      note.message,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                  ]
                ),
              ),
            ),
    );
  }
}