package com.university.xpathdemo;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/xpath")
public class XPathServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {

            // Load XML file from web application
            InputStream xmlFile =
                    getServletContext()
                    .getResourceAsStream("/data/courses.xml");

            if (xmlFile == null) {
                out.println("<h2>Error: courses.xml not found!</h2>");
                return;
            }

            // Create XML parser
            DocumentBuilderFactory factory =
                    DocumentBuilderFactory.newInstance();

            DocumentBuilder builder =
                    factory.newDocumentBuilder();

            Document document =
                    builder.parse(xmlFile);

            // Create XPath object
            XPath xpath =
                    XPathFactory.newInstance().newXPath();

            // XPath expressions for Question 2
            String[] expressions = {

                "/courses/course",

                "/courses/course/name",

                "/courses/course[students > 50]",

                "/courses/course[credits = 4]",

                "/courses/course[type = 'Theory']",

                "/courses/course[type = 'Theory' and students > 50]/name",

                "/courses/course[credits >= 4]/faculty",

                "/courses/course[@id = 'C104']",

                "/courses/course[1]",

                "/courses/course[last()]"
            };

            // Question descriptions
            String[] questions = {

                "a. All course records",

                "b. Names of all courses",

                "c. Courses having more than 50 students",

                "d. Courses carrying 4 credits",

                "e. Courses whose type is Theory",

                "f. Names of Theory courses having more than 50 students",

                "g. Faculty members handling courses with at least 4 credits",

                "h. The course whose id is C104",

                "i. The first course",

                "j. The last course"
            };

            // HTML output
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");

            out.println("<title>XPath Course Analysis</title>");

            out.println("<style>");

            out.println("body {");
            out.println("font-family: Arial, sans-serif;");
            out.println("margin: 40px;");
            out.println("background-color: #f5f5f5;");
            out.println("}");

            out.println("h1 {");
            out.println("text-align: center;");
            out.println("}");

            out.println(".question {");
            out.println("background: white;");
            out.println("padding: 20px;");
            out.println("margin: 20px 0;");
            out.println("border-radius: 8px;");
            out.println("}");

            out.println(".xpath {");
            out.println("background: #eeeeee;");
            out.println("padding: 10px;");
            out.println("font-family: monospace;");
            out.println("}");

            out.println("li {");
            out.println("margin: 8px;");
            out.println("}");

            out.println("</style>");

            out.println("</head>");

            out.println("<body>");

            out.println("<h1>University Course XPath Analysis</h1>");

            // Process each XPath expression
            for (int i = 0; i < expressions.length; i++) {

                out.println("<div class='question'>");

                out.println("<h2>" + questions[i] + "</h2>");

                out.println("<div class='xpath'>");
                out.println("XPath: " + expressions[i]);
                out.println("</div>");

                out.println("<h3>Result:</h3>");

                NodeList nodes =
                        (NodeList) xpath.evaluate(
                                expressions[i],
                                document,
                                XPathConstants.NODESET
                        );

                out.println("<ol>");

                for (int j = 0; j < nodes.getLength(); j++) {

                    Node node = nodes.item(j);

                    // If result is a complete course
                    if (node.getNodeName().equals("course")) {

                        String id =
                                node.getAttributes()
                                    .getNamedItem("id")
                                    .getNodeValue();

                        String name =
                                node.getChildNodes()
                                    .item(1)
                                    .getTextContent();

                        out.println("<li>");
                        out.println(id + " - " + name);
                        out.println("</li>");

                    } else {

                        out.println("<li>");
                        out.println(node.getTextContent().trim());
                        out.println("</li>");
                    }
                }

                out.println("</ol>");

                out.println("</div>");
            }

            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {

            out.println("<h2>Error occurred</h2>");
            out.println("<pre>");

            e.printStackTrace(out);

            out.println("</pre>");
        }
    }
}