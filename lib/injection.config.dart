// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:donote/blocs/biometrics/biometrics_cubit.dart' as _i3;
import 'package:donote/blocs/create_note/create_note_cubit.dart' as _i6;
import 'package:donote/blocs/note_sync/note_sync_cubit.dart' as _i7;
import 'package:donote/blocs/notes/notes_bloc.dart' as _i8;
import 'package:donote/repositories/local_notes_repository.dart' as _i4;
import 'package:donote/repositories/notes_repository.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.BiometricsCubit>(() => _i3.BiometricsCubit());
  gh.singleton<_i4.LocalNotesRepository>(_i4.LocalNotesRepository());
  gh.singleton<_i5.NotesRepository>(_i5.NotesRepository());
  gh.factory<_i6.CreateNoteCubit>(
      () => _i6.CreateNoteCubit(gh<_i5.NotesRepository>()));
  gh.singleton<_i7.NoteSyncCubit>(_i7.NoteSyncCubit(
    notesRepository: gh<_i5.NotesRepository>(),
    localNotesRepository: gh<_i4.LocalNotesRepository>(),
  ));
  gh.factory<_i8.NotesBloc>(() => _i8.NotesBloc(gh<_i5.NotesRepository>()));
  return getIt;
}
