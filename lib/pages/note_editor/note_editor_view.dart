import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/blocs/create_note/create_note_cubit.dart';
import 'package:donote/blocs/note_sync/note_sync_cubit.dart';
import 'package:donote/models/local_note_model.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class NoteEditorView extends StatefulWidget {
  final NoteModel? note;

  const NoteEditorView({Key? key, this.note}) : super(key: key);

  @override
  State<NoteEditorView> createState() => _NoteEditorViewState();
}

class _NoteEditorViewState extends State<NoteEditorView> {
  late quill.QuillController _controller;
  late TextEditingController _titleController;
  bool hasChanged = false;
  Color? noteColor;
  Color pickerColor = AppColors.tertiaryColor;

  @override
  void initState() {
    if (widget.note != null) {
      var data = jsonDecode(widget.note!.data);
      noteColor = widget.note!.color;
      if (noteColor != null) {
        pickerColor = noteColor!;
      }
      _controller = quill.QuillController(
          document: quill.Document.fromJson(data),
          selection: const TextSelection.collapsed(offset: 0));
      _titleController = TextEditingController(text: widget.note!.title);
    } else {
      _controller = quill.QuillController.basic();
      _titleController = TextEditingController(text: 'New note_editor');
    }
    _controller.document.changes.forEach((element) {
      hasChanged = true;
    });
    super.initState();
    updateNote();
  }

  void updateNote() {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNoteCubit, CreateNoteState>(
      builder: (context, currentNote) {
        return BlocBuilder<NoteSyncCubit, NoteSyncState>(
          builder: (context, syncState) {
            return SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: TextField(
                            controller: _titleController,
                            onChanged: (title) {
                              context.read<NoteSyncCubit>().onChanged(
                                  localNoteModel: LocalNoteModel(lastModifiedAt: DateTime.now(),
                                      title: title,
                                      data: jsonEncode(_controller.document.toDelta().toJson(),),
                                      stringData: _controller.document.toPlainText(),
                                      hidden: false,
                                      documentReference: currentNote.documentReference!));
                            },
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Pick a color!'),
                                content: SingleChildScrollView(
                                  child: BlockPicker(
                                    pickerColor: pickerColor,
                                    onColorChanged: (Color color) {
                                      setState(() {
                                        pickerColor = color;
                                      });
                                    },
                                    availableColors: const [
                                      AppColors.tertiaryColor,
                                      Colors.red,
                                      Colors.pink,
                                      Colors.purple,
                                      Colors.deepPurple,
                                      Colors.indigo,
                                      Colors.blue,
                                      Colors.lightBlue,
                                      Colors.cyan,
                                      Colors.teal,
                                      Colors.green,
                                      Colors.lightGreen,
                                      Colors.lime,
                                      Colors.yellow,
                                      Colors.amber,
                                      Colors.orange,
                                      Colors.deepOrange,
                                      Colors.brown,
                                      Colors.grey,
                                      Colors.black,
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: const Text('Save'),
                                    onPressed: () {
                                      setState(() {
                                        noteColor = pickerColor;
                                        hasChanged = true;
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          color: pickerColor,
                          child: Icon(Icons.color_lens_outlined),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      child: quill.QuillEditor.basic(
                        controller: _controller,
                        readOnly: false,
                        // true for view only mode
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
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
