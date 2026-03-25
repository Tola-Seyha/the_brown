import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class ChangePwdScreen extends StatefulWidget {
  const ChangePwdScreen({super.key});

  @override
  State<ChangePwdScreen> createState() => _ChangePwdScreenState();
}

class _ChangePwdScreenState extends State<ChangePwdScreen> {
  var ctrlCurrent = TextEditingController();
  var ctrlNew = TextEditingController();
  var ctrlConfirm = TextEditingController();
  // bool isHidePw = false;
  bool hideCurrentPw = true;
  bool hideNewPw = true;
  bool hideConfirmPw = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F8F6),
      appBar: AppBar(title: Text("Change Password")),
      body: Column(
        children: [
          SizedBox(height: 16),
          _buildTextField(
            text: "Current Password",
            controller: ctrlCurrent,
            label: "Enter Current Password",
            isPassword: true,
            isHidden: hideCurrentPw,
            onToggle: () {
              setState(() {
                hideCurrentPw = !hideCurrentPw;
              });
            },
          ),
          Divider(color: Colors.grey),
          SizedBox(height: 16),
          _buildTextField(
            text: "New Password",
            controller: ctrlNew,
            label: "Enter New Password",
            isPassword: true,
            isHidden: hideNewPw,
            onToggle: () {
              setState(() {
                hideNewPw = !hideNewPw;
              });
            },
          ),
          Divider(color: Colors.grey),
          SizedBox(height: 16),
          _buildTextField(
            text: "Confirm New Password",
            controller: ctrlConfirm,
            label: "Enter Confirm New Password",
            isPassword: true,
            isHidden: hideConfirmPw,
            onToggle: () {
              setState(() {
                hideConfirmPw = !hideConfirmPw;
              });
            },
          ),
          Divider(color: Colors.grey),
          Spacer(),
          _buildSave(),
          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String text,
    required TextEditingController controller,
    required String label,
    bool isPassword = false,
    required bool isHidden,
    required VoidCallback onToggle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xffDFC9B9),
            ),
          ),

          TextField(
            controller: controller,
            obscureText: isPassword ? isHidden : false,
            decoration: InputDecoration(
              hintText: label,
              border: OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Icon(Icons.lock, color: Color(0xffDFC9B9)),
              suffixIcon: isPassword
                  ? Bounceable(
                      onTap: onToggle,
                      child: Icon(
                        isHidden ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xffDFC9B9),
                      ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSave() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
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
                  "Update Password",
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
      ),
    );
  }
}
