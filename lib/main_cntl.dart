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

  /// Load the selected language with the given locale id.
  void setLanguage(String locale) {
    config.loadTranslation(locale).then((value) {
      /// Send an event to inform all elments that the language is changed.
      window.dispatchEvent(new CustomEvent('languageChangedEvent'));
    });
  }

}
