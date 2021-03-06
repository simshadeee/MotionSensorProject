# MotionSensorProject

An explanation and demo of this project can be found at:
https://www.youtube.com/watch?v=CdgLAh9fcio

This is an IOT project with instructions, set up files, and all the code you need to set up a Mosquitto Broker, a Particle Photon, and a Java Web Application

The Mosquitto and Firmware Repositories have instructions attached.

The remaining repository titled the MotionSensorProject is a java web application. For a java project like this I recommend
using IntelliJ IDEA.

IntelliJ Ultimate may be downloaded from here. See the guide below for a quick start guide to running your first Java serverlet:
   https://www.jetbrains.com/idea/

Quick note that I ran the server using TemEE 9.0.30


Below is an installation and quickstart guide to getting your first IntelliJ Project and Server running:

Part 1. Installation of Open JDK

Visit https://adoptopenjdk.net and choose your appropriate installer to install Open JDK 12 and Open J9. Do not choose the defaults, rather be sure to choose Open JDK12 and Open J9.

Installer instructions: https://adoptopenjdk.net/installation.html#installers

From the command line, javac -version and java -version should both report the version
number as 12.

Part 2. Installation of IntelliJ IDEA Ultimate
To use your student credentials with JetBrains for the free version of IntelliJ for educational use: https://www.jetbrains.com/student/.

Otherwise IntelliJ Ultimate may be downloaded from here: https://www.jetbrains.com/idea/

Download and install IntelliJ IDEA Ultimate.

Write a Java program that displays “Hello World”.

Part 3. Installation of TomEE+
Visit http://tomee.apache.org/download-ng.html and download the most recent version of TomEE Plus (Note: “Plus”, not “Plume”.)

Copy the TomEE directory to an appropriate directory on your file system. The directory path should contain no spaces. Do not change the name of the TomEE Plus directory.
1. Open IntelliJ and create a new project.
2. Under Java/ Java EE /select Web Application
3. Select Next and name your project TestWebApp
4. Right click src and create a new servlet
5. Give it the name TestServlet in the package your.test.serverlet
6. Select OK
7. In the web.xml file, after the servlet element, create a servlet mapping element as
shown here:
<servlet-mapping> <servlet-name>TestServlet</servlet-name> <url-pattern>/*</url-pattern>
</servlet-mapping>

8. Open the TestServlet in the src directory. Within the doGet method, add this line of code:
response.getWriter().append("Hello from TestServlet ");
9. Select Run/Edit Configurations/+/TomEE Server/Local
10. Name the server MyTomEE
11. Select Configure
12. In TomEE text box, select the folder on the far right.
13. Select open after browsing to the apache-tomee-plus directory. Select OK.
14. Select Deployment and click Fix in the bottom right and then OK.
15. Select File/Project Structure/Project Settings/Libraries/+/Java
16. Navigate to TomEE plus directory and select lib/apply/OK
17. Select the green Run triangle.
18. A browser runs and you should see Hello from TestServlet.
While testing, leave these alone. You should just work from the defaults provided. You can set the URL with:
Run/Edit Configurations/Deployment/Application Context
The test browser visits the location specified at: Run/Edit Configurations/Server/Open browser/URL

Part 4: Installing and Running Mosquitto

You can install Mosquitto on your MAC using brew. See http://brew.sh and then
use "brew install mosquitto". There are directions on the mosquitto web site for 
Windows users.

When you run mosquitto, it will run with its default configuration. We need to change 
its configuration to allow for WebSocket connections (we want to visit the server from 
Javascript). To change the configuration of Mosquitto, we can modify the configuration 
file found at /usr/local/etc/mosquitto/mosquitto.conf (on a MAC). My configuration file 
contains these lines:

listener 1883
protocol mqtt

listener 9002
protocol websockets


My copy of mosquitto is located at /usr/local/sbin. If I change to that 
directory, I can run mosquitto (picking up the configuration file) with the command 

mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf -v

Once you have Mosquitto running, we want to connect to the server from Javascript running
in a browser. We do not want to write the client side MQTT code ourselves. Even though we have 
easy access to WebSockets, it would be far better to use an existing Javascript  library 
that provides a convenient API to MQTT. The implementation of the API will, of course, 
use Websockets below the scenes.

In our web pages, we will include the Javascript library from Paho. It is called mqttws31.js.
There is a very nice getting started section at the following link. It has a simple example of a 
Javascript client that will run in a web page. It is very useful for us:

	https://eclipse.org/paho/clients/js/

The mqttws31.js Javascript library can be included in your HTML with this script:

        <script src="https://cdnjs.cloudflare.com/ajax/libs/paho-mqtt/1.0.1/mqttws31.js" type="text/javascript"></script>

