class Dugger

  # Constructor method
  constructor: (@options) ->
    @check_options()
    @initialize_map()
    @loaded = false
    @georssLayer = null


  check_options: ->
    if !@options['dom']
      throw 'Cannot load Dugger because of wrong initial params'

  initialize_map: ->
    mapOptions = {
      zoom: 8,
      center: new google.maps.LatLng(-34.397, 150.644),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    @map = new google.maps.Map(@options['dom'], mapOptions)

  load_map: (url) ->
    @georssLayer = new google.maps.KmlLayer(url)
    @georssLayer.setMap(@map)


  map: ->

  close_map: ->

  markers: ->

  data: ->

  routes: ->

  export_map: ->


# Let's roll!
root = exports ? this
root.Dugger = Dugger