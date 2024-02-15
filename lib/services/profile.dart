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

  bool dataVerification() {
    if (nameVerification() && streetVerification() && phoneVerification()) {
      return true;
    } else {
      return false;
    }
  }

  bool nameVerification() {
    return state.name.isNotEmpty;
  }

  bool streetVerification() {
    return state.street.isNotEmpty;
  }

  bool phoneVerification() {
    return state.phone.length == 9;
  }
}

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileDb>(
    (ref) => ProfileNotifier());

final profileChangedProvider = StateProvider<bool>((ref) {
  return false;
});
