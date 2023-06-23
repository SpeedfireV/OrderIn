import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/database_model.dart';
import 'package:meatingless/services/database.dart';

class ProfileNotifier extends StateNotifier<ProfileDb> {
  ProfileNotifier() : super(DatabaseServices().getProfile());

  void changeProfile({String? name, String? street, String? phone}) {
    ProfileDb oldProfile = DatabaseServices().getProfile();
    ProfileDb newProfile = ProfileDb(
        name: name ?? oldProfile.name,
        street: street ?? oldProfile.street,
        phone: phone ?? oldProfile.phone);
    DatabaseServices().changeProfile(newProfile);
    state = newProfile;
    debugPrint(state.name);
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileDb>(
    (ref) => ProfileNotifier());
