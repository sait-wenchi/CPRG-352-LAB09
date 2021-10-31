/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import models.Role;
import models.User;
import services.RoleService;
import services.UserService;

/**
 *
 * @author wenchi
 */
public class UserServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Get: url getrequest, action=edit getrequest,action=delete getrequest , action=cancel getrequest
        UserService us = new UserService();
        RoleService rs = new RoleService();
        HttpSession session = request.getSession();
        try {
            // Read the action
            String operation = request.getParameter("action");
            if( operation != null && operation.equals("edit"))
            {
                // Action: select a user to edit
                System.out.println("action:edit");
                String email = request.getParameter("email");
                String email_r = email.replaceAll(" ","+");
                User edit_user = us.get(email_r);
                request.setAttribute("edit_user",edit_user);
                request.setAttribute("edit_enable","true");
            }
            else if( operation != null && operation.equals("delete"))
            {
                // Action: delete a user
                System.out.println("action: delete");
                String email = request.getParameter("email");
                String email_r = email.replaceAll(" ","+");
                us.delete(email_r);
            }
            else if( operation != null && operation.equals("cancel"))
            {
                // Action: cancel edit user mode
                System.out.println("action: cancel");
            }
            // Get all users information from database
            List<User> users = us.getAll();
            List<Role> roles = rs.getAll();
            request.setAttribute("users", users);
            request.setAttribute("roles",roles);
        } catch (Exception ex) {
            request.setAttribute("message", "error");
        }
        
        getServletContext().getRequestDispatcher("/WEB-INF/user.jsp").forward(request,response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Post: action=save postrequest, action=saveedit postrequest
        UserService us = new UserService();
        RoleService rs = new RoleService();
        HttpSession session = request.getSession();
        try 
        {
            // Read the aciton
            String operation = request.getParameter("action");
            if( operation != null && operation.equals("save"))
            {
                // Action: save a new user
                System.out.println("post: save");
                us.insert(request.getParameter("email"),Integer.parseInt(request.getParameter("active")),
                            request.getParameter("firstname"),request.getParameter("lastname"),
                            request.getParameter("password"),Integer.parseInt(request.getParameter("role")));
            }
            else if( operation != null && operation.equals("saveedit"))
            {
                // Action: save a edited user
                System.out.println("post: saveedit");
                System.out.printf("%s %s %s %s %s %s",request.getParameter("email"),request.getParameter("active"),
                        request.getParameter("firstname"),request.getParameter("lastname"),
                        request.getParameter("password"),request.getParameter("role"));
                us.update(request.getParameter("email"),Integer.parseInt(request.getParameter("active")),
                            request.getParameter("firstname"),request.getParameter("lastname"),
                            request.getParameter("password"),Integer.parseInt(request.getParameter("role")));
            }
            // Get all users information from database
            List<User> users = us.getAll();
            List<Role> roles = rs.getAll();
            request.setAttribute("users", users);
            request.setAttribute("roles",roles);
                
        }catch (Exception ex) {
            System.out.println("post went wrong");
            request.setAttribute("message", "error");
        }
        getServletContext().getRequestDispatcher("/WEB-INF/user.jsp").forward(request,response);
  
    }

}
