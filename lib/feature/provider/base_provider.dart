import 'package:calvesia/feature/pages/viewmodel/base_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final BaseProvider = ChangeNotifierProvider<BaseViewModel>((ref) {
  return BaseViewModel();
});
