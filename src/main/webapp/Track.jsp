<%-- 
    Document   : Track
    Created on : Dec 31, 2017, 12:35:57 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Geolocation</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
        <%
        String lat=request.getParameter("latt");
        String lng=request.getParameter("logt");
        System.out.print("lat : "+lat+" logt : "+lng);
        
        if(request.getParameter("e_id")!=null)
        try
            {
                st=cn.createStatement();
                String sql="select logt,latt from locations_info where emp_id="+request.getParameter("e_id");
                //SELECT one FROM table WHERE datetimefield <= '2014-12-10 09:45:00'ORDER BY datetimefield DESC LIMIT 1;
                ResultSet rs = stmt.executeQuery(sql);
                
                if(rs.next())
                {
                  lng=Double.toString(rs.getDouble("logt"));
                  lat=Double.toString(rs.getDouble("latt"));
                }
                
            }catch(Exception e)
            {
            System.out.print("error :"+e);
                %><script language="javascript">alert("Error reading record"); </script><%
            }   
            
        %>

    <div id="map"></div>
    <script>
      // Note: This example requires that you consent to location sharing when
      // prompted by your browser. If you see the error "The Geolocation service
      // failed.", it means you probably did not give permission for the browser to
      // locate you.
      var map, infoWindow;
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: <%=lat%>, lng: <%=lng%>},
          zoom: 6
        });
        infoWindow = new google.maps.InfoWindow;
        var pos = {
              lat: <%=lat%>,
              lng: <%=lng%>
            };
            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(map);
            
        // Try HTML5 geolocation.
        /*if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };

            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.');
            infoWindow.open(map);
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }*/
        
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAAiQJ-uc3vAYORjXOUKwJbNSd4KuqOLyk&callback=initMap">
    </script>
  </body>
</html>
