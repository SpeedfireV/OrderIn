import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meatingless/models/database_model.dart';
import 'package:meatingless/services/location.dart';
import 'package:meatingless/services/profile.dart';
import 'package:meatingless/variables/padding.dart';
import 'package:meatingless/widgets/general/icon_buttons.dart';
import 'package:meatingless/widgets/general/submit_button.dart';

import '../routing/router.dart';
import '../variables/colors.dart';

class ProfilePage extends StatefulHookConsumerWidget {
  const ProfilePage({super.key, required this.currentProfile, this.needed});
  final ProfileDb currentProfile;
  final bool? needed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    FocusNode nameNode = useFocusNode();
    FocusNode streetNode = useFocusNode();
    FocusNode phoneNode = useFocusNode();
    TextEditingController nameController =
        useTextEditingController(text: widget.currentProfile.name);
    TextEditingController streetController =
        useTextEditingController(text: widget.currentProfile.street);
    TextEditingController phoneController =
        useTextEditingController(text: widget.currentProfile.phone);
    final profile = ref.watch(profileProvider);
    final profileChanged = ref.watch(profileChangedProvider);

    Future _locateUser() async {
      late Position location;

      if (await LocationServices.checkLocationAvailability()) {
        LocationPermission locationPermission =
            await LocationServices.getLocationPermission();
        if (locationPermission == LocationPermission.whileInUse ||
            locationPermission == LocationPermission.always) {
          location = await LocationServices.getCurrentPosition();
        } else {}
      }
      return location;
    }

    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  widget.needed == true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: ElevatedIconButton(
                                      icon: Icons.arrow_back,
                                      function: () {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        router.pop();
                                      }),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 28.0),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Your Profile",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 22),
                                    )),
                              ),
                            ],
                          ),
                        )
                      : const Padding(
                          padding: EdgeInsets.only(
                              left: horizontalPadding,
                              right: horizontalPadding,
                              top: 28),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Your Profile",
                                style: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 22),
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding),
                    child: TextField(
                      focusNode: nameNode,
                      controller: nameController,
                      onEditingComplete: () {
                        nameNode.nextFocus();
                      },
                      onChanged: (value) {
                        debugPrint(profileChanged.toString());
                        ref.read(profileChangedProvider.notifier).state = true;
                      },
                      decoration: InputDecoration(
                          errorText: ref
                                  .read(profileProvider.notifier)
                                  .nameVerification()
                              ? null
                              : "Name Needed",
                          prefixIcon: const Icon(Icons.label),
                          label: const Text("Name"),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: const OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding),
                    child: TextField(
                      focusNode: streetNode,
                      controller: streetController,
                      onEditingComplete: () {
                        streetNode.nextFocus();
                      },
                      onChanged: (value) {
                        debugPrint(profileChanged.toString());
                        ref.read(profileChangedProvider.notifier).state = true;
                      },
                      decoration: InputDecoration(
                          errorText: ref
                                  .read(profileProvider.notifier)
                                  .streetVerification()
                              ? null
                              : "Street Address Needed",
                          suffixIcon: IconButton(
                              onPressed: () async {
                                Position? position = await LocationServices()
                                    .getCurrentLocation();
                                if (position != null) {
                                  String street = await LocationServices()
                                      .AddressByCoordinates(position);
                                  streetController.text = street;
                                }
                              },
                              icon: Icon(
                                Icons.my_location,
                                color: AppColors.mainColor,
                              )),
                          prefixIcon: const Icon(Icons.house),
                          label: const Text("Street Address"),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: const OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding),
                    child: TextField(
                      focusNode: phoneNode,
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      onChanged: (value) {
                        debugPrint(profileChanged.toString());
                        ref.read(profileChangedProvider.notifier).state = true;
                      },
                      decoration: InputDecoration(
                          errorText: ref
                                  .read(profileProvider.notifier)
                                  .phoneVerification()
                              ? null
                              : "Phone Number Is Invalid",
                          prefixIcon: const Icon(Icons.phone),
                          label: const Text("Phone Number"),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          border: const OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(height: 24),
                  profileChanged
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(children: [
                            Expanded(
                                child: SubmitButton(
                                    function: () {
                                      {
                                        ref
                                            .read(profileProvider.notifier)
                                            .changeProfile(
                                                name: nameController.text,
                                                street: streetController.text,
                                                phone: phoneController.text);
                                      }
                                      if (ref
                                          .read(profileProvider.notifier)
                                          .dataVerification()) {
                                        ref
                                            .read(
                                                profileChangedProvider.notifier)
                                            .state = false;
                                        if (widget.needed == true) {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          router.pop();
                                        }
                                      }
                                    },
                                    text: "Apply Changes"))
                          ]),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
