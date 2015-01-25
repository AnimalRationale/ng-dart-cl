// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s8_filter.pirate_module;

import 'package:angular/angular.dart';
import 'package:s8_filter/badge_controller.dart';
import 'package:s8_filter/components/badge_component.dart';
import 'package:s8_filter/services/names_service.dart';
import 'package:s8_filter/filters/capitalize_filter.dart';

class PirateModule extends Module {
  PirateModule() {
    type(BadgeController);
    type(BadgeComponent);
    type(NamesService);
    type(CapitalizeFilter);
  }
}
