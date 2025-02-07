// // // import 'package:flutter/material.dart';
// // //
// // // void main() {
// // //   runApp(const FigmaToCodeApp());
// // // }
// // //
// // // class FigmaToCodeApp extends StatelessWidget {
// // //   const FigmaToCodeApp({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       theme: ThemeData.dark().copyWith(
// // //         scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
// // //       ),
// // //       home: const SignupScreen(),
// // //     );
// // //   }
// // // }
// // //
// // // class SignupScreen extends StatelessWidget {
// // //   const SignupScreen({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: SingleChildScrollView(
// // //         child: Column(
// // //           children: [
// // //             // Top gradient background with circular decoration
// // //             Container(
// // //               height: 300,
// // //               decoration: const BoxDecoration(
// // //                 gradient: LinearGradient(
// // //                   colors: [Color(0xFF121F43), Color(0xFF2F4FA9)],
// // //                   begin: Alignment.topLeft,
// // //                   end: Alignment.bottomRight,
// // //                 ),
// // //               ),
// // //               child: Stack(
// // //                 children: [
// // //                   Positioned(
// // //                     left: -50,
// // //                     top: -50,
// // //                     child: _buildCircle(150, Colors.blue.shade900),
// // //                   ),
// // //                   Positioned(
// // //                     right: -50,
// // //                     bottom: -50,
// // //                     child: _buildCircle(150, Colors.blue.shade800),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //
// // //             // White rounded container for form
// // //             Container(
// // //               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
// // //               decoration: const BoxDecoration(
// // //                 color: Colors.white,
// // //                 borderRadius: BorderRadius.only(
// // //                   topLeft: Radius.circular(25),
// // //                   topRight: Radius.circular(25),
// // //                 ),
// // //               ),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   const Center(
// // //                     child: Text(
// // //                       'Get Started',
// // //                       style: TextStyle(
// // //                         color: Color(0xFF2F4FA9),
// // //                         fontSize: 32,
// // //                         fontWeight: FontWeight.bold,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //
// // //                   // Username field
// // //                   _buildTextField(
// // //                     label: 'Username',
// // //                     hint: 'Enter username here',
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //
// // //                   // Email field
// // //                   _buildTextField(
// // //                     label: 'Email',
// // //                     hint: 'Enter email here',
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //
// // //                   // Password field
// // //                   _buildTextField(
// // //                     label: 'Password',
// // //                     hint: 'Enter password here',
// // //                     obscureText: true,
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //
// // //                   // Agree to terms
// // //                   Row(
// // //                     children: [
// // //                       Checkbox(
// // //                         value: false,
// // //                         onChanged: (value) {},
// // //                         shape: RoundedRectangleBorder(
// // //                           borderRadius: BorderRadius.circular(4),
// // //                         ),
// // //                         side: const BorderSide(color: Color(0xFF2F4FA9)),
// // //                       ),
// // //                       const Expanded(
// // //                         child: Text.rich(
// // //                           TextSpan(
// // //                             children: [
// // //                               TextSpan(
// // //                                 text: 'I agree to the processing of ',
// // //                                 style: TextStyle(color: Colors.grey),
// // //                               ),
// // //                               TextSpan(
// // //                                 text: 'personal data',
// // //                                 style: TextStyle(color: Color(0xFF2F4FA9)),
// // //                               ),
// // //                             ],
// // //                           ),
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //
// // //                   // Sign-up button
// // //                   SizedBox(
// // //                     width: double.infinity,
// // //                     child: ElevatedButton(
// // //                       onPressed: () {},
// // //                       style: ElevatedButton.styleFrom(
// // //                         backgroundColor: const Color(0xFF2F4FA9),
// // //                         shape: RoundedRectangleBorder(
// // //                           borderRadius: BorderRadius.circular(20),
// // //                         ),
// // //                         padding: const EdgeInsets.symmetric(vertical: 15),
// // //                       ),
// // //                       child: const Text(
// // //                         'Sign Up',
// // //                         style: TextStyle(fontSize: 18),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 20),
// // //
// // //                   // Social sign-up options
// // //                   const Center(
// // //                     child: Text(
// // //                       'Sign up with',
// // //                       style: TextStyle(color: Color(0xFF6A80C9)),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 10),
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.center,
// // //                     children: [
// // //                       _buildSocialIcon(),
// // //                       const SizedBox(width: 20),
// // //                       _buildSocialIcon(),
// // //                       const SizedBox(width: 20),
// // //                       _buildSocialIcon(),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 30),
// // //
// // //                   // Already have an account?
// // //                   Center(
// // //                     child: Text.rich(
// // //                       TextSpan(
// // //                         children: [
// // //                           const TextSpan(
// // //                             text: 'Already have an account? ',
// // //                             style: TextStyle(color: Colors.grey),
// // //                           ),
// // //                           TextSpan(
// // //                             text: 'Sign In',
// // //                             style: TextStyle(color: Color(0xFF6A80C9)),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildCircle(double size, Color color) {
// // //     return Container(
// // //       width: size,
// // //       height: size,
// // //       decoration: BoxDecoration(
// // //         color: color,
// // //         shape: BoxShape.circle,
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildTextField({
// // //     required String label,
// // //     required String hint,
// // //     bool obscureText = false,
// // //   }) {
// // //     return Column(
// // //       crossAxisAlignment: CrossAxisAlignment.start,
// // //       children: [
// // //         Text(
// // //           label,
// // //           style: const TextStyle(
// // //             color: Color(0xFF2F4FA9),
// // //             fontSize: 16,
// // //             fontWeight: FontWeight.bold,
// // //           ),
// // //         ),
// // //         const SizedBox(height: 8),
// // //         TextField(
// // //           obscureText: obscureText,
// // //           decoration: InputDecoration(
// // //             hintText: hint,
// // //             border: OutlineInputBorder(
// // //               borderRadius: BorderRadius.circular(20),
// // //               borderSide: const BorderSide(color: Colors.grey),
// // //             ),
// // //             focusedBorder: OutlineInputBorder(
// // //               borderRadius: BorderRadius.circular(20),
// // //               borderSide: const BorderSide(color: Color(0xFF2F4FA9)),
// // //             ),
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }
// // //
// // //   Widget _buildSocialIcon() {
// // //     return CircleAvatar(
// // //       radius: 25,
// // //       backgroundColor: Colors.white,
// // //       child: Image.asset('assets/Alligator.png'),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(SignUpApp());
// // }
// //
// // class SignUpApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: SignUpScreen(),
// //     );
// //   }
// // }
// //
// // class SignUpScreen extends StatefulWidget {
// //   @override
// //   _SignUpScreenState createState() => _SignUpScreenState();
// // }
// //
// // class _SignUpScreenState extends State<SignUpScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _nameController = TextEditingController();
// //   final _passwordController = TextEditingController();
// //   final _confirmPasswordController = TextEditingController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[100],
// //       body: Center(
// //         child: SingleChildScrollView(
// //           padding: const EdgeInsets.all(24.0),
// //           child: Card(
// //             elevation: 5,
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(16),
// //             ),
// //             child: Padding(
// //               padding: const EdgeInsets.all(20.0),
// //               child: Form(
// //                 key: _formKey,
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     // Title
// //                     Text(
// //                       'Sign Up',
// //                       style: TextStyle(
// //                         fontSize: 24,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.blueAccent,
// //                       ),
// //                     ),
// //                     SizedBox(height: 16),
// //
// //                     // Name Field
// //                     TextFormField(
// //                       controller: _nameController,
// //                       decoration: InputDecoration(
// //                         labelText: 'Name',
// //                         prefixIcon: Icon(Icons.person),
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(12),
// //                         ),
// //                       ),
// //                       validator: (value) {
// //                         if (value == null || value.isEmpty) {
// //                           return 'Please enter your name';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 16),
// //
// //                     // Password Field
// //                     TextFormField(
// //                       controller: _passwordController,
// //                       obscureText: true,
// //                       decoration: InputDecoration(
// //                         labelText: 'Password',
// //                         prefixIcon: Icon(Icons.lock),
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(12),
// //                         ),
// //                       ),
// //                       validator: (value) {
// //                         if (value == null || value.length < 6) {
// //                           return 'Password must be at least 6 characters';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 16),
// //
// //                     // Confirm Password Field
// //                     TextFormField(
// //                       controller: _confirmPasswordController,
// //                       obscureText: true,
// //                       decoration: InputDecoration(
// //                         labelText: 'Confirm Password',
// //                         prefixIcon: Icon(Icons.lock_outline),
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(12),
// //                         ),
// //                       ),
// //                       validator: (value) {
// //                         if (value == null || value != _passwordController.text) {
// //                           return 'Passwords do not match';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     SizedBox(height: 24),
// //
// //                     // Submit Button
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         if (_formKey.currentState!.validate()) {
// //                           ScaffoldMessenger.of(context).showSnackBar(
// //                             SnackBar(
// //                               content: Text('Signed up successfully!'),
// //                               backgroundColor: Colors.green,
// //                             ),
// //                           );
// //                         }
// //                       },
// //                       style: ElevatedButton.styleFrom(
// //                         padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(12),
// //                         ),
// //                         backgroundColor: Colors.blueAccent,
// //                       ),
// //                       child: Text(
// //                         'Submit',
// //                         style: TextStyle(fontSize: 16, color: Colors.white),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _passwordController.dispose();
// //     _confirmPasswordController.dispose();
// //     super.dispose();
// //   }
// // }
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SignUpPage(),
//     );
//
//   }
// }
//
// class SignUpPage extends StatefulWidget {
//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }
//
// class _SignUpPageState extends State<SignUpPage> {
//   final _formKey = GlobalKey<FormState>();
//   final nameCtrl = TextEditingController();
//   final passCtrl = TextEditingController();
//   final confirmPassCtrl = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Center(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(20),
//           child: Card(
//             elevation: 4,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Padding(
//               padding: EdgeInsets.all(16),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'Sign Up',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//                     SizedBox(height: 12),
//
//                     // Name Field
//                     TextFormField(
//                       controller: nameCtrl,
//                       decoration: InputDecoration(
//                         labelText: 'Name',
//                         prefixIcon: Icon(Icons.person),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (val) {
//                         if (val == null || val.isEmpty) {
//                           return 'Enter your name';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 12),
//
//
//                     TextFormField(
//                       controller: passCtrl,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         prefixIcon: Icon(Icons.lock),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (val) {
//                         if (val == null || val.length < 6) {
//                           return 'Password must be at least 6 characters';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 12),
//
//                     TextFormField(
//                       controller: confirmPassCtrl,
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         labelText: 'Confirm Password',
//                         prefixIcon: Icon(Icons.lock_outline),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (val) {
//                         if (val == null || val != passCtrl.text) {
//                           return 'Passwords don\'t match';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 20),
//
//
//                     ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('Signed up successfully!'),
//                               backgroundColor: Colors.green,
//                             ),
//                           );
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         backgroundColor: Colors.blue,
//                       ),
//                       child: Text(
//                         'Submit',
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     nameCtrl.dispose();
//     passCtrl.dispose();
//     confirmPassCtrl.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:myapp/login.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;
  bool _passwordVisible = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Login Successful!'),
            backgroundColor: Colors.green,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 12),

                    // Email Field
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Enter your email';
                        }
                        if (!RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
                            .hasMatch(val)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),

                    // Password Field with Visibility Toggle
                    TextFormField(
                      controller: passwordController,
                      obscureText: !_passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (val) {
                        if (val == null || val.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),

                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Navigate to Forgot Password screen
                        },
                        child: Text('Forgot Password?'),
                      ),
                    ),
                    SizedBox(height: 12),

                    // Login Button with Loading Indicator
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.blueAccent,
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 12),

                    // Sign Up Redirect
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            // Navigate to Sign Up screen
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}