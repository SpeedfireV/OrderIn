import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/database_model.dart';
import 'package:meatingless/services/profile.dart';
import 'package:meatingless/variables/padding.dart';
import 'package:meatingless/widgets/general/element_title.dart';
import 'package:meatingless/widgets/general/icon_buttons.dart';

import '../routing/router.dart';
import '../variables/colors.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key, required this.currentProfile, this.needed});
  final ProfileDb currentProfile;
  final bool? needed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  late TextEditingController nameController;
  late TextEditingController streetController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.currentProfile.name);
    streetController =
        TextEditingController(text: widget.currentProfile.street);
    phoneController = TextEditingController(text: widget.currentProfile.phone);
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    streetController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                widget.needed == true
                    ? Padding(
                        padding: EdgeInsets.symmetric(
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
                            Padding(
                              padding: const EdgeInsets.only(top: 28.0),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: TextField(
                    controller: nameController,
                    onChanged: (newValue) {
                      ref
                          .read(profileProvider.notifier)
                          .changeProfile(name: newValue);
                    },
                    decoration: const InputDecoration(
                        label: Text("Name"),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: TextField(
                    controller: streetController,
                    onChanged: (newValue) {
                      ref
                          .read(profileProvider.notifier)
                          .changeProfile(street: newValue);
                    },
                    decoration: const InputDecoration(
                        label: Text("Street Address"),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    onChanged: (newValue) {
                      ref
                          .read(profileProvider.notifier)
                          .changeProfile(phone: newValue);
                    },
                    decoration: const InputDecoration(
                        label: Text("Phone Number"),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(height: 24),
                widget.needed == true
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: horizontalPadding),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              minimumSize:
                                  const MaterialStatePropertyAll(Size(0, 56)),
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColors.mainColor)),
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            router.pop();
                          },
                          child: Text(
                            "Apply Changes",
                            style: TextStyle(
                                color: AppColors.lightColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
