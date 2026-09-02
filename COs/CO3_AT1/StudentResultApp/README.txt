StudentResultApp - Tomcat 11

Files:
- src/main/webapp/index.html
- src/main/webapp/WEB-INF/web.xml
- src/main/java/StudentResultServlet.java
- pom.xml

Run in Eclipse:
1. Use JDK 17 or later.
2. Add Apache Tomcat 11 to the Servers view.
3. Import this folder as an Existing Maven Project, or copy the files into your existing StudentResultApp project.
4. Add StudentResultApp to Tomcat.
5. Start Tomcat.
6. Open http://localhost:8080/StudentResultApp/
7. Fill the form and click Calculate Result.

Do not open /result directly in the browser. /result is a POST endpoint.
