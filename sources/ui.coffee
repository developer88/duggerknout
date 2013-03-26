class UI

  constructor: (@dugger) ->
    @bind_events()
    @clean_form()


  bind_events: ->
    #Process KML Map
    $(".process-map-btn").click =>
      if @validate_map_source('#kml_url')
        url = $('#kml_url').val()
        # Just for test
        url = 'https://maps.google.com/maps/ms?authuser=0&vps=2&ie=UTF8&msa=0&output=nl&msid=202130663253335322659.0004d8d93d20636c74095'
        @clean_form()
        @dugger.load_map(url, (data) =>
            # initialize markers
            console.log data
            $('#loadMapModal').modal 'hide'
            @helper 'Voila! Now you can start creating a route!'
          )

    # Clean up modal when hidden
    $('#loadMapModal').on('hidden', =>
          @clean_modal()         
      )

    # Clean up modal when shown
    $('#loadMapModal').on('show', =>
          @clean_modal()
      )   
        
  # Validate url field for modal
  validate_map_source: (dom) ->
    return true # TODO DELETE IT
    if $(dom).val().length == 0
      $(dom).parent().addClass "error"
      return false
    else
      $(dom).parent().removeClass "error"
      return true

  # Clean up modal
  clean_modal: ->
    $('#kml_url').parent().removeClass "error"
    $('#kml_url').val ''

  clean_form: ->
    @clean_modal()
    @helper 'Please load map to start creating routes!'

  # Display a message in the sidebar
  helper: (message) ->
    return false unless message
    $('.sidebar-helper').html message
  

root = exports ? this
root.UI = UI