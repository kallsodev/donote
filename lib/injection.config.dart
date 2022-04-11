// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'blocs/add_note/note_operations_cubit.dart' as _i4;
import 'blocs/notes/notes_bloc.dart' as _i5;
import 'repositories/notes_repository.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.NotesRepository>(_i3.NotesRepository());
  gh.factory<_i4.NoteOperationsCubit>(
      () => _i4.NoteOperationsCubit(get<_i3.NotesRepository>()));
  gh.factory<_i5.NotesBloc>(() => _i5.NotesBloc(get<_i3.NotesRepository>()));
  return get;
}
