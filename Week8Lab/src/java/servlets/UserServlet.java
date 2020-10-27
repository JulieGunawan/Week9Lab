
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         //Initialize Services here
        HttpSession session = request.getSession();
        //List<Users> users = us.getAll(email);
        //List<Users> users = us.getAll(firstname);
        //List<Users> users = us.getAll(lastname);
        //request.setAttribute("users", users);
       
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
