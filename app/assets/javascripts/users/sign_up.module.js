(function(app) {
  app.SignUpModule =
    ng.core.NgModule({
      imports: [ 
        ng.platformBrowser.BrowserModule,
        ng.forms.FormsModule,
        ng.http.HttpModule
      ],
      declarations: [ app.SignUpComponent ],
      bootstrap: [ app.SignUpComponent ]
    })
    .Class({
      constructor: function() {}
    });
})(window.app || (window.app = {}));

