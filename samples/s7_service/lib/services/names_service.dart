// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s7_service.services.names_service;

import 'package:angular/angular.dart';
import 'dart:async';
import 'dart:math';

@NgInjectableService()
class NamesService {
  static final Random rand = new Random();
  final Http _http;
  List<String> names;
  List<String> appellations;

  NamesService(this._http);

  Future _loadData() {
    if (names != null) return new Future.value(true);
    return _http.get('packages/s7_service/assets/piratenames.json')
      .then((HttpResponse response) {
        names = response.data['names'];
        appellations = response.data['appellations'];
      })
      .catchError((error) {
        print('Could not read data from the JSON file: $error');
      });
  }

  Future<String> randomName() {
    return _loadData().then((_) => _oneRandom(names));
  }

  Future<String> randomAppellation() {
    return _loadData().then((_) => _oneRandom(appellations));
  }

  String _oneRandom(List<String> list) =>
      list[rand.nextInt(list.length)];
}
