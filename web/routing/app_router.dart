//
// Copyright (C) 2014 Edwin Bühler. All Rights Reserved.
//
// @author Edwin Bühler
//

part of sample_app;

class SampleRouteInitializer implements RouteInitializer {

  init(Router router, ViewFactory view) {
    router.root
      ..addRoute(
        name: 'view_default',
        defaultRoute: true,
        enter: (_) =>
            router.go('index', {}, replace:true))
            
      ..addRoute(
        name: 'home',
        enter: (_) =>
            router.go('index', {}, replace:true))

      ..addRoute(
        name: 'index',
        path: '/index',
        enter: view('view/home.html'))

      ..addRoute(
        name: 'about',
        path: '/about',
        enter: view('view/about.html'))
        
        ;
  }
}