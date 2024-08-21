import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/note.dart';
import 'package:flutter_notes_app/pages/cards/note_card.dart';
import 'package:flutter_notes_app/pages/create_note_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Note> notes = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 46, 46),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 62, 62, 62),
        title: const Center( child:  Text("Flutter note")),
      ),

      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index){
          return NoteCard(note: notes[index], index: index,siNoteSupprimer: siNoteSupprimer);
        },),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreateNotePage(siNouvelleNote: siNouvelleNote,)));
        },
        child: const Icon(Icons.add),
        ),
    );
  }

  void siNouvelleNote(Note note){
    notes.add(note);
    setState(() {});
  }

  void siNoteSupprimer(int index){
    notes.removeAt(index);
    setState(() {});
  }

}