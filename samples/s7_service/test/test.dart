// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s7_service.test;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';

import 'package:s7_service/badge_controller.dart';

import 'test_module.dart';
import 'test_names_service.dart' as TestService;

main() {
  setUp(() {
    setUpInjector();
    module((Module m) => m.install(new TestPirateModule()));
  });
  tearDown(tearDownInjector);

  group('fetching data', () {
    Injector injector;
    BadgeController ctrl;

    setUp((){
      inject((Injector injector) {
        ctrl = injector.get(BadgeController);
      });
    });

    test('should fetch a pirate name', async(() {
      expect(ctrl.name, isEmpty);
      ctrl.generateName();
      microLeap();
      expect(ctrl.name, TestService.NAME);
    }));
  });
}
