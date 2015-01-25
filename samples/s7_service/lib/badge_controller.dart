// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s7_service.badge_controller;

import 'package:angular/angular.dart';

import 'dart:async' show Future;

import 'package:s7_service/services/names_service.dart';
import 'package:s7_service/model.dart' show PirateName;

@NgController(
    selector: '[badge-controller]',
    publishAs: 'ctrl')
class BadgeController {
  NamesService ns;
  static const LABEL1 = 'Arrr! Write yer name!';
  static const LABEL2 = 'Aye! Gimme a name!';

  PirateName pn = new PirateName();

  String get pirateName => pn.firstName.isEmpty ? '' :
    '${pn.firstName} the ${pn.appellation}';

  BadgeController(this.ns);

  String _name = '';

  get name => _name;

  set name(newName) {
    _name = newName;
    ns.randomAppellation().then((appellation) {
      pn..firstName = newName
        ..appellation = appellation;
    });
  }

  bool get inputIsNotEmpty => name.trim().isNotEmpty;
  String get label => inputIsNotEmpty ? LABEL1 : LABEL2;

  Future generateName() => ns.randomName().then((aName) {
    name = aName;
  });
}
