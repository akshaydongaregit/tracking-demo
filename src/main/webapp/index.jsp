<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Track Bus</title>
        <style type="text/css">
            body
            {
                background-image: url('https://www.goodnet.org/photos/620x0/27785_hd.png');
                background-size: cover ;
            }
            a
            {
                text-decoration: none;
            }
          
            .panel-link
            {
              height:60px;
              width:60%;
              background:#f0ad4e;
              color:#FFF;
              margin-left:20%;
              margin-top:2%;
              font:bold 100%/1.5 "Lucida Grande";
              padding:0.4%;
              padding-left:10%;
              border:2px solid rgba(10,10,40,220); 
              box-sizing: border-box;
            }
            .panel-link:hover
            {
              background:#f0ad4e;
              color:#00f;
            }
          
            .title
            {
              height:80px;
              width:80%;
              background:#f0ad4e;
              color:#FFF;
              padding:2%;
              margin-left:10%;
              font:normal 100% "Tahoma";
            }
          .logout-link
          {
            float:right;
          }
        </style>
    </head>
  <body>
    <%@include file="Authenticate.jsp"%>
    <div class="title">
    <h2>Bus Tracking Using Driver Mobile GPS Tracking</h2>
    <a href="Admin_Logout.jsp" class="logout-link"> Logout </a>
    </div>
    <!-- https://www.goodnet.org/photos/620x0/27785_hd.png
          https://i1.wp.com/www.findyourwallpaper.com/wp-content/uploads/2013/10/volvo-bus-HD-wallpaper-For-Desktop.jpeg?resize=1024%2C757&ssl=1
        -->
    
    <a href="View_Position.jsp">
      <div class="panel-link">
        <h3> View Connected </h3>
      </div>
    </a>
    <a href="Register.jsp">
      <div class="panel-link">
        <h3> Register New Employee </h3>
      </div>
    </a>  
    <a href="Tracking.jsp">
      <div class="panel-link">
        <h3> Find Bus </h3>
      </div>
    </a>
       <a href="Schedule.jsp">
      <div class="panel-link">
        <h3> Schedule </h3>
      </div>
    </a>
    <a href="download.jsp">
      <div class="panel-link">
        <h3> Download Application </h3>
      </div>
    </a>

    
  </body>
</html>
