library s1_basics.badge_controller;

import 'package:angular/angular.dart';

@NgController(
  selector: '[badge-controller]',
  publishAs: 'ctrl')

class BadgeController {
  static const DEFAULT_NAME = 'Anne Bonney';
    static const LABEL1 = 'Arrr! Write yer name!';
    static const LABEL2 = 'Aye! Gimme a name!';
  String name = '';

  bool get inputIsNotEmpty => name.trim().isNotEmpty;
    String get label => inputIsNotEmpty ? LABEL1 : LABEL2;

    generateName() {
      name = DEFAULT_NAME;
    }
}