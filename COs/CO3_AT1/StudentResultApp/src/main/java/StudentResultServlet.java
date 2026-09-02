import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class StudentResultServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
                          throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String regno = request.getParameter("regno");

        try {
            int mark1 = Integer.parseInt(request.getParameter("mark1"));
            int mark2 = Integer.parseInt(request.getParameter("mark2"));
            int mark3 = Integer.parseInt(request.getParameter("mark3"));

            if (mark1 < 0 || mark1 > 100 ||
                mark2 < 0 || mark2 > 100 ||
                mark3 < 0 || mark3 > 100) {

                out.println("<h2>Marks must be between 0 and 100.</h2>");
                return;
            }

            int total = mark1 + mark2 + mark3;
            double average = total / 3.0;
            int highest = Math.max(mark1, Math.max(mark2, mark3));

            String status = (mark1 >= 40 && mark2 >= 40 && mark3 >= 40)
                    ? "PASS" : "FAIL";

            out.println("<!DOCTYPE html>");
            out.println("<html><head><title>Student Result</title>");
            out.println("<style>");
            out.println("body{font-family:Arial;background:#f2f2f2;padding:40px;}");
            out.println(".result{width:450px;margin:auto;background:white;padding:25px;border-radius:10px;box-shadow:0 0 10px gray;}");
            out.println("h2{text-align:center;color:#333;}");
            out.println("</style></head><body>");

            out.println("<div class='result'>");
            out.println("<h2>Student Result</h2>");
            out.println("<p><b>Name:</b> " + name + "</p>");
            out.println("<p><b>Register Number:</b> " + regno + "</p>");
            out.println("<p><b>Subject 1:</b> " + mark1 + "</p>");
            out.println("<p><b>Subject 2:</b> " + mark2 + "</p>");
            out.println("<p><b>Subject 3:</b> " + mark3 + "</p>");
            out.println("<hr>");
            out.println("<p><b>Total:</b> " + total + "</p>");
            out.println("<p><b>Average:</b> " + String.format("%.2f", average) + "</p>");
            out.println("<p><b>Highest Mark:</b> " + highest + "</p>");
            out.println("<p><b>Status:</b> " + status + "</p>");
            out.println("</div></body></html>");

        } catch (NumberFormatException e) {
            out.println("<h2>Please enter valid marks.</h2>");
        }
    }
}
