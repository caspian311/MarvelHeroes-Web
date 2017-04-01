(function(app) {
  app.LoginComponent =
    ng.core.Component({
      selector: 'login',
      templateUrl: 'login.html',
      inputs: ['token']
    })
    .Class({
      constructor: [ng.http.Http, ng.core.ElementRef, function(http, elementRef) {
        this.http = http;
        this.elementRef = elementRef;
        this.errorMessage = null;
      }],
      onSubmit: function(loginForm) {
        var authenticityToken = this.elementRef.nativeElement.getAttribute('token');
        
        var headers = new ng.http.Headers();
        headers.append('Content-Type', 'application/json');
        headers.append('X-CSRF-Token', authenticityToken);

        var self = this;
        function handleBadLogin(error) {
          self.errorMessage = error.json().error;
        }
        function goodLogin() {
          location = '/';
        }

        this.http.post('/session', JSON.stringify(loginForm.value), {headers: headers})
          .subscribe(goodLogin, handleBadLogin);
      },
    });
})(window.app || (window.app = {}));

