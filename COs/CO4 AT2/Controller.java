package com.service;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Controller")
public class Controller extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        String employeeId = request.getParameter("employeeId");
        String employeeName = request.getParameter("employeeName");
        String department = request.getParameter("department");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String priority = request.getParameter("priority");

        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Service Request Submitted</title>");

        out.println("<style>");
        out.println("body { font-family: Arial; background-color: #f2f2f2; }");
        out.println(".box { width: 500px; margin: 50px auto; background: white; padding: 25px; }");
        out.println("h2 { text-align: center; color: green; }");
        out.println("p { font-size: 16px; }");
        out.println("</style>");

        out.println("</head>");

        out.println("<body>");

        out.println("<div class='box'>");

        out.println("<h2>Service Request Submitted Successfully</h2>");

        out.println("<p><b>Employee ID:</b> " + employeeId + "</p>");
        out.println("<p><b>Employee Name:</b> " + employeeName + "</p>");
        out.println("<p><b>Department:</b> " + department + "</p>");
        out.println("<p><b>Problem Category:</b> " + category + "</p>");
        out.println("<p><b>Problem Description:</b> " + description + "</p>");
        out.println("<p><b>Priority:</b> " + priority + "</p>");

        out.println("</div>");

        out.println("</body>");
        out.println("</html>");
    }
}