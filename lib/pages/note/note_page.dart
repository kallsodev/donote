import 'dart:convert';

import 'package:easy_auth/easy_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class NotePage extends StatefulWidget {
  final String? json;
  const NotePage({Key? key, this.json}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late quill.QuillController _controller;

  @override
  void initState() {
    if(widget.json != null) {
      var data = jsonDecode(widget.json!);
      _controller = quill.QuillController(document: quill.Document.fromJson(data), selection: TextSelection.collapsed(offset: 0));
    } else {
      _controller = quill.QuillController.basic();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: quill.QuillEditor.basic(
                controller: _controller,
                readOnly: false, // true for view only mode
              ),
            ),
          ),
          Container(
            child: quill.QuillToolbar.basic(
              controller: _controller,
            ),
          ),
          GestureDetector(
            onTap: () {
              var json = jsonEncode(_controller.document.toDelta().toJson());
              print(json);
            },
              child: const Text("print"),
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
