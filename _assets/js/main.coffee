#= require jquery.min
#= require bootstrap.min
#= require jquery-smooth-scroll/jquery.smooth-scroll.min
#= require matchHeight/dist/jquery.matchHeight-min
#= require picturefill/dist/picturefill
#= require blazy/blazy.min
#= require fienta

# Create a JS Google Map object and add important location markers to it
window.initMap = ->
  map = new google.maps.Map $('.map')[0],
    center:
      lat: 59.437622
      lng: 24.749914
    zoom: 15

  cinema = new google.maps.Marker
    position:
      lat: 59.437642
      lng: 24.749892
    map: map
    title: 'Kinomaja'
    label: '1'

  cinemaInfo = new google.maps.InfoWindow
    content: """
      <h3>The Cinema (Kinomaja)</h3>
      <p class="lead">Uus 3, Tallinn</p>
      <p>Performance venue</p>
"""
  cinema.addListener 'click', -> cinemaInfo.open map, cinema

  # Cinema
  new google.maps.Circle
    strokeColor: '#a43a5a'
    fillOpacity: 0
    strokeWeight: 4
    map: map
    center:
      lat: 59.437642
      lng: 24.749892
    radius: 20

  # Hostel
  new google.maps.Circle
    strokeColor: '#a43a5a'
    fillOpacity: 0
    strokeWeight: 4
    map: map
    center:
      lat: 59.439252
      lng: 24.756870
    radius: 20

  hostel = new google.maps.Marker
    position:
      lat: 59.439252,
      lng: 24.756870
    map: map
    title: 'Welcome Hostel'
    label: '2'

  hostelInfo = new google.maps.InfoWindow
    content: """
      <h3>Welcome Hostel</h3>
      <p class="lead">Rotermanni 12</p>
      <p><a href="https://welcomehostel.ee/en/">welcomehostel.ee</a></p>
"""
  hostel.addListener 'click', -> hostelInfo.open map, hostel


  # Vene
  new google.maps.Circle
    strokeColor: '#a43a5a'
    fillOpacity: 0
    strokeWeight: 4
    map: map
    center:
      lat: 59.437209
      lng: 24.747384
    radius: 20

  vene = new google.maps.Marker
    position:
      lat: 59.437209
      lng: 24.747384
    map: map
    title: 'Tallinna Rahvaülikooli Teatrikeskus'
    label: '3'

  veneInfo = new google.maps.InfoWindow
    content: """
      <h3>Tallinna Rahvaülikooli Teatrikeskus</h3>
      <p class="lead">Vene 6, Tallinn</p>
      <p>Workshops venue. Come into the tunnel from Vene street. <br />Ring the bell next to the first door on the right.
      Workshops will take place on the 2nd and 3rd floors.</p>
"""
  vene.addListener 'click', -> veneInfo.open map, vene


  # Rahvaülikool
  new google.maps.Circle
    strokeColor: '#a43a5a'
    fillOpacity: 0
    strokeWeight: 4
    map: map
    center:
      lat: 59.434815
      lng: 24.753262
    radius: 20

  uni = new google.maps.Marker
    position:
      lat: 59.434815
      lng: 24.753262
    map: map
    title: 'Tallinna Rahvaülikool'
    label: '3'

  uniInfo = new google.maps.InfoWindow
    content: """
      <h3>Tallinna Rahvaülikool</h3>
      <p class="lead">Estonia pst 5a, Tallinn, Estonia</p>
      <p>Workshops venue.</p>
"""
  uni.addListener 'click', -> uniInfo.open map, uni

  # Bar
  new google.maps.Circle
    strokeColor: '#a43a5a'
    fillOpacity: 0
    strokeWeight: 4
    map: map
    center:
      lat: 59.440317
      lng: 24.749507
    radius: 20

  bar = new google.maps.Marker
    position:
      lat: 59.440317
      lng: 24.749507
    map: map
    title: 'Nāga Naga bar'
    label: '4'

  barInfo = new google.maps.InfoWindow
    content: """
      <h3>Nāga Naga bar</h3>
      <p class="lead">Uus 25, Tallinn</p>
"""
  bar.addListener 'click', -> barInfo.open map, bar


# Open a modal window with the set modal's content loaded
# url should be in the form workshops/do-it-yourself.html (no leading # or /)
showModal = (url) ->

  # Append the modal's ID to the URL's hash
  window.location.hash = url.replace('.html', '')

  # Forcing the prepending of .href helps mitigate some XSS attacks
  url = "#{getPageUrl()}#{url}.html"
  $('#modal-details').find('.modal-content').html('').load(url)
  $('#modal-details').modal 'show'

# Return the URL of the current page, without the .hash part
getPageUrl = ->
  window.location.href.substr 0, window.location.href.indexOf('#')

equalizeColumns = ->
  # Non-flexbox hack to get Bootstrap columns to be of matching height
  $('.row-equal-height [class^="col-"]').matchHeight()

# Return the index of the currently open modal
# Index is taken from the global schedule (data-index) attribute
getCurrentModalIndex = ->
  currentUrl = window.location.hash.replace('#','') + '.html'
  currentElement = 'a[href="'+currentUrl+'"][data-index]'
  return parseInt($(currentElement).data('index'))

# Given an event index (global schedule), return a URL fragment to it
getModalURLByIndex = (index) ->
  el = $('a[data-index="' + index + '"]')
  if el.length
    return el.attr('href').replace('.html', '')
  else
    return null

# Navigate to the next event (modal)
openNextModal = ->
  url = getModalURLByIndex(getCurrentModalIndex() + 1)
  if url
    showModal(url)

# Navigate to the previous event (modal)
openPreviousModal = ->
  url = getModalURLByIndex(getCurrentModalIndex() - 1)
  if url
    showModal(url)

# Next / previous modal window navigation on arrow key press
$(document).keydown (e) ->
  switch e.key
    when 'ArrowLeft' then openPreviousModal()
    when 'ArrowRight' then openNextModal()
    else return

$ ->

  # Implement lazy loading of images
  new Blazy
    offset: 800

  # Smooth out scrolling effect when clicking on a hash link
  $('a[href^="#"]').smoothScroll
    offset: -60
    speed: 800

  # Load the contents of links into a modal window
  # The links must have a [data-]href attribute and be marked
  # as data-toggle="modal"
  $('[data-toggle="modal"]:not(tr)').on 'click', (e) ->
    e.preventDefault()
    url = $(this).data('href') ? $(this).attr('href')

    # Fix bug for language'd pages where the URL contains "double" language
    # Example: https://improfestival.ee/en#/en/workshops
    url = url.replace '/en/', ''

    # Append the modal's ID to the URL's hash
    window.location.hash = url.replace('.html', '')

    $('#modal-details').find('.modal-content').html('').load url

  equalizeColumns()

  # Hover effect for the schedule table:
  # Change the "featured" image source depending on
  # which table row is hovered on
  $('.table-tickets tr').hover ->
    image = $(this).data 'image'
    url = $(this).find('a').attr 'href'

    row = $(this).closest('.row').find('.col-day-info')

    row.find('img').attr 'src', image
    row.find('a').attr 'href', url

  # When a modal window is closed, remove the modal's hash from the URL
  $('#modal-details').on 'hidden.bs.modal', ->
    history.replaceState {}, document.title, getPageUrl()

  # When the browser's (or phone's) "Back" button is pressed
  # make sure the possibly-open modal window will be closed.
  # This enables navigation where the user can open the modal, then
  # use the phone's Back button to close it
  $(window).on 'popstate', ->
    # Popstate is also activated when appending the hash? so we'll only consider
    # a 'Back' event when the hash is currently empty
    $('#modal-details').modal 'hide' unless window.location.hash

  # If the user navigated to the page and the URL contains a modal's ID, open that modal
  # This allows linking directly to some specific modals
  if window.location.hash
    showModal window.location.hash.replace('#','')
