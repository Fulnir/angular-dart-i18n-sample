angular-dart-i18n-sample
========================

A sample app for localization (i18n) with angular dart.


There are a filter and a directive to translate your terms.

```html
 <p>{{"Search" | translate }}</p>
 <h2 translate="Search"></h2>
 
 Translate grouped terms with NGFilter.
 <p>{{"German" | translate: "languages" }}</p>
```

The localized strings are stored in json files.

```json
 {
  "translations" : {
    "home": "Start",
    "imprint": "Imprint",
    "about": "About",
    "Search": "Search",
    "languages": {
      "German": "German",
      "English": "English"
    }
  }
}
```