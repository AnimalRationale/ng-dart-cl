// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s7_service.test_names_service;

import 'dart:async';

import 'package:angular/angular.dart';
import 'package:s7_service/services/names_service.dart';

const NAME = "Misko";
const APPELLATION = "magnificent";

class TestNamesService extends NamesService {
  TestNamesService(Http http) : super(http);

  // Reimplement to create seed data.
  Future loadData() {
    names = [NAME];
    appellations = [APPELLATION];
    return new Future.value(true);
  }
}
