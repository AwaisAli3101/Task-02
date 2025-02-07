import 'package:flutter/material.dart';
import 'package:myapp/home.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true; // Toggle between login & signup

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffff8a8c), Color(0xff5871f3)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('logo.jpg', height: 120.0),
            _buildSwitchButtons(),
            isLogin ? SizedBox(height: 30) : SizedBox(height: 30),
            // SizedBox(height: 20),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    padding: isLogin ?
                    EdgeInsets.all(20):EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    height: isLogin ? 250 : 320, // Adjust height for Login/Signup
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: isLogin
                          ? [
                        _buildTextField(Icons.person, "Username"),
                        _buildTextField(Icons.lock, "Password", obscureText: true),
                      ]
                          : [
                        _buildTextField(Icons.person, "Username"),
                        _buildTextField(Icons.email, "Email"),
                        _buildTextField(Icons.lock, "Password", obscureText: true),
                        _buildTextField(Icons.lock, "Confirm Password", obscureText: true),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: isLogin ? 230 : 300,
                  left: 130,
                  right: 130,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Feed()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: isLogin ? EdgeInsets.symmetric(vertical: 20, horizontal: 10):EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    ),
                    child: Text(
                      isLogin ? "Login" : "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(height: 400),
              ],
            ),
            _buildSocialIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchButtons() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () => setState(() => isLogin = true),
              style: TextButton.styleFrom(
                backgroundColor: isLogin ? Color(0xff555CFE) : Colors.transparent,
              ),
              child: Text(
                "Existing",
                style: TextStyle(
                  color: isLogin ? Colors.white : Color(0xff555CFE),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () => setState(() => isLogin = false),
              style: TextButton.styleFrom(
                backgroundColor: isLogin ? Colors.transparent : Color(0xff555CFE),
              ),
              child: Text(
                "New User",
                style: TextStyle(
                  color: isLogin ? Color(0xff555CFE) : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint, {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.purple),
          hintText: hint,
          // filled: true,
          // fillColor: Colors.white,


        ),
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.facebook, color: Colors.white, size: 40),
            onPressed: () {},
          ),
          SizedBox(width: 20),
          IconButton(
            icon: Icon(Icons.chrome_reader_mode, color: Colors.white, size: 40),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}