
import 'package:flutter/material.dart';
import 'package:flutter_notes_app_2/models/note.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key,required this.note, required this.newNote});

  final Note note;
  final Function(Note) newNote;


  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  
  final titreController = TextEditingController();
  final messageController = TextEditingController();

  Color black = const Color(0xFF010101);

  @override
  void initState() {
    titreController.text = widget.note.titre;
    messageController.text = widget.note.message;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        // centerTitle: true,
        toolbarHeight: 80,
        title: const Text("Editer une note",
                  style:  TextStyle(
                    color: Colors.white
                  ),
            ),
        leading: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: 
              const Icon(
                    Icons.arrow_back, color: Colors.white,
              ),

        )
      ),
      body:  Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
        child: Column(
          
          children: [
            TextFormField(
              controller: titreController,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
                color: Color.fromARGB(230, 255, 255, 255),
              ),
              
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Titre",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w100,
                  color: Color.fromARGB(230, 255, 255, 255),
                )
              ),
            ),
            const Divider(
              height: 20,
              color: Color.fromARGB(0, 255, 255, 255),
              
            ),
            TextField(
        
              controller: messageController,
              cursorColor: Colors.white70,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w100
                ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Votre message",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w100
                )
              ),
              expands: false,
              minLines: 1,
              maxLines: 20,
            )
          ],
        )
        ),

        floatingActionButton: FloatingActionButton(
              onPressed: (){
                bool test=false;
                if (titreController.text.isEmpty && messageController.text.isEmpty) {
                  test = true;
                }

                if (!test) {
                  
                  final note= Note(titreController.text, messageController.text, DateTime.now());

                  widget.newNote(note);
                }

                Navigator.of(context).pop();
              },
              backgroundColor: Colors.blue,
              child: const Icon(
                        Icons.save_alt_rounded,
                        color: Colors.white,
                        weight: 30,
                      ),
        ),
      );
  }
}