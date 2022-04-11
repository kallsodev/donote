import 'dart:convert';

import 'package:donote/blocs/add_note/note_operations_cubit.dart';
import 'package:donote/injection.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/models/update_note_model.dart';
import 'package:easy_auth/easy_auth.dart';
import 'package:easy_utils/easy_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class NotePage extends StatefulWidget {
  final NoteModel? note;

  const NotePage({Key? key, this.note}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  late quill.QuillController _controller;
  late TextEditingController _titleController;
  bool hasChanged = false;


  @override
  void initState() {
    if (widget.note != null) {
      var data = jsonDecode(widget.note!.data);
      _controller = quill.QuillController(
          document: quill.Document.fromJson(data),
          selection: const TextSelection.collapsed(offset: 0));
      _titleController = TextEditingController(text: widget.note!.title);
    } else {
      _controller = quill.QuillController.basic();
      _titleController = TextEditingController(text: 'New note');
    }
    _controller.document.changes.forEach((element) {
      hasChanged = true;
    });
    super.initState();
    updateNote();
  }

  void updateNote() {
    Future.delayed(const Duration(seconds: 5), updateNote);
    if (!hasChanged || (_titleController.text == 'New note' && _controller.document.isEmpty())) {
      return;
    } else {
      context.read<NoteOperationsCubit>().update(updateNoteModel: UpdateNoteModel(
          title: _titleController.text,
          data: jsonEncode(_controller.document.toDelta().toJson()),
          hidden: false),);
      hasChanged = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteOperationsCubit, NoteOperationsState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: _titleController,
                  onChanged: (title) {
                    hasChanged = true;
                  },
                ),
              ),
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
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
