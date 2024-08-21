import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_notes_app_2/models/note.dart';
import 'package:flutter_notes_app_2/pages/edit_note.dart';
import 'package:flutter_notes_app_2/pages/widgets/note_widget.dart';
import 'package:flutter_notes_app_2/pages/widgets/search_bar.dart';
// import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color black = const Color(0xFF010101);

  List<Note> notes = [];
  List<Note> notesShows = [];
  List<int> toDelected = [];
  int positionSaved = -1;
  bool isSelected = false;
  // FileManager fileManager=FileManager();


  @override
  void initState() {
    loadNotesJson();
    super.initState();
  }

  Future<void> loadNotesJson() async{
    final String response = await rootBundle.loadString("notes.json");
    final data= await jsonDecode(response);
    
    for (var noteMap in data["notes"]) {
      notes.add(Note.fromJson(noteMap));
    }

    setState(() {
      notesShows = notes;
    });
  }

  void _filter(String text){
    List<Note> resultsNotes = [];
    if (text.isEmpty) {
      resultsNotes = notes;
    }else{
      resultsNotes = notes
            .where((note) =>
                    note.titre.toLowerCase().contains(text.toLowerCase()) ||
                    note.message.toLowerCase().contains(text.toLowerCase())
                  )
            .toList();
    }

    setState(() {
      notesShows = resultsNotes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: black,
              backgroundColor: black,

              pinned: true,
              stretch: true,
              // leading: IconButton(
              //   onPressed: (){},
              //   icon: const Icon(Icons.arrow_back,)
              // ),
              expandedHeight: 100,
              toolbarHeight: 50,
              flexibleSpace: !isSelected
              ? const FlexibleSpaceBar(
                  expandedTitleScale: 2,
                  centerTitle: false,
                  titlePadding: EdgeInsets.all(10),
                  title: Text("Note",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),),
                  
                )
                
              : const SizedBox.shrink(),
              actions: isSelected
              ? [
                  
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          isSelected = false;
                          // toDelected = [];
                        });
                      },
                      child: const Text("Annuler",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                      
                    ),
                  ),

                   IconButton(
                    onPressed: (){
                      delete();
                    },
                    icon: const Icon(Icons.delete, color: Colors.red,),
                    // weight: 30,
                    
                  ),
                ]
              :[]
            ),
            
            //  Container(
            //   height: 200,
            //   color: Colors.amber,
            //   child: const Row(
            //     children: [
            //       Icon(Icons.search),
            //       Text("test")
            //     ],
            //   )
            // ),

            // SliverList.list(children: [
            //   // SliverList(delegate: SliverChildBuilderDelegate(
            //   //               (context, item){
            //   //                 return ListTile(title: Text("item $item",
            //   //                                             style: const TextStyle(color: Colors.red),),);
            //   //               },
            //   //             childCount: 12
            //   //           )
            //   //   ),
            //   SliverList(delegate: SliverChildBuilderDelegate(
            //                 (context, item){
            //                   return ListTile(title: Text("item $item"),);
            //                 },
            //               childCount: 15
            //             )
            //     ),
            // ]),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                            (context, item){
                              if (!isSelected) {
                                return SearchBarApp(filterBar: _filter);
                              }else{
                                return const SizedBox.shrink();
                              }
                            },
                          childCount: 1,
                        )
                    
              ),
            
            SliverToBoxAdapter(  
              child: notesShows.isEmpty 
                  ? const SizedBox(
                      height: 500,
                      
                      child: Center(

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 15),
                                child: Text("Vos notes s'affichent ici",
                                        style: TextStyle(
                                          color: Colors.white30,
                                          fontSize: 24
                                        ),
                                    ),
                              ),
                              
                              Icon(
                                Icons.emoji_emotions_sharp,
                                weight: 30,
                                color: Colors.white30,
                              )
                            ],
                          )
                        ),
                  )  
                  : const SizedBox.shrink(), // Ne rien afficher si la liste n'est pas vide  
            ),  

            SliverList(
                delegate: SliverChildBuilderDelegate(
                              (context, item){
                                return NoteCard(note: notesShows[item],index: item,goTo: update, activeSelected: activeSelected,isSelected: isSelected,toggleDeleted: toggleDeleted);
                              },
                            childCount: notesShows.length
                )
            ),  
          ],
        ),
      ),
    
      floatingActionButton: !isSelected
        ? FloatingActionButton(
              // shape: RoundedRectangleBorder(  
              //   borderRadius: BorderRadius.circular(50),
              // ),  
              backgroundColor: const Color.fromARGB(255, 0, 115, 208),
              onPressed: (){
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EditNote(note: Note("", "",DateTime.now()),)));
                    Navigator.of(context).push(createRoute(Note("", "",DateTime.now()),));
                },
              child: const Icon(Icons.add, color: Colors.white,size: 40,),
            )
        : null,

      // bottomNavigationBar: Container(color: const Color(0xFF191919),height: 60,
      //                               child: const Row(
      //                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                                 crossAxisAlignment: CrossAxisAlignment.center,
      //                                 children: [
      //                                   Column(
      //                                     crossAxisAlignment: CrossAxisAlignment.center,
      //                                     mainAxisAlignment: MainAxisAlignment.center,
      //                                     children: [
      //                                       Icon(
      //                                         Icons.note_alt_rounded,
      //                                         color: Color.fromARGB(255, 172, 172, 172),
      //                                         size: 25,
      //                                       ),
      //                                       Text("Note", style: TextStyle(
      //                                           fontSize: 12,
      //                                           color: Color.fromARGB(255, 172, 172, 172)
      //                                         ),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                   Column(
      //                                     crossAxisAlignment: CrossAxisAlignment.center,
      //                                     mainAxisAlignment: MainAxisAlignment.center,
      //                                     children: [
      //                                       Icon(
      //                                         Icons.task,
      //                                         color: Color.fromARGB(255, 172, 172, 172),
      //                                         size: 25,
      //                                       ),
      //                                       Text("Tache", style: TextStyle(
      //                                           fontSize: 12,
      //                                           color: Color.fromARGB(255, 172, 172, 172)
      //                                         ),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ],
      //                               ),
      //                               ),
    
    );
  }



  void saveNote(Note note){
    if (positionSaved==-1) {
      notes.add(note);
    }else{
      notes[positionSaved] = note;
    }
    setState(() {
      notesShows = notes;
      positionSaved = -1;
    });
  }

  void update(Note note, int position){
    setState(() {
      positionSaved = position;
    });
    Navigator.of(context).push(createRoute(note));
  }

  void toggleDeleted(int position){
    if (toDelected.contains(position)) {
      toDelected.remove(position);
    }else{
      toDelected.add(position);
    }
    notes[position].delete = notes[position].delete? false:true;
    print(notes[position].delete);
    print(toDelected);
    print(position);
  }

  void delete(){
    for (var position in toDelected) {
      notes.removeAt(position);
    }

    setState(() {
      toDelected.clear();
      notesShows = notes;
      isSelected = false;
    });
  }

  void activeSelected(){
    setState(() {
      isSelected = true;
    });
  }

  
Route createRoute(Note note) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => EditNote(note: note, newNote: saveNote,),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.linear;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

}