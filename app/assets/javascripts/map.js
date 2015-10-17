var map;
var markers = [];

function initMap() {
  var paris = {lat: 41.87194, lng: 12.567379999999957};
  var myloc;

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 2,
    center: paris,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

//=====full screen section===========//
  var googleMapWidth = $("#map").css('width');
  var googleMapHeight = $("#map").css('height');

  $('#btn-enter-full-screen').click(function() {
    $("#map").css({
      position: 'fixed',
      top: 0,
      left: 0,
      width: '100%',
      height: '85%',
      backgroundColor: 'white'
    });
    $("#map-canvas").css({
      height: '100%'
    });

  google.maps.event.trigger(map, 'resize');
  $('#btn-enter-full-screen').toggle();
  $('#btn-exit-full-screen').toggle();
    return false;
  });

  $('#btn-exit-full-screen').click(function() {
    $("#map").css({
        position: 'relative',
        top: 0,
        width: googleMapWidth,
        height: googleMapHeight,
        backgroundColor: 'transparent'
    });

    google.maps.event.trigger(map, 'resize');
    map.setCenter(newyork);
    $('#btn-enter-full-screen').toggle();
    $('#btn-exit-full-screen').toggle();
    return false;
  });
//=========================//

  myloc = new google.maps.Marker({
    clickable: false,
    icon: new google.maps.MarkerImage('http://maps.gstatic.com/mapfiles/mobile/mobileimgs2.png',
                                        new google.maps.Size(22,22),
                                        new google.maps.Point(0,18),
                                        new google.maps.Point(11,11)
                                      ),
    shadow: null,
    zIndex: 999,
    map: map
  })

  if (navigator.geolocation) navigator.geolocation.getCurrentPosition(function(pos) {
      var me = new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
      myloc.setPosition(me);
      map.setOptions({zoom : 10, center: me});
  })
}

function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

function setMapNotOnAll(map, elem) {
  for (var i = 0; i < markers.length; i++) {
    if(markers[i].category == elem)
    markers[i].setMap(map);
  }
}

function addMarker(location, id, info, name) {
  var image;
  var marker;

  if(id == 'theatre')
       image = {url: 'https://storage.googleapis.com/geolocalisation/theatre05.png'};
  else if(id == 'club')
    image = {url: 'https://storage.googleapis.com/geolocalisation/club01.png'};
  else if(id == 'museum')
    image = {url: 'https://storage.googleapis.com/geolocalisation/museum.png'}
    marker = new google.maps.Marker({
    position: location,
    icon : image,
    map: map,
    category: id,
  });
  markers.push(marker);
}


function show_by_filter(elem){
  $.ajax({
  type: "GET",
  url: '/interests',
  data : 'category='+elem,
  success: function (data) {
    $.each(data.message,function(index, valeur){      // Renvoyer la valeur a Addmarker
      loc = { lat: valeur.latitude, lng: valeur.longitude };
      info =  valeur.address
      addMarker(loc, elem);
    })
   }
  })
}

function HomePos(position){
  var loc = { lat: position.coords.latitude, lng: position.coords.longitude };
  alert(position.coords.longitude);
  addMarker(loc, 'home');
}

function checkbox(id){
  if (document.getElementById(id).checked == true){
    $('.'+id).show();
    if (id != 'home')
      show_by_filter(id)
    else{
      if (navigator.geolocation)
        navigator.geolocation.getCurrentPosition(HomePos);
    }
  }
  else{
    setMapNotOnAll(null, id);
    $('.'+ id).hide();
  }
}
