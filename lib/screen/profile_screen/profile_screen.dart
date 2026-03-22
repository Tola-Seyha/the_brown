import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:the_brown/screen/profile_screen/profile_detail_sccreen/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isNotification = false;
  bool isDarkmode = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F8F6),
      appBar: AppBar(title: Text("Profile")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _buildProfileHeader(),
              SizedBox(height: 20),
              _buildBody(),
              SizedBox(height: 20),
              _buildBtnLogout(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: AssetImage("assets/profile/profile1.png"),
        ),
        SizedBox(height: 16),
        Text(
          "Nai Nai",
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfileScreen()),
            );
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
        Padding(
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
        Divider(color: Colors.grey),

        //Order History
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Icon(Icons.history, color: Color(0xffAF7950)),
              SizedBox(width: 20),
              Text(
                "Order History",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Icon(Icons.arrow_forward_ios, color: Color(0xff99A1AF)),
            ],
          ),
        ),
        Divider(color: Colors.grey),

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
        Padding(
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
        Divider(color: Colors.grey),
      ],
    );
  }

  Widget _buildBtnLogout() {
    return Container(
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
    );
  }
}
