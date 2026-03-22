import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

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
              _buildProfile(),
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

  Widget _buildProfile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/profile/profile1.png"),
          ),
          SizedBox(height: 16),
          Text(
            "Nai",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),

          // Bounceable(
          //   onTap: () {
          //     setState(() {
          //       isEdit = !isEdit;
          //     });
          //   },
          //   child: Container(
          //     height: 40,
          //     padding: EdgeInsets.symmetric(horizontal: 20),
          //     decoration: BoxDecoration(
          //       color: Color(0xffCC0909),
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Text(
          //           "Edit Profile",
          //           style: TextStyle(
          //             fontSize: 16,
          //             fontWeight: FontWeight.w400,
          //             color: Colors.white,
          //           ),
          //         ),
          //         Icon(Icons.arrow_forward_ios, color: Colors.white),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildSave() {
    return Column(
      children: [
        Bounceable(
          onTap: () {},
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
            label: Text("Nai"),
          ),
          Divider(color: Colors.grey),
          _buildTextField(
            text: "First Name",
            icon: Icons.person,
            controller: ctrlFn,
            label: Text("Huoy"),
          ),
          Divider(color: Colors.grey),
          _buildTextField(
            text: "Gender",
            icon: Icons.transgender,
            controller: ctrlGender,
            label: Text("Female"),
          ),
          Divider(color: Colors.grey),
          _buildTextField(
            text: "Phone Number",
            icon: Icons.phone_android,
            controller: ctrlPhone,
            label: Text("099887756"),
          ),
          Divider(color: Colors.grey),
          _buildTextField(
            text: "Location",
            icon: Icons.pin_drop,
            controller: ctrlLocation,
            label: Text("Phnom penh"),
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
}
