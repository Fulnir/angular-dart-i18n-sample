// Copyright (C) 2014 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler

part of sample_app;

SampleConfig  config ;

class  SampleConfig {
  String title = 'Sample';
  Map i18n = new Map();
  String currentLocale = "en";
  static Future  initialize() {
    var completer = new Completer();
    SampleConfig newConfig = new SampleConfig();
    newConfig.loadTranslation(newConfig.currentLocale).then((value) {
      completer.complete(newConfig);
    },
    onError: (error) => completer.completeError(error));
    return completer.future;
  }

  Future  loadTranslation(String locale) {
    var completer = new Completer();
    // TODO test: is file available
    currentLocale = locale;
    HttpRequest.getString("i18n/" + currentLocale + ".json").then(
        (configText) {
          i18n = (JSON.decode(configText))["translations"];
          completer.complete(this);
        },
        onError: (error) => completer.completeError(error));
    return completer.future;
  }

  String translate(String aString, {String group}) {
    if (group == null) {
      var t = i18n[aString];
      if (t != null) {
        return t;
      }
    } else {
      var g = i18n[group];
      if (g != null) {
        var t = g[aString];
        if (t != null) {
          return t;
        }
      }
    }
    var gLog = "";
    if (group != null) {
      gLog = " in group '$group'";
    }
    logger.info("🌍 No translation found for the term '$aString' with the locale '$currentLocale'" + gLog + "."
        "\n🌍 -> Add following entry to the file 'i18n/$currentLocale.json'" + gLog +":"
        "  \"$aString\": \"$aString\",");
    return aString;
  }
}
