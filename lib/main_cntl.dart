//
// Copyright (C) 2014 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//

part of sample_app;

@NgController(
    selector: '[main-controller]',
    publishAs: 'cntl')

class MainController {

  MainController( ) {
  }

  void setLanguage(String locale) {
    config.loadTranslation(locale).then((value) {
      window.dispatchEvent(new CustomEvent('languageChangedEvent'));
    });
  }

}
