import 'package:auto_route/auto_route.dart';
import 'package:package_tester/views/detail_view/detail_view.dart';
import 'package:package_tester/views/home_view/home_view.dart';
import 'package:package_tester/views/image_provider_view/image_provider_view.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        MaterialRoute(page: HomeViewRoute.page, initial: true),
        MaterialRoute(page: DetailViewRoute.page),
        MaterialRoute(page: ImageProviderViewRoute.page),
      ];
}
