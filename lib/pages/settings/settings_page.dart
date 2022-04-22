// import 'package:donote/blocs/settings/settings_bloc.dart';
// import 'package:donote/pages/settings/settings_view.dart';
// import 'package:donote/resources/strings.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           Strings.settings,
//           style: Theme.of(context).textTheme.headline2,
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: BlocProvider(
//           create: (context) => SettingsBloc(),
//           child: const SettingsView(),
//         ),
//       ),
//     );
//   }
// }
