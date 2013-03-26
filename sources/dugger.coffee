class Dugger

  # Constructor method
  constructor: (@options) ->
    @check_options()
    @initialize_map()
    @loaded = false
    @georssLayer = null
    @data = null


  check_options: ->
    if !@options['dom']
      throw 'Cannot load Dugger because of wrong initial params'

  initialize_map: ->
    mapOptions = {
      maxZoom: 12,
      zoom: 9,
      center: new google.maps.LatLng(55.738673,37.593774),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    @map = new google.maps.Map(@options['dom'], mapOptions)

  load_map: (url, callback) ->
    @clean_up()
    console.log callback
    console.log url
    @georssLayer = new google.maps.KmlLayer(url)
    @georssLayer.setMap(@map)    
    google.maps.event.addListener(@georssLayer, "metadata_changed", =>
      console.debug "metadata_changed"
      @data = @georssLayer.getMetadata()
      @loaded = true
      callback(@data)
    )
    

  object: ->
    @map

  close_map: ->

  markers: ->

  data: ->
    @data

  routes: ->

  export_map: ->

  clean_up: ->
    @georssLayer.setMap(null) if @georssLayer


# Let's roll!
root = exports ? this
root.Dugger = Dugger