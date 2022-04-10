part of 'notes_bloc.dart';

abstract class ProfilePostsEvent extends Equatable {
  const ProfilePostsEvent();
}

class LoadProfilePosts extends ProfilePostsEvent {
  final String profileId;

  const LoadProfilePosts(this.profileId);

  @override
  List<Object?> get props => [profileId];
}
