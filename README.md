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
