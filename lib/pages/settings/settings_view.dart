// import 'package:donote/blocs/settings/settings_bloc.dart';
// import 'package:donote/pages/home/widgets/note_card.dart';
// import 'package:donote/pages/note_editor/note_editor_page.dart';
// import 'package:donote/resources/strings.dart';
// import 'package:easy_utils/easy_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SettingsView extends StatelessWidget {
//   const SettingsView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SettingsBloc, SettingsState>(
//       builder: (context, state) {
//         print(state.status);
//         switch (state.status) {
//           case SettingsStatus.loaded:
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           case SettingsStatus.loading:
//             return Card(
//               elevation: 2,
//               color: Theme.of(context).cardColor,
//               shape:
//                   const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
//               child: SwitchListTile(
//                 onChanged: (bool newValue) {},
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(8))),
//                 value: Theme.of(context).brightness == Brightness.dark,
//                 title: Row(
//                   children: [
//                     Icon(Icons.mode_edit_rounded, color: Theme.of(context).primaryColor),
//                     const SizedBox(width: 16),
//                     Text(
//                       Strings.editorToolbarLocation,
//                       style: Theme.of(context).textTheme.subtitle1!.apply(fontWeightDelta: 2),
//                     ),
//                   ],
//                 ),
//               ),
//             );

//           case SettingsStatus.failed:
//             return const Center(
//               child: Text("something went wrong."),
//             );
//         }
//       },
//     );
//   }
// }
