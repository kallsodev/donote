part of 'notes_bloc.dart';

enum ProfilePostsStatus { loading, loaded, failed }

class ProfilePostsState extends Equatable {
  const ProfilePostsState._({
    required this.status,
    this.error = "",
  });

  const ProfilePostsState.loaded()
      : this._(status: ProfilePostsStatus.loaded);

  const ProfilePostsState.loading() : this._(status: ProfilePostsStatus.loading);

  const ProfilePostsState.failed()
      : this._(status: ProfilePostsStatus.failed, error: "Failed to load profile");

  final ProfilePostsStatus status;
  final String error;

  @override
  List<Object> get props => [status];

  @override
  String toString() {
    return "ProfilePostsState $status]";
  }
}
