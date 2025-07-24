import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController titleTxtCntrl = TextEditingController();
  TextEditingController descTxtCntrl = TextEditingController();

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

        ],
      ),
    );
  }
}