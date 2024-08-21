

import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/note.dart';

class NoteViewPage extends StatelessWidget {
  const NoteViewPage({super.key, required this.note, required this.index, required this.siNoteSupprimer});

  final Note note;
  final int index;
  final Function(int) siNoteSupprimer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 62, 62, 62),
          title: const Center( child:  Text("Note Resume")),
          actions: [
            IconButton(onPressed: (){
              siNoteSupprimer(index);
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.delete))
          ],
        ),

      
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.titre,
              style: const TextStyle(
                fontSize: 28
              ),
            ),
            const SizedBox(height: 28,),
            Text(
              note.message,
              style: const TextStyle(
                fontSize: 18
              ),
            ),

          ],
        ),
      ),



    );
  }
}
