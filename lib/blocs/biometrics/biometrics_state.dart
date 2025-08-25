part of 'biometrics_cubit.dart';

enum BiometricsStatus { locked, unlocked}

class BiometricsState extends Equatable {
  const BiometricsState({
    required this.status,
  });

  final BiometricsStatus status;

  @override
  List<Object> get props =>
      [status];

  BiometricsState copyWith({
    required BiometricsStatus status,
  }) {
    return BiometricsState(
      status: status,
    );
  }
}
