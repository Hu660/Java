package servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ls")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = request.getParameter("user");
        RequestDispatcher rd = null;
        if (user != null && user.equals("admin")) {
            request.getSession().setAttribute("login", "true");
            rd = request.getRequestDispatcher("/admin.html");
            rd.forward(request, response);
        } else if (user != null && user.equals("common")) {
            request.getSession().setAttribute("login", "true");
            rd = request.getRequestDispatcher("/common.html");
            rd.forward(request, response);
        } else {
            response.sendRedirect("login.html");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}