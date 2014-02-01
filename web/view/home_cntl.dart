//
// Copyright (C) 2014 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//

part of sample_app;

@NgController(
    selector: '[sample-controller]',
    publishAs: 'cntl')

class SampleController {
  final String message = 'Sample App';
  final String language = 'Sample App';
  var languageElement;

  SampleController() {
    setCurrentLanguage();
    window.on['languageChangedEvent'].listen((e) {
      setCurrentLanguage();
    });
  }

  String setCurrentLanguage() {
    languageElement = config.currentLocale;

  }
}
