(function(app) {
  app.LoginModule =
    ng.core.NgModule({
      imports: [ ng.platformBrowser.BrowserModule ],
      declarations: [ app.LoginComponent ],
      bootstrap: [ app.LoginComponent ]
    })
    .Class({
      constructor: function() {}
    });
})(window.app || (window.app = {}));

