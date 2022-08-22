import 'package:calvesia/feature/pages/viewmodel/header_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final HeaderProvider = ChangeNotifierProvider<HeaderViewmodel>((ref) {
  return HeaderViewmodel();
});
