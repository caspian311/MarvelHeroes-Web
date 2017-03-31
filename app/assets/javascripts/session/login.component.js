(function(app) {
  app.LoginComponent =
    ng.core.Component({
      selector: 'login',
      templateUrl: 'heroes.html'
    })
    .Class({
      constructor: function() {
        this.title = 'Login template';
      }
    });
})(window.app || (window.app = {}));

