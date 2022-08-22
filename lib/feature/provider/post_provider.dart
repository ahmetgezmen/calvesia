import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../pages/viewmodel/post_share_viewmodel.dart';

final PostIsSharingAndShowingProvider = ChangeNotifierProvider<PostIsSharingAndShowingViewmodel>((ref) {
  return PostIsSharingAndShowingViewmodel();
});


final PostShareProvider = ChangeNotifierProvider<PostShareViewmodel>((ref) {
  return PostShareViewmodel();
});
