library s1_basics.badge_controller;

import 'package:s1_basics/model.dart';
import 'package:angular/angular.dart';
import 'dart:async' show Future;
import 'package:s1_basics/services/names_service.dart';

@NgController(
    selector: '[badge-controller]',
    publishAs: 'ctrl')
class BadgeController {
  NamesService ns;

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
  String get label => inputIsNotEmpty ? "Arrr! Write yer name!" :
    "Aye! Gimme a name!";

  Future generateName() => ns.randomName().then((aName) {
    name = aName;
  });
}