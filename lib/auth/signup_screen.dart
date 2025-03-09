import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grab_app/auth/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;

  Future<void> _signUp() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackBar('Vui lòng nhập email và mật khẩu');
      return;
    } else if (_confirmPasswordController.text.isEmpty) {
      _showSnackBar('Vui lòng xác nhận lại mật khẩu');
      return;
    } else if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      _showSnackBar('Mật khẩu xác nhận không khớp');
      return;
    }

    setState(() => _isLoading = true);

    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      _showSnackBar('Đăng ký thành công!');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } on FirebaseAuthException catch (e) {
      _showSnackBar(_getErrorMessage(e.code));
    } catch (e) {
      _showSnackBar('Đã xảy ra lỗi, vui lòng thử lại sau.');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  String _getErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return 'Email này đã được sử dụng!';
      case 'weak-password':
        return 'Mật khẩu quá yếu, hãy thử mật khẩu mạnh hơn!';
      case 'invalid-email':
        return 'Email không hợp lệ!';
      default:
        return 'Đã xảy ra lỗi, vui lòng thử lại!';
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Label Đăng Ký
                      const Text(
                        'Signup',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Email input
                      _buildTextField(
                        label: "Email",
                        controller: _emailController,
                        icon: Icons.email,
                        isObscure: false,
                        toggleObscure: null,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Vui lòng nhập email";
                          } else if (!RegExp(
                                  r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)")
                              .hasMatch(value)) {
                            return "Email không hợp lệ";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),

                      // Password input
                      _buildTextField(
                        label: "Password",
                        controller: _passwordController,
                        icon: Icons.lock,
                        isPassword: true,
                        isObscure:
                            _isObscurePassword, // Trạng thái riêng cho mật khẩu
                        toggleObscure: () {
                          setState(() {
                            _isObscurePassword = !_isObscurePassword;
                          });
                        },
                        validator: (value) => value!.length < 6
                            ? "Mật khẩu ít nhất 6 ký tự"
                            : null,
                      ),

                      const SizedBox(height: 15),

                      // Confirm password input
                      _buildTextField(
                        label: "Confirm Password",
                        controller: _confirmPasswordController,
                        icon: Icons.lock,
                        isPassword: true,
                        isObscure:
                            _isObscureConfirmPassword, // Trạng thái riêng cho xác nhận mật khẩu
                        toggleObscure: () {
                          setState(() {
                            _isObscureConfirmPassword =
                                !_isObscureConfirmPassword;
                          });
                        },
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return "Mật khẩu không khớp";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),

                      _buildSignUpButton(),

                      const SizedBox(height: 15),

                      _buildLoginRedirect(),
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

  // Background
  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.green.shade600,
            Colors.lightGreen.shade600,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  // TextFormField
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    bool isPassword = false,
    required bool isObscure, // Thêm biến trạng thái riêng
    VoidCallback? toggleObscure, // Hàm thay đổi trạng thái
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword ? isObscure : false, // Sử dụng biến riêng
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      // TextInputType.emailAddress giúp hiển thị bàn phím với ký tự @ và . cho email.
      // TextInputType.visiblePassword giúp tối ưu bàn phím khi nhập mật khẩu.
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.green,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey[700],
                ),
                onPressed: toggleObscure,
              )
            : null,
      ),
      validator: validator, // Kiểm tra xem dữ liệu nhập vào có hợp lệ không.
    );
  }

  Widget _buildSignUpButton() {
    return _isLoading
        ? const CircularProgressIndicator()
        : SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _signUp,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'Signup',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          );
  }

  Widget _buildLoginRedirect() {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "Already have an account?",
              style: TextStyle(),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Text(
                  'Log in',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
