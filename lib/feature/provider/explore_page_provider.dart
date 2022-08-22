import 'package:calvesia/feature/pages/viewmodel/explore_page_viewmodel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final ExplorePageProvider = ChangeNotifierProvider<ExplorePageViewModel>((ref) {
  return ExplorePageViewModel();
});
