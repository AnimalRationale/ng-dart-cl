// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s6_http.badge_controller;

import 'package:angular/angular.dart';

import 'dart:math' show Random;
import 'dart:async' show Future;

import 'package:s6_http/model.dart' show PirateName;

@NgController(
    selector: '[badge-controller]',
    publishAs: 'ctrl')
class BadgeController {
  static const LABEL1 = 'Arrr! Write yer name!';
  static const LABEL2 = 'Aye! Gimme a name!';

  static List<String> names = [];
  static List<String> appellations = [];

  final Http _http;
  bool dataLoaded = false;

  PirateName pn = new PirateName();

  String get pirateName => pn.firstName.isEmpty ? '' :
    '${pn.firstName} the ${pn.appellation}';

  BadgeController(this._http) {
    _loadData()
        .then((_) => dataLoaded = true)
        .catchError((error) {
          print('Could not read data from the JSON file: $error');
        });
  }

  Future _loadData() {
    return _http.get('packages/s6_http/assets/piratenames.json')
        .then((response) {
          names = response.data['names'];
          appellations = response.data['appellations'];
        });
  }

  String _name = '';

  get name => _name;

  set name(newName) {
    _name = newName;
    pn..firstName = newName
      ..appellation = _oneRandom(appellations);
  }

  bool get inputIsNotEmpty => name.trim().isNotEmpty;
  String get label => inputIsNotEmpty ? LABEL1 : LABEL2;

  void generateName() {
    name = _oneRandom(names);
  }

  String _oneRandom(List<String> list) =>
      list[new Random().nextInt(list.length)];
}
