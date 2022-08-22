import 'package:calvesia/feature/Authencitation/viewmodel/user_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final UserProvider = ChangeNotifierProvider<UserVievModel>((ref) {
return UserVievModel();
});
