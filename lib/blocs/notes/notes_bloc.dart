import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donote/repositories/notes_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'notes_event.dart';

part 'notes_state.dart';

class ProfilePostsBloc extends Bloc<ProfilePostsEvent, ProfilePostsState> {
  final NotesRepository notesRepository;

  ProfilePostsBloc(this.notesRepository) : super(const ProfilePostsState.loading()) {
    on<LoadProfilePosts>(_onLoadProfilePosts);
  }

  Future<void> _onLoadProfilePosts(LoadProfilePosts event, Emitter<ProfilePostsState> emit) async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    // await emit.forEach<QuerySnapshot<Map<String, dynamic>>>(
    //   notesRepository.getProfilePosts(event.profileId),
    //   onData: (query) =>
    //       ProfilePostsState.loaded(
    //           query.docs.map((event) {
    //             PostModel p = PostModel.fromDocumentSnapshot(event);
    //             return p;
    //           }).toList(), isSuperfan: isSuperfan
    //       ),
    //   onError: (e, __) {
    //     print(e);
    //     return ProfilePostsState.failed();
    //   },
    // );
  }
}
