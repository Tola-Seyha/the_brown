import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_brown/db/product_db.dart';
import 'package:the_brown/widgets/widget_tree.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _pwdCtrl = TextEditingController();
  final TextEditingController _cpwdCtrl = TextEditingController();
  bool isShow = false;
  bool isShowc = false;

  void login() async {
    var pref = await SharedPreferences.getInstance();
    pref.setBool("isLogin", true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WidgetTree()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              width: double.infinity,
              // color: Colors.amber,
              child: Image.asset("assets/image/login.png", fit: BoxFit.cover),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 14,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to\nScammer Online Shop ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xff696969),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Good products are here, let's sign up",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff696969),
                        ),
                      ),
                      SizedBox(height: 20),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [ 
                            //email
                            TextFormField(
                              onTapOutside: (event) {
                                FocusScope.of(context).unfocus();
                              },
                              controller: _emailCtrl,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffE2E8F0),

                                hintStyle: TextStyle(fontSize: 16),
                                hintText: "Email",

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                    color: Color(0xffAF7950),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              validator: (value) =>
                                  value!.isEmpty ? "Please input email" : null,
                            ),
                            SizedBox(height: 15),

                            //pwd
                            TextFormField(
                              obscureText: isShow,
                              controller: _pwdCtrl,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffE2E8F0),
                                hintStyle: TextStyle(fontSize: 16),
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isShow = !isShow;
                                    });
                                  },
                                  icon: Icon(
                                    isShow
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                  ),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                    color: Color(0xffAF7950),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              validator: (value) =>
                                  value!.isEmpty && value.length < 6
                                  ? "Please input password"
                                  : null,
                            ),

                            // confirm pwd
                            SizedBox(height: 15),
                            TextFormField(
                              obscureText: isShowc,
                              controller: _cpwdCtrl,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffE2E8F0),
                                hintStyle: TextStyle(fontSize: 16),
                                hintText: "Confirm Password",
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isShowc = !isShowc;
                                    });
                                  },
                                  icon: Icon(
                                    isShowc
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                  ),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                  borderSide: const BorderSide(
                                    color: Color(0xffAF7950),
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              validator: (value) =>
                                  value!.isEmpty || value != _pwdCtrl.text
                                  ? "Please confirm password"
                                  : null,
                            ),
                            SizedBox(height: 15),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffAF7950),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    16,
                                  ),
                                ),
                              ),

                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  await ProfileDB.signup(
                                    email: _emailCtrl.text,
                                    password: _pwdCtrl.text,
                                  );

                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (_) => WidgetTree(),
                                  //   ),
                                  // );
                                  login();
                                }
                                ;
                              },

                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15.0,
                                  ),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Have an account?",
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(width: 10),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff0066FF),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
