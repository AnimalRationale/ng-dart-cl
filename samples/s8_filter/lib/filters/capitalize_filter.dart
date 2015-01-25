// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library s8_filter.filter.capitalize_filter;

import 'package:angular/angular.dart';

@NgFilter(name: 'capitalize')
class CapitalizeFilter {
  call(String name) {
    if (name == null || name.isEmpty) return '';
    return name[0].toUpperCase() + name.substring(1);
  }
}
