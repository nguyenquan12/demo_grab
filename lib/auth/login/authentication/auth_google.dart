import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grab_app/home/home_page.dart';

class AuthGoogle {
  // Firebase Authentication dùng để quản lý đăng nhập.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Google Sign-In giúp người dùng đăng nhập bằng tài khoản Google.
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Hàm này thực hiện quá trình đăng nhập bằng Google và Firebase.
  // Trả về một User nếu đăng nhập thành công, nếu không sẽ trả về null.
  Future<User?> signInWithGoogle() async {
    try {
      // Đăng nhập với Google
      // Hiển thị popup yêu cầu người dùng chọn tài khoản Google để đăng nhập.
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // Người dùng huỷ đăng nhập và trả về null.
      if (googleUser == null) {
        print("❌ Người dùng huỷ đăng nhập");
        return null;
      }

      // Lấy thông tin xác thực từ Google
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Tạo đối tượng xác thực (credential) từ Google.
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        // Token để xác thực với Google API.
        idToken: googleAuth.idToken,
        // Token giúp Firebase xác nhận danh tính người dùng.
      );

      // Đăng nhập vào Firebase
      // Dùng credential lấy từ Google để đăng nhập vào Firebase.
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      print("Lỗi đăng nhập Google: $e");
      return null;
    }
  }

  // Hàm đăng xuất người dùng khỏi Firebase và Google.
  Future<void> signOut() async {
    // Đăng xuất khỏi Firebase.
    await _auth.signOut();
    // Đăng xuất khỏi tài khoản Google.
    await _googleSignIn.signOut();
  }
}

class LoginWithGoogle extends StatelessWidget {
  final AuthGoogle _authService = AuthGoogle();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        final user = await _authService.signInWithGoogle();
        if (user != null) {
          // Thành công, điều hướng đến trang chính
          // Kiểm tra context trước khi điều hướng
          if (!context.mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
          print('Đăng nhập thành công: ${user.displayName}');
        }
      },
      label: Text('Google'),
      icon: Icon(Icons.login),
    );
  }
}
