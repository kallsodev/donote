// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'blocs/add_note/note_operations_cubit.dart' as _i6;
import 'blocs/notes/notes_bloc.dart' as _i7;
import 'blocs/settings/settings_bloc.dart' as _i5;
import 'repositories/local_notes_repository.dart' as _i3;
import 'repositories/notes_repository.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.LocalNotesRepository>(_i3.LocalNotesRepository());
  gh.singleton<_i4.NotesRepository>(_i4.NotesRepository());
  gh.factory<_i5.SettingsBloc>(() => _i5.SettingsBloc());
  gh.factory<_i6.NoteOperationsCubit>(
      () => _i6.NoteOperationsCubit(get<_i4.NotesRepository>()));
  gh.factory<_i7.NotesBloc>(() => _i7.NotesBloc(get<_i4.NotesRepository>()));
  return get;
}
