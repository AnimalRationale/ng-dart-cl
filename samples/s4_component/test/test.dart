// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s4_component.test;

import 'dart:async';
import 'dart:html' show HttpRequest;

import 'package:unittest/unittest.dart';
import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/mock/module.dart';

import 'package:s4_component/badge_controller.dart';
import 'package:s4_component/pirate_module.dart';
import 'package:s4_component/components/badge_component.dart';

main() {
  const NAME = 'Misko';

  setUp(setUpInjector);
  tearDown(tearDownInjector);

  group('BadgeComponent', () {
    TestBed tb;

    setUp(module((Module m) {
      m.install(new PirateModule());
      inject((TestBed testBed) => tb = testBed);
      inject((BadgeController _ctrl) => tb.rootScope.ctrl = _ctrl);
      inject((BadgeComponent _cmp) => tb.rootScope.cmp = _cmp);
    }));

    test('initial state', (){
      expect(tb.rootScope.ctrl.name, isEmpty);
      expect(tb.rootScope.cmp.name, isEmpty);
    });

    test('updates the DOM when the name is changed', () {
      var path = 'packages/s4_component/components/badge_component.html';
      new Future(expectAsync0((){
        HttpRequest.getString(path).then((_template) {
          new MockHttpBackend().expect('GET').respond(_template);
          tb.compile(_template.trim());

          var el = tb.rootElement.querySelector('#badge-name');
          expect(el.innerHtml, isEmpty);
          tb.rootScope.cmp.name = NAME;
          tb.rootScope.$digest();
          expect(el.innerHtml, NAME);
        });
      }));
    });
  });
}
