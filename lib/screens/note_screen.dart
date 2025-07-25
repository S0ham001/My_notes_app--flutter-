import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController titleTxtCntrl = TextEditingController();
  TextEditingController descTxtCntrl = TextEditingController();
  List<Note> notes = [];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY Notes"),
      ),
      body: Column(
        children: [
          //add
          TextField(
            controller: titleTxtCntrl,
            decoration: InputDecoration(
              hintText: "enter title",
              labelText: "Title",

              ),
          ),
          TextField(
            controller: descTxtCntrl,
            decoration: InputDecoration(
              hintText: "enter description",
              labelText: "description",
              ),
          ),
          ElevatedButton(onPressed: () {
            // add logic
            if ( titleTxtCntrl.text.isNotEmpty && descTxtCntrl.text.isNotEmpty){
              notes.add(
                Note(
                  id: DateTime.now().toIso8601String(),
                  title: titleTxtCntrl.text,
                  description: descTxtCntrl.text,
                ),
              );
              titleTxtCntrl.clear();
              descTxtCntrl.clear();
              setState(() {});
            } else {}
          }, 
          child: Text("Add")),
          //Display
          Expanded(child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: 
              (context, index) => ListTile(
                title: Text(notes[index].title),
                subtitle: Text(notes[index].description),
                trailing: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Row(
                    children: [
                      IconButton(onPressed:(){
                        titleTxtCntrl.text = notes[index].title;
                        descTxtCntrl.text = notes[index].description;
                        notes.removeAt(index);
                        setState(() {});
                      }, icon: Icon(Icons.edit)),
                      IconButton( onPressed: (){
                    notes.removeAt(index);
                    setState(() {});
                  },
                  icon: Icon(Icons.delete),),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}