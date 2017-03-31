(function(app) {
  app.LoginComponent =
    ng.core.Component({
      selector: 'login',
      templateUrl: '/templates/session/login.html'
    })
    .Class({
      constructor: function() {
        this.title = 'Login template';
      }
    });
})(window.app || (window.app = {}));

