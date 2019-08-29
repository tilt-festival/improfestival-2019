#= require jquery.min
#= require bootstrap.min
#= require jquery-smooth-scroll/jquery.smooth-scroll.min
#= require matchHeight/dist/jquery.matchHeight-min
#= require picturefill/dist/picturefill
#= require fienta

# Create a JS Google Map object and add important location markers to it
window.initMap = ->
  map = new google.maps.Map $('.map')[0],
    center:
      lat: 59.441386
      lng: 24.751333
    zoom: 14

  catherine = new google.maps.Marker
    position:
      lat: 59.437746
      lng: 24.748497
    map: map
    title: 'St. Catherine\'s Church'
    label: '1'

  catherineInfo = new google.maps.InfoWindow
    content: """
      <h3>St. Catherine's Church</h3>
      <p class="lead">Vene 14a, Tallinn</p>
      <p>Performance venue</p>
      <a href="https://www.visitestonia.com/en/st-catherines-church" target="_blank">visitestonia.com/en/st-catherines-church</a></p>
"""
  catherine.addListener 'click', -> catherineInfo.open map, catherine

  # St. Catherine's
  new google.maps.Circle
    strokeColor: '#a43a5a'
    fillOpacity: 0
    strokeWeight: 4
    map: map
    center:
      lat: 59.437746
      lng: 24.748497
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
      <p><a href="https://welcomehostel.ee/en/" target="_blank">welcomehostel.ee</a></p>
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
      <p><a href="https://kultuur.ee" target="_blank">kultuur.ee</a></p>
"""
  vene.addListener 'click', -> veneInfo.open map, vene


  # Hopner
  new google.maps.Circle
    strokeColor: '#a43a5a'
    fillOpacity: 0
    strokeWeight: 4
    map: map
    center:
      lat: 59.437359
      lng: 24.746015
    radius: 20

  hopner = new google.maps.Marker
    position:
      lat: 59.437359
      lng: 24.746015
    map: map
    title: 'Hopner\'s house'
    label: '3'

  hopnerInfo = new google.maps.InfoWindow
    content: """
      <h3>Hopner's house</h3>
      <p class="lead">Raekoja plats 18, Tallinn, Estonia</p>
      <p>Workshops venue</p>
      <p><a href="http://www.hopnerimaja.eu/Maja" target="_blank">hopnerimaja.eu</a></p>
"""
  hopner.addListener 'click', -> hopnerInfo.open map, hopner

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
      <p>Food venue after the shows</p>
      <p><a href="https://naganaga.ee/" target="_blank">naganaga.ee</a></p>
"""
  bar.addListener 'click', -> barInfo.open map, bar

  # Terrace
  new google.maps.Circle
    strokeColor: '#a43a5a'
    fillOpacity: 0
    strokeWeight: 4
    map: map
    center:
      lat: 59.443653
      lng: 24.757344
    radius: 20

  terrace = new google.maps.Marker
    position:
      lat: 59.443653
      lng: 24.757344
    map: map
    title: 'Suveterrass'
    label: '4'

  terraceInfo = new google.maps.InfoWindow
    content: """
      <h3>Suveterrass</h3>
      <p class="lead">Kai 5, Tallinn</p>
      <p>Food venue after the shows, on the last night only</p>
      <p><a href="https://suveterrass.getaway.ee">suveterrass.getaway.ee</a></p>
"""
  terrace.addListener 'click', -> terraceInfo.open map, terrace

# Open a modal window with the set modal's content loaded
# url should be in the form workshops/do-it-yourself.html (no leading # or /)
showModal = (url) ->
  
  url = url.replace(window.location.pathname, '')

  # Append the modal's ID to the URL's hash
  window.location.hash = url.replace('.html', '')

  # Forcing the prepending of .href helps mitigate some XSS attacks
  url = "#{getPageUrl()}#{url}.html"

  $('#modal-details').find('.modal-content').html('').load(url, updateModalTicketLink)
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
  
  currentUrl = window.location.pathname + window.location.hash.replace('#','') + '.html'

  # Replace double slashes at the beginning of the URI (pathname + hash)
  currentUrl = currentUrl.replace(/^\/\//, '/')
  
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


updateModalTicketLink = ->
  button = $(this).find('.btn-buy')[0]
  remainingTickets = window.tickets[button.href]
  console.log window.tickets
  if remainingTickets is 0 or remainingTickets is false
    $(button).addClass 'hidden'

updateTicketCounts = ->
  
  for url, count of window.tickets
    # Show "Sold out" message if tickets are not available for the event
    # Shown on main schedule view
    if count is 0 or count is false
      $('.col-schedule').find('a[data-ticket-url="' + url + '"]').find('h3.hidden').removeClass('hidden')

$ ->

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

  # Wait for available ticket counts to load, then update
  # This is a "dumb" way of doing it, assuming counts load in 3s.
  # Better version would be async/event-based readyness check
  setTimeout updateTicketCounts, 3000
