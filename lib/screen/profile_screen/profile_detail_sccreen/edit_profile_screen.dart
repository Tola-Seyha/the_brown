import 'dart:io';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:the_brown/db/product_db.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var ctrlLn = TextEditingController();
  var ctrlFn = TextEditingController();
  var ctrlGender = TextEditingController();
  var ctrlPhone = TextEditingController();
  var ctrlLocation = TextEditingController();
  String selectedProfile = "";
  String? gender;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProfile();
  }

  void loadProfile() async {
    var data = await ProfileDB.getProfile();

    if (data != null) {
      setState(() {
        ctrlFn.text = data["firstName"] ?? "";
        ctrlLn.text = data["lastName"] ?? "";
        ctrlPhone.text = data["phone"] ?? "";
        ctrlLocation.text = data["location"] ?? "";

        gender = data["gender"];
        selectedProfile = data["image"] ?? "";
      });
    }
  }

  void chooseProfile(ImageSource source) async {
    var imagePicked = await ImagePicker().pickImage(source: source);

    if (imagePicked == null) return;

    setState(() {
      selectedProfile = imagePicked.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F8F6),
      appBar: AppBar(title: Text("Profile")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSelectedProfile(),
              SizedBox(height: 20),
              _buildUserInfo(),
              SizedBox(height: 40),
              _buildSave(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSelectedProfile() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Choose Options"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      chooseProfile(ImageSource.camera);
                    },
                    leading: Icon(Icons.camera_alt),
                    title: Text("Camera"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      chooseProfile(ImageSource.gallery);
                    },
                    leading: Icon(Icons.photo_library_sharp),
                    title: Text("Gallary"),
                  ),
                ],
              ),
              actionsPadding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              contentPadding: EdgeInsets.only(left: 20, right: 20),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
              ],
            );
          },
        );
      },
      child: Center(
        child: badges.Badge(
          badgeContent: Icon(Icons.add, color: Colors.white, size: 16),
          position: badges.BadgePosition.bottomEnd(bottom: 9, end: 9),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.width * 0.35,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.grey,
              // color: Colors.amber,
              shape: BoxShape.circle,
            ),

            child: selectedProfile.isEmpty
                ? Center(
                    child: Text(
                      "${ctrlFn.text.isNotEmpty ? ctrlFn.text[0] : ''}"
                              "${ctrlLn.text.isNotEmpty ? ctrlLn.text[0] : ''}"
                          .toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.175,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Image.file(File(selectedProfile), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }

  Widget _buildSave() {
    return Column(
      children: [
        Bounceable(
          onTap: () async {
            await ProfileDB.saveProfile({
              "firstName": ctrlFn.text,
              "lastName": ctrlLn.text,
              "gender": gender,
              "phone": ctrlPhone.text,
              "location": ctrlLocation.text,
              "image": selectedProfile,
            });

            Navigator.pop(context, true);
          },
          child: Container(
            height: 50,

            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xffAF7950),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "Save Change",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            text: "Last Name",
            icon: Icons.person,
            controller: ctrlLn,
            label: Text(""),
          ),
          Divider(color: Colors.grey),
          _buildTextField(
            text: "First Name",
            icon: Icons.person,
            controller: ctrlFn,
            label: Text(""),
          ),
          Divider(color: Colors.grey),
          _buildGenderDropdown(),
          Divider(color: Colors.grey),
          _buildTextField(
            text: "Phone Number",
            icon: Icons.phone_android,
            controller: ctrlPhone,
            label: Text(""),
          ),
          Divider(color: Colors.grey),
          _buildTextField(
            text: "Location",
            icon: Icons.pin_drop,
            controller: ctrlLocation,
            label: Text(""),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String text,
    required IconData icon,
    required TextEditingController controller,
    required Text label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffDFC9B9),
          ),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hint: label,
            border: OutlineInputBorder(borderSide: BorderSide.none),
            prefixIcon: Icon(icon, color: Color(0xffDFC9B9)),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderDropdown() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Gender",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xffDFC9B9),
        ),
      ),

      DropdownButtonFormField<String>(
        value: (gender == "Male" || gender == "Female" || gender == "Other")
            ? gender
            : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          prefixIcon: Icon(Icons.transgender, color: Color(0xffDFC9B9)),
        ),
        hint: Text("Select Gender"),
        items: [
          DropdownMenuItem(value: "Male", child: Text("Male")),
          DropdownMenuItem(value: "Female", child: Text("Female")),
          DropdownMenuItem(value: "Other", child: Text("Other")),
        ],
        onChanged: (value) {
          setState(() {
            gender = value;
          });
        },
      ),
    ],
  );
}
}
