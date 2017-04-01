//= require core-js/client/shim.min.js
//= require zone.js/dist/zone.js
//= require rxjs/bundles/Rx.js
//= require @angular/core/bundles/core.umd.js
//= require @angular/common/bundles/common.umd.js
//= require @angular/compiler/bundles/compiler.umd.js
//= require @angular/platform-browser/bundles/platform-browser.umd.js
//= require @angular/platform-browser-dynamic/bundles/platform-browser-dynamic.umd.js
//= require @angular/forms/bundles/forms.umd.js
//= require @angular/http/bundles/http.umd.js

//= require_tree .

(function(app) {
  document.addEventListener('DOMContentLoaded', function() {
    ng.platformBrowserDynamic
      .platformBrowserDynamic()
      .bootstrapModule(app.SignUpModule);
  });

})(window.app || (window.app = {}));

