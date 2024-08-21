import 'package:flutter/material.dart';
import 'package:flutter_notes_app_2/models/note.dart';


class NoteCard extends StatefulWidget {
  const NoteCard({super.key, required this.note,required this.index, required this.goTo, required this.activeSelected,required this.isSelected,required this.toggleDeleted});
  
  final Note note;
  final int index;
  final Function(Note, int) goTo;
  final Function(int) toggleDeleted;
  final Function activeSelected;
  final bool isSelected;

  @override
  State<NoteCard> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NoteCard> {
  bool? isChecked;

  @override
  void initState() {
    isChecked = widget.note.delete;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF191919)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
              if (!widget.isSelected) {
                widget.goTo(widget.note, widget.index);
              }
            },
            onLongPress: (){
              widget.activeSelected();
            },
            child: Row(
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: widget.isSelected
                  ? Checkbox(
                          value: isChecked,
                          onChanged: (newstate)=>{
                            widget.toggleDeleted(widget.index),
                            setState(() {
                              isChecked = newstate;
                            })
                          },
                          checkColor: Colors.white,
                          activeColor: Colors.blue,
                    )
                  : const SizedBox.shrink()
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: widget.note.titre.isEmpty
                            ? const SizedBox.shrink()
                            : Text(widget.note.titre,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                                )
                      ),
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: widget.note.message.isEmpty
                            // ignore: prefer_const_constructors
                            ? SizedBox.shrink()
                            : Text(widget.note.message,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70
                                  ),
                              ),
                    ),
                          
                    Text("${widget.note.dateTime.hour}:${widget.note.dateTime.minute}:${widget.note.dateTime.second} ;  ${widget.note.dateTime.day}-${widget.note.dateTime.month}-${widget.note.dateTime.year}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey
                        ),),
                  ],
                ),
                
              ],
            ),
          ),
        )
      ),
    );
  }

}


