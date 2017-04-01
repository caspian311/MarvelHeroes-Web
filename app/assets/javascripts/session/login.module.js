(function(app) {
  app.LoginModule =
    ng.core.NgModule({
      imports: [ 
        ng.platformBrowser.BrowserModule,
        ng.forms.FormsModule,
        ng.http.HttpModule
      ],
      declarations: [ app.LoginComponent ],
      bootstrap: [ app.LoginComponent ]
    })
    .Class({
      constructor: function() {}
    });
})(window.app || (window.app = {}));

