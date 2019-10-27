/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Compaq
 */
@WebServlet(urlPatterns = {"/Logout"})
public class Logout extends HttpServlet 
{
    public void init()
    {
        
    }
    
    public void service(HttpServletRequest req, HttpServletResponse res)
    {
        try
        {
            PrintWriter out = res.getWriter();
            HttpSession session = req.getSession();
            session.setMaxInactiveInterval(0);
            
            res.sendRedirect("Greatdeal.jsp");
        }
        catch(Exception Ex)
        {
            System.out.println("Problem in Logout " + Ex);
        }
       
    }
    
    public void destroy()
    {
        
    }
}