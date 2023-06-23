import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meatingless/models/database_model.dart';
import 'package:meatingless/services/profile.dart';
import 'package:meatingless/variables/padding.dart';
import 'package:meatingless/widgets/general/element_title.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key, required this.currentProfile});
  final ProfileDb currentProfile;

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
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(
              left: horizontalPadding, right: horizontalPadding, top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElementTitle(title: "Your Profile"),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: TextField(
            controller: nameController,
            onChanged: (newValue) {
              ref.read(profileProvider.notifier).changeProfile(name: newValue);
            },
            decoration: const InputDecoration(
                label: Text("Name"),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder()),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
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
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: TextField(
            keyboardType: TextInputType.number,
            controller: phoneController,
            onChanged: (newValue) {
              ref.read(profileProvider.notifier).changeProfile(phone: newValue);
            },
            decoration: const InputDecoration(
                label: Text("Phone Number"),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                border: OutlineInputBorder()),
          ),
        )
      ],
    );
  }
}
