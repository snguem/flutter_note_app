import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/note.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key, required this.siNouvelleNote});

  final Function(Note) siNouvelleNote;

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {

  final titreController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 46, 46),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 62, 62, 62),
        title: const Center( child:  Text("Nouvelle Note")),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: titreController,
              style: const TextStyle(
                fontSize: 28
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Titre"
              ),
            ),
            const SizedBox(height: 28,),
            TextFormField(
              controller: messageController,
              style: const TextStyle(
                fontSize: 18
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Votre message "
              ),),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (titreController.text.isEmpty) {
            return;
          }

          if (messageController.text.isEmpty) {
            return;
          }

          final note= Note(
            titre: titreController.text,
            message: messageController.text
          );

          widget.siNouvelleNote(note);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}