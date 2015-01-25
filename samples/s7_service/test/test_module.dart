// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s7_service.test_module;

import 'package:di/di.dart';
import 'package:angular/angular.dart';

import 'package:s7_service/components/badge_component.dart';
import 'package:s7_service/badge_controller.dart';
import 'package:s7_service/services/names_service.dart';
import 'test_names_service.dart';

class TestPirateModule extends Module {
  TestPirateModule() {
    type(BadgeController);
    // Use TestNamesService that provides the data for the service.
    type(NamesService, implementedBy: TestNamesService);
    type(BadgeComponent);
  }
}
