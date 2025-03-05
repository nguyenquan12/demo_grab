import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grab_app/auth/signup_screen.dart';
import 'package:grab_app/home/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  //  Thêm dispose() để giải phóng bộ nhớ
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Hiển thị thông báo thành công
      if (userCredential.user != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Đăng nhập thành công!'),
        ));
      }

      // Chuyển sang trang HomeScreen sau khi đăng nhập thành công
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      setState(() {
        switch (e.code) {
          case 'invalid-email':
            _errorMessage = "Email không hợp lệ!";
            break;
          case 'user-not-found':
            _errorMessage = "Không tìm thấy tài khoản!";
            break;
          case 'wrong-password':
            _errorMessage = "Mật khẩu không đúng!";
            break;
          case 'user-disabled':
            _errorMessage = "Tài khoản đã bị vô hiệu hóa!";
            break;
          default:
            _errorMessage = e.message ?? "Đăng nhập thất bại!";
        }
      });

      // Hiển thị thông báo lỗi lên app
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_errorMessage!),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      // Lỗi không xác định
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Lỗi hệ thống: $e"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 10),
            if (_errorMessage != null)
              Text(_errorMessage!, style: TextStyle(color: Colors.red)),
            SizedBox(height: 10),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _signIn,
                    child: Text('Login'),
                  ),
          
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),),);
            } , 
               child: Text('Signup'),),
          ],
        ),
      ),
    );
  }
}
