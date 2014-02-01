//
// Copyright (C) 2014 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//

library sample_app;

import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:angular/angular.dart';
import 'package:bootjack/bootjack.dart';
import 'package:angular/routing/module.dart';
import 'package:logging/logging.dart';


part '../lib/head_cntl.dart';
part '../lib/main_cntl.dart';
part  'config.dart';
part 'routing/app_router.dart';
part 'view/home_cntl.dart';
part 'view/about_cntl.dart';

final Logger logger = new Logger('SampleApp');




// i18n
@NgFilter(name:'translate')
class SampleTranslatorFilter {
  call(localizableStringToFilter) {
     return config.translate(localizableStringToFilter);
  }
}
@NgDirective(
  selector: '[translate]',
  map: const { 'translate' : '<=>translate' }
)
class SampleTranslatorDirective {
  String translate;
  Element element;
  SampleTranslatorDirective(this.element) {
    element.text = config.translate(element.attributes["translate"]);
    window.on['languageChangedEvent'].listen((e) {
      element.text = config.translate(element.attributes["translate"]);
    });
  }


}

class SampleApp extends Module {
  SampleApp() {
    type(HeadController);
    type(MainController);
    type(SampleController);
    type(SampleTranslatorFilter);
    type(SampleTranslatorDirective);
    type(RouteInitializer, implementedBy: SampleRouteInitializer);
    factory(NgRoutingUsePushState,
        (_) => new NgRoutingUsePushState.value(false));
  }
}

main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  SampleConfig.initialize().then((value) {
    config = value;
    // Bootjack
    Dropdown.use();
    initPolymer();
    ngBootstrap(module: new SampleApp());
  });
}