library s1_basics.pirate_module;

import 'package:angular/angular.dart';
import 'package:s1_basics/badge_controller.dart';
import 'package:s1_basics/components/badge_component.dart';
import 'package:s1_basics/services/names_service.dart';
import 'package:s1_basics/filters/capitalize_filter.dart';

class PirateModule extends Module {
  PirateModule() {
    type(BadgeController);
    type(BadgeComponent);
    type(NamesService);
    type(CapitalizeFilter);
  }
}