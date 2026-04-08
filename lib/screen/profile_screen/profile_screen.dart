import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:the_brown/db/product_db.dart';
import 'package:the_brown/screen/profile_screen/profile_detail_sccreen/change_pwd_screen.dart';
import 'package:the_brown/screen/profile_screen/profile_detail_sccreen/edit_profile_screen.dart';
import 'package:the_brown/screen/profile_screen/profile_detail_sccreen/help_n_spp_screen.dart';
import 'package:the_brown/screen/signup_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotification = false;
  bool isDarkmode = false;
  String firstName = "";
  String lastName = "";
  String imagePath = "";

  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  void loadProfile() async {
    var data = await ProfileDB.getProfile();

    if (data != null) {
      setState(() {
        firstName = data["firstName"] ?? "";
        lastName = data["lastName"] ?? "";
        imagePath = data["image"] ?? "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F8F6),
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: Column(
          children: [
            _buildProfileHeader(),
            SizedBox(height: 20),
            _buildBody(),
            SizedBox(height: 60),
            _buildBtnLogout(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundColor: Colors.grey,

          child: imagePath.isEmpty
              ? Text(
                  "${firstName.isNotEmpty ? firstName[0] : ''}"
                          "${lastName.isNotEmpty ? lastName[0] : ''}"
                      .toUpperCase(),

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : ClipOval(
                  child: Image.file(
                    File(imagePath),
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                ),
        ),

        SizedBox(height: 16),

        Text(
          "$firstName $lastName",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        //edit
        Bounceable(
          onTap: () async {
            var result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfileScreen()),
            );

            if (result == true) {
              loadProfile();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.edit, color: Color(0xffAF7950)),
                SizedBox(width: 20),
                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios, color: Color(0xff99A1AF)),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey),

        //Change Password
        Bounceable(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChangePwdScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.lock_outline_rounded, color: Color(0xffAF7950)),
                SizedBox(width: 20),
                Text(
                  "Change Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios, color: Color(0xff99A1AF)),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey),

        //Order History
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        //   child: Row(
        //     children: [
        //       Icon(Icons.history, color: Color(0xffAF7950)),
        //       SizedBox(width: 20),
        //       Text(
        //         "Order History",
        //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        //       ),
        //       Spacer(),
        //       Icon(Icons.arrow_forward_ios, color: Color(0xff99A1AF)),
        //     ],
        //   ),
        // ),
        // Divider(color: Colors.grey),

        //Notifications
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Row(
            children: [
              Icon(Icons.notifications_none, color: Color(0xffAF7950)),
              SizedBox(width: 20),
              Text(
                "Notifications",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Transform.scale(
                scale: 0.9,
                child: Switch(
                  activeThumbColor: Colors.white,
                  activeTrackColor: Color(0xffAF7950),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Color(0xffD1D5DC),
                  trackOutlineColor: WidgetStateProperty.all(Colors.white),
                  padding: EdgeInsets.zero,
                  value: isNotification,
                  onChanged: (value) {
                    setState(() {
                      isNotification = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),

        Divider(color: Colors.grey),

        //dark mode
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Row(
            children: [
              Icon(Icons.dark_mode_outlined, color: Color(0xffAF7950)),
              SizedBox(width: 20),
              Text(
                "Dark Mode",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Transform.scale(
                scale: 0.9,
                child: Switch(
                  activeThumbColor: Colors.white,
                  activeTrackColor: Color(0xffAF7950),
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Color(0xffD1D5DC),
                  trackOutlineColor: WidgetStateProperty.all(Colors.white),
                  padding: EdgeInsets.zero,
                  value: isDarkmode,
                  onChanged: (value) {
                    setState(() {
                      isDarkmode = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey),

        //help and support
        Bounceable(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpNSppScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Icon(Icons.question_mark_rounded, color: Color(0xffAF7950)),
                SizedBox(width: 20),
                Text(
                  "Help & Support",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios, color: Color(0xff99A1AF)),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey),
      ],
    );
  }

  Widget _buildBtnLogout() {
    return Bounceable(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignupScreen()),
        );
      },
      child: Container(
        width: double.infinity,
        height: 55,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color(0xffCC0909),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout, color: Colors.white),
              SizedBox(width: 10),
              Text(
                "Log out",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
