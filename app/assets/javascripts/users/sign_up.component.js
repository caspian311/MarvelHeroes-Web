(function(app) {
  app.SignUpComponent =
    ng.core.Component({
      selector: 'signup',
      templateUrl: 'sign_up.html',
      inputs: ['token']
    })
    .Class({
      constructor: [ng.http.Http, ng.core.ElementRef, function(http, elementRef) {
        this.http = http;
        this.elementRef = elementRef;
        this.errorMessage = null;
      }],
      onSubmit: function(signUpForm) {
        var authenticityToken = this.elementRef.nativeElement.getAttribute('token');
        
        var headers = new ng.http.Headers();
        headers.append('Content-Type', 'application/json');
        headers.append('X-CSRF-Token', authenticityToken);

        var self = this;
        function handleBadRegistration(error) {
          self.errorMessage = error.json().error;
        }
        function goodRegistration(data) {
          location = data.json().redirect_to;
        }

        this.http.post('/users', JSON.stringify(signUpForm.value), {headers: headers})
          .subscribe(goodRegistration, handleBadRegistration);
      },
    });
})(window.app || (window.app = {}));

