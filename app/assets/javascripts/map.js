var map;
var markers = [];
var iconBase = 'https://storage.googleapis.com/geolocalisation/';
var icons = {
  Theatre: {
    icon: iconBase + 'theatre05.png'
  },
  Club: {
    icon: iconBase + 'club01.png'
  },
  Museum: {
    icon: iconBase + 'museum.png'
  },
  Cafe: {
    icon: iconBase + 'cafe.png'
  },
  Restaurant: {
    icon: iconBase + 'restaurant.png'
  },
  Bar: {
    icon: iconBase + 'bar.png'
  }
};

function initMap() {
  var paris = {lat: 41.87194, lng: 12.567379999999957};
  var myloc;

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 2,
    center: paris,
    mapTypeControl: false,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });

  myloc = new google.maps.Marker({
    clickable: true,
    icon: new google.maps.MarkerImage('http://maps.gstatic.com/mapfiles/mobile/mobileimgs2.png',
                                        new google.maps.Size(22,22),
                                        new google.maps.Point(0,18),
                                        new google.maps.Point(11,11)
                                      ),
    map: map
  })

  if (navigator.geolocation) navigator.geolocation.getCurrentPosition(function(pos) {
    var me = new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
    myloc.setPosition(me);
    map.setOptions({zoom : 14, center: me});
  });
  show_by_filter('all');
}

function show_by_filter(elem){
  $.ajax({
    type: "GET",
    url: '/interests',
    data : 'category='+elem,
    success: function (data) {
      addMarker(data.message);
    }
  })
}

function setMapOnAll(map) {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(map);
  }
}

function setMapNotOnAll(map, elem) {
  for (i = 0; i < markers.length; i++) {
    if(markers[i].category == elem)
      markers[i].setMap(map);
  }
}

function addMarker(arrInfo) {
  var image;
  var marker;
  var infoBubble = new InfoBubble;

  for (i = 0; i < arrInfo.length ; i++){
    marker = new google.maps.Marker({
      clickable : true,
      position: { lat: arrInfo[i].latitude, lng: arrInfo[i].longitude },
      icon: icons[arrInfo[i].category].icon,
      map: map,
      category: arrInfo[i].category
    });

    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
        if (infoBubble.getMap() != null) {
            infoBubble.close()
            delete infoBubble;
            infoBubble = new InfoBubble();
          }
          infoBubble.open(map, marker);
          infoBubble.addTab("<div class='infowindow'>Info</div>",
            '<div class="infowindow">'+
            '<h1>'+ arrInfo[i].name +'</h1>'+
            '<div id="bodywindow">'+
            '<p> Address:&nbsp' + arrInfo[i].address + '</p>' +
            '<p> Phone number: Ajouter telphone dans Db. arrInfo[i].phone </p>' +
            '<p> website: link xxxx <p>'+
            '</div>'+
            '</div>');
            infoBubble.addTab("<div class='infowindow'>Rating</div>", "<div class='infowindow'>Here Rating</div>");
            infoBubble.addTab("<div class='infowindow'>Facilities</div>","<div class='infowindow'>Facilities: Ratp handicape parking bus ect...</div>");
      }
    })(marker, i));
    markers.push(marker);
  }
}

function checkbox(id){
  if (document.getElementById(id).checked == true){
    $('.'+id).show();
    setMapNotOnAll(map, id);
  }
  else{
    setMapNotOnAll(null, id);
    $('.'+ id).hide();
  }
}
