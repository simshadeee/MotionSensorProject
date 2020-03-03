<!DOCTYPE html>
<html>
<head>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.js" type="text/javascript"></script>
  <script type="text/javascript">
    // Create a client instance
    client = new Paho.MQTT.Client("localhost", Number(9002), "motionSensorSubscriber1");

    // set callback handlers
    client.onConnectionLost = onConnectionLost;
    client.onMessageArrived = onMessageArrived;
    topic = 'motion';
    status = "OFF";

    var options = {
      timeout: 3,
      // called when the client connects
      onSuccess: function () {
        console.log("mqtt connected");
        client.subscribe(topic, {qos: 1});
      },
      // called when the client fails to connect
      onFailure: function (message) {
        console.log("Connection failed: " + message.errorMessage);
      }
    };

    // connect the client
    client.connect(options);

    function onConnectionLost(responseObject) {
      if (responseObject.errorCode !== 0) {
        console.log("onConnectionLost:"+responseObject.errorMessage);
      }
    }
    var updates = [];
    // called when a message arrives
    function onMessageArrived(message) {
      console.log("onMessageArrived:"+message.payloadString);
      var messageArrived = message.payloadString;
      if (!messageArrived.localeCompare("MOTION")) {
        // get a new date (locale machine date time)
        var date = new Date();
        // get the date as a string
        var n = date.toDateString();
        // get the time as a string
        var time = date.toLocaleTimeString();
        var newTime = n + ' ' + time;
        updates.push(newTime);
        updateEvents();
        console.log(updates.toString());
      }
    }

    function updateEvents(){

      var contents = document.getElementById("contents");
      contents.innerHTML = "";

      for (var I = updates.length-1; I >= 0; I--) {
        var displayTime = updates[I];
        var listItem = document.createElement("li");
        listItem.appendChild(document.createTextNode(displayTime)); //Updates to the XML
        contents.appendChild(listItem);
      }
    }
    toggleStatus = "Turn System On";

    function toggle(){
      if (!toggleStatus.localeCompare("Turn System On")) {
        toggleStatus = "Turn System Off";
        status = "ON"
      } else {
        toggleStatus = "Turn System On";
        status = "OFF"
      }
      console.log(toggleStatus);
      document.getElementById("toggle").innerHTML = toggleStatus;

      message = new Paho.MQTT.Message(status);
      message.destinationName = topic;
      message.qos = 1;
      client.send(message);
    }
  </script>
  <meta charset="utf-8">

  <!--====== Title ======-->
  <title>Home Security System</title>

  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!--====== Favicon Icon ======-->
  <link rel="shortcut icon" href="assets/images/favicon.png" type="image/png">

  <!--====== Slick CSS ======-->
  <link rel="stylesheet" href="assets/css/slick.css">

  <!--====== Font Awesome CSS ======-->
  <link rel="stylesheet" href="assets/css/font-awesome.min.css">

  <!--====== Line Icons CSS ======-->
  <link rel="stylesheet" href="assets/css/LineIcons.css">

  <!--====== Animate CSS ======-->
  <link rel="stylesheet" href="assets/css/animate.css">

  <!--====== Magnific Popup CSS ======-->
  <link rel="stylesheet" href="assets/css/magnific-popup.css">

  <!--====== Bootstrap CSS ======-->
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">

  <!--====== Default CSS ======-->
  <link rel="stylesheet" href="assets/css/default.css">

  <!--====== Style CSS ======-->
  <link rel="stylesheet" href="assets/css/style.css">

</head>
<body>


  <!--====== PRELOADER PART START ======-->

  <div class="preloader">
    <div class="loader">
      <div class="ytp-spinner">
        <div class="ytp-spinner-container">
          <div class="ytp-spinner-rotator">
            <div class="ytp-spinner-left">
              <div class="ytp-spinner-circle"></div>
            </div>
            <div class="ytp-spinner-right">
              <div class="ytp-spinner-circle"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!--====== PRELOADER PART ENDS ======-->

  <!--====== HEADER PART START ======-->

  <header class="header-area">
    <div id="home" class="header-hero bg_cover d-lg-flex align-items-center" style="background-image: url(assets/images/header-hero.jpg)">
      <div class="container">
        <div class="row">
          <div class="col-lg-7">
            <div class="header-hero-content">
              <h1 class="hero-title wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.2s"><b>Your</b> Home<span> Safely</span> in <b>Your</b> Hands.</h1>
              <p class="text wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.5s">This page is a place for you to get control of your security system: Activate and Deactive your system and view motion events all in one, accessible place.</p>
              <div class="header-singup wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.8s">
                <button class="main-btn" id='toggle' onclick='toggle()'>Turn System On</button>
              </div>
            </div> <!-- header hero content -->
          </div>
        </div> <!-- row -->
      </div> <!-- container -->
      <div class="header-hero-image d-flex align-items-center wow fadeInRightBig" data-wow-duration="1s" data-wow-delay="1.1s">
        <div class="image">
          <img src="assets/images/hero-image.png" alt="Hero Image">
        </div>
      </div> <!-- header hero image -->
    </div> <!-- header hero -->
  </header>

  <!--====== HEADER PART ENDS ======-->

  <!--====== ABOUT PART START ======-->

  <section id="about" class="about-area pt-20">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-9">
          <div class="about-title text-center wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.3s">
            <h6 class="welcome">YOUR UPDATES NOW</h6>
            <h3 class="title">Here Is When Motion Was Last Detected In Your Home</h3>
          </div>
        </div>
      </div> <!-- row -->
      <div class="row justify-content-center">
        <div class="col-lg-10">
          <div class="about-content pt-45">
            <p class="text wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.4s">
            <ul id="contents" style='text-align: center;'>
              <li>
                Time of Breach
              </li>
            </ul>
            </p>
          </div> <!-- about content -->
        </div>
      </div> <!-- row -->
    </div> <!-- container -->
  </section>

  <!--====== ABOUT PART ENDS ======-->

  <!--====== FOOTER PART START ======-->

  <footer id="footer" class="footer-area bg_cover">
    <div class="container">
      <div class="footer-widget pt-30 pb-70">

      </div> <!-- footer widget -->
      <div class="footer-copyright text-center">
        <p class="text">Project Created By: Simrin Guglani</p>
      </div>
    </div> <!-- container -->
  </footer>

  <!--====== FOOTER PART ENDS ======-->

  <!--====== BACK TOP TOP PART START ======-->

  <a href="#" class="back-to-top"><i class="lni-chevron-up"></i></a>

  <!--====== BACK TOP TOP PART ENDS ======-->




  <!--====== Jquery js ======-->
  <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>
  <script src="assets/js/vendor/modernizr-3.7.1.min.js"></script>

  <!--====== Bootstrap js ======-->
  <script src="assets/js/popper.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>

  <!--====== Slick js ======-->
  <script src="assets/js/slick.min.js"></script>

  <!--====== Isotope js ======-->
  <script src="assets/js/imagesloaded.pkgd.min.js"></script>
  <script src="assets/js/isotope.pkgd.min.js"></script>

  <!--====== Counter Up js ======-->
  <script src="assets/js/waypoints.min.js"></script>
  <script src="assets/js/jquery.counterup.min.js"></script>

  <!--====== Circles js ======-->
  <script src="assets/js/circles.min.js"></script>

  <!--====== Appear js ======-->
  <script src="assets/js/jquery.appear.min.js"></script>

  <!--====== WOW js ======-->
  <script src="assets/js/wow.min.js"></script>

  <!--====== Headroom js ======-->
  <script src="assets/js/headroom.min.js"></script>

  <!--====== Jquery Nav js ======-->
  <script src="assets/js/jquery.nav.js"></script>

  <!--====== Scroll It js ======-->
  <script src="assets/js/scrollIt.min.js"></script>

  <!--====== Magnific Popup js ======-->
  <script src="assets/js/jquery.magnific-popup.min.js"></script>

  <!--====== Main js ======-->
  <script src="assets/js/main.js"></script>

</body>

</html>
