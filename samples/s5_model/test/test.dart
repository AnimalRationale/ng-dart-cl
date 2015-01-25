// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s5_model.test;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';
import 'package:s5_model/badge_controller.dart';
import 'package:s5_model/pirate_module.dart';
import 'package:s5_model/model.dart' show PirateName;

main() {
  const NAME = "Misko";
  setUp(setUpInjector);
  tearDown(tearDownInjector);

  group('PirateName', () {
    PirateName pn;
    var name = "misko";
    var appellation = "magnificent";

    test('constructor with no-args', () {
      pn = new PirateName();
      expect(pn.firstName, isEmpty);
      expect(pn.appellation, isEmpty);
    });
  });

  group('BadgeController', () {
    BadgeController ctrl;

    setUp(module((Module m) {
      m.install(new PirateModule());
      inject((BadgeController _ctrl) => ctrl = _ctrl);
    }));

    test('initial state', () {
      expect(BadgeController.names.length, greaterThan(0));
      expect(ctrl.inputIsNotEmpty, isFalse);
      expect(ctrl.label, BadgeController.LABEL2);
    });

    test('generateName() should generate name', () {
      expect(ctrl.name, isEmpty);
      ctrl.generateName();
      expect(BadgeController.names.contains(ctrl.name), isTrue);
    });

    test('names setter should generate name', () {
      expect(ctrl.name, isEmpty);
      expect(ctrl.pn.firstName, isEmpty);
      expect(ctrl.pn.appellation, isEmpty);
      ctrl.name = NAME;
      expect(ctrl.pn.firstName, NAME);
      expect(BadgeController.appellations.contains(ctrl.pn.appellation),
          isTrue);
    });
  });
}
