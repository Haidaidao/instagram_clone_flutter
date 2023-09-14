import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/resources/auth_method.dart';

class UserNotifer extends StateNotifier<User> {
  final AuthMethods _authMethods = AuthMethods();

  UserNotifer()
      : super(User(
            username: "",
            uid: "",
            photoUrl: "",
            email: "",
            bio: "",
            followers: [],
            following: []));

  User get getUser => state;

  Future<void> getUserFromData() async {
    User user = await _authMethods.getUserDetail();
    state = user;
  }
}

final UserProvider = StateNotifierProvider<UserNotifer, User>((ref) {
  return UserNotifer();
});
