library s1_basics.pirate_module;

import 'package:angular/angular.dart';
import 'package:s1_basics/badge_controller.dart';
import 'package:s1_basics/components/badge_component.dart';

class PirateModule extends Module {
  PirateModule() {
    type(BadgeController);
    type(BadgeComponent);
  }
}