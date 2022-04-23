// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'blocs/create_note/create_note_cubit.dart' as _i6;
import 'blocs/local_notes_sync/local_notes_sync_cubit.dart' as _i7;
import 'blocs/note_sync/note_sync_cubit.dart' as _i8;
import 'blocs/notes/notes_bloc.dart' as _i9;
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
  gh.factory<_i6.CreateNoteCubit>(
      () => _i6.CreateNoteCubit(get<_i4.NotesRepository>()));
  gh.singleton<_i7.LocalNotesSyncCubit>(_i7.LocalNotesSyncCubit(
      notesRepository: get<_i4.NotesRepository>(),
      localNotesRepository: get<_i3.LocalNotesRepository>()));
  gh.singleton<_i8.NoteSyncCubit>(_i8.NoteSyncCubit(
      notesRepository: get<_i4.NotesRepository>(),
      localNotesRepository: get<_i3.LocalNotesRepository>()));
  gh.factory<_i9.NotesBloc>(() => _i9.NotesBloc(get<_i4.NotesRepository>()));
  return get;
}
