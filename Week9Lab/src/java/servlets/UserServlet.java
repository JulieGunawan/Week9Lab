package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Role;
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
            List<Role> role = roles.getAll();
            request.setAttribute("user", user);
            request.setAttribute("role", role);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "error");
        }
        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action.equalsIgnoreCase("cancel")) {
            doGet(request, response);
            return;
        }
                
        UserService users = new UserService();
        
        User newUser = null;
        String userEmail = request.getParameter("useremail");

        if (userEmail == null || userEmail.isEmpty()) {
            String email = request.getParameter("email");
            int active = 1;
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String password = request.getParameter("password");
            int role = Integer.parseInt(request.getParameter("role"));

            newUser = new User(email, active, firstName, lastName, password, role);            
        }

        try {
            switch (action) {
                case "add":
                    users.insert(newUser);
                    break;
                case "update":
                    users.update(newUser);
                    break;
                case "delete":
                    users.delete(userEmail);
                    break;
                case "edit":
                    request.setAttribute("editUser", users.get(userEmail));
                    break;
            }
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
        doGet(request, response);
    }

}
