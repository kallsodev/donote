import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/models/create_note_model.dart';
import 'package:donote/models/local_note_model.dart';
import 'package:donote/models/note_model.dart';
import 'package:donote/repositories/notes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

part 'biometrics_state.dart';

@injectable
class BiometricsCubit extends Cubit<BiometricsState> {
  BiometricsCubit()
      : super(const BiometricsState(status: BiometricsStatus.locked));

  Future<void> unlockBiometrics() async {
    final LocalAuthentication auth = LocalAuthentication();
    // ···
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    if(canAuthenticate) {
      final List<BiometricType> availableBiometrics =
      await auth.getAvailableBiometrics();
      print(availableBiometrics);
      if (availableBiometrics.contains(BiometricType.strong) ||
          availableBiometrics.contains(BiometricType.face)) {
        try {
          final bool didAuthenticate = await auth.authenticate(
              localizedReason: 'Please authenticate to show hidden notes',
              options: const AuthenticationOptions(useErrorDialogs: false, biometricOnly: false));
          if(didAuthenticate) {
            emit(state.copyWith(status: BiometricsStatus.unlocked));
          }
          // ···
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
