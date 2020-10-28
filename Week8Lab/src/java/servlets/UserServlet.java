
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import services.RoleServices;
import services.UserService;

public class UserServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserService users = new UserService();
        RoleServices roles = new RoleServices();
        
        try {
            List<User> user = users.getAll();
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.setAttribute("users", users);
        
    getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

        
    

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
       //Initialize Services here
       
        String action = request.getParameter("action");
        String email = request.getParameter("email");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String password = request.getParameter("password");
        String active = request.getParameter("active");
        String role = request.getParameter("role");
        
        switch (action) {
            case "add":
                //add user
                break;
            case "update":
                //update user
                break;
            case "delete":
                //delete user
                break;
                   
        }
        
    }

    

}
