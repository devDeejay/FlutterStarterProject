import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:starter_app/responsive/responsive_layout.dart';

import 'home_screen_viewmodel.dart';

/// To open a new screen use:
/// locator.get<NavigationService>().navigateTo("");

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
      viewModelBuilder: () => HomeScreenViewModel(),
      builder: (buildContext, model, child) {
        return ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: HomeMobileScreenWidget(),
            landscape: HomeMobileScreenWidget(),
          ),
          tablet: OrientationLayout(
            portrait: HomeMobileScreenWidget(),
            landscape: HomeLargeScreenWidget(),
          ),
          desktop: OrientationLayout(
            landscape: HomeLargeScreenWidget(),
            portrait: HomeLargeScreenWidget(),
          ),
        );
      },
    );
  }
}

class HomeMobileScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class HomeLargeScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
