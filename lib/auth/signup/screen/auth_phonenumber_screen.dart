import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grab_app/home/home_page.dart';

class AuthPhonenumberScreen extends StatefulWidget {
  const AuthPhonenumberScreen({super.key});

  @override
  State<AuthPhonenumberScreen> createState() => _AuthPhonenumberScreenState();
}

class _AuthPhonenumberScreenState extends State<AuthPhonenumberScreen> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _verificationId;
  bool _isLoading = false;
  bool _codeSent = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  // Xác thực số điện thoại và gửi OTP
  Future<void> verifyPhoneNumber() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: _phoneController.text.trim(),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Tự động xác thực trên Android
          await _auth.signInWithCredential(credential);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Đăng nhập thành công tự động'),
            ),
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          setState(() {
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Lỗi: ${e.message}')),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
            _codeSent = true;
            _isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Mã OTP đã được gửi')),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            _verificationId = verificationId;
            _isLoading = false;
          });
        },
        timeout: Duration(seconds: 60),
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: $e')),
      );
    }
  }

  // Xác thực OTP
  Future<void> signInWithOTP() async {
    if (_verificationId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Vui lòng gửi mã OTP trước!'),
        ),
      );
      return;
    }

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: _otpController.text.trim(),
      );

      await _auth.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng nhập thành công')),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng nhập bằng số điện thoại"),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  hintText: "+84xxxxxxxx",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 16,
              ),
              // Hiển thị ô nhập OTP khi đã gửi mã
              if (_codeSent)
                TextFormField(
                  controller: _otpController,
                  decoration: InputDecoration(
                    labelText: "Nhập OTP",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              SizedBox(
                height: 16,
              ),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        ElevatedButton(
                          onPressed: _codeSent ? null : verifyPhoneNumber,
                          child: Text("Gửi OTP"),
                        ),
                        if (_codeSent)
                          ElevatedButton(
                            onPressed: signInWithOTP,
                            child: Text("Xác nhận OTP"),
                          ),
                      ],
                    )
            ],
          )),
    );
  }
}
