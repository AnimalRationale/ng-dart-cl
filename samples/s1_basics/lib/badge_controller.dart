library s1_basics.badge_controller;

import 'dart:math' show Random;
import 'package:s1_basics/model.dart';
import 'package:angular/angular.dart';
import 'dart:async' show Future;

@NgController(
  selector: '[badge-controller]',
  publishAs: 'ctrl')


class BadgeController {
  static const LABEL1 = 'Arrr! Write yer name!';
  static const LABEL2 = 'Aye! Gimme a name!';
  static List<String> names = [];
  static List<String> appellations = [];
  final Http _http;

  PirateName pn = new PirateName();

  bool dataLoaded = false;

  BadgeController(this._http) {
      _loadData()
          .then((_) => dataLoaded = true)
          .catchError((error) {
            print('Could not read data from the JSON file: $error');
          });
    }

  Future _loadData() {
            return _http.get('packages/s1_basics/assets/piratenames.json')
                .then((response) {
                  names = response.data['names'];
                  appellations = response.data['appellations'];
                });
          }

  String get pirateName => pn.firstName.isEmpty ? '' :
        '${pn.firstName} the ${pn.appellation}';

  bool get inputIsNotEmpty => name.trim().isNotEmpty;
    String get label => inputIsNotEmpty ? LABEL1 : LABEL2;

    String _oneRandom(List<String> list) =>
             list[new Random().nextInt(list.length)];

    void generateName() {
      name = _oneRandom(names);
    }

    String _name = '';

    get name => _name;

    set name(newName) {
      _name = newName;
      pn..firstName = newName
        ..appellation = _oneRandom(appellations);
    }
}