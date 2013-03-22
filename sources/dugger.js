// Generated by CoffeeScript 1.4.0
(function() {
  var Dugger, root;

  Dugger = (function() {

    function Dugger(options) {
      this.options = options;
      this.check_options();
      this.initialize_map();
      this.loaded = false;
      this.georssLayer = null;
    }

    Dugger.prototype.check_options = function() {
      if (!this.options['dom']) {
        throw 'Cannot load Dugger because of wrong initial params';
      }
    };

    Dugger.prototype.initialize_map = function() {
      var mapOptions;
      mapOptions = {
        zoom: 8,
        center: new google.maps.LatLng(-34.397, 150.644),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      };
      return this.map = new google.maps.Map(this.options['dom'], mapOptions);
    };

    Dugger.prototype.load_map = function(url) {
      this.georssLayer = new google.maps.KmlLayer(url);
      return this.georssLayer.setMap(this.map);
    };

    Dugger.prototype.map = function() {};

    Dugger.prototype.close_map = function() {};

    Dugger.prototype.markers = function() {};

    Dugger.prototype.data = function() {};

    Dugger.prototype.routes = function() {};

    Dugger.prototype.export_map = function() {};

    return Dugger;

  })();

  root = typeof exports !== "undefined" && exports !== null ? exports : this;

  root.Dugger = Dugger;

}).call(this);
