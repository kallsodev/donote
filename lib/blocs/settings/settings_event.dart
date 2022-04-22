part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

class LoadSettings extends SettingsEvent {
  const LoadSettings();

  @override
  List<Object?> get props => ['load'];
}
