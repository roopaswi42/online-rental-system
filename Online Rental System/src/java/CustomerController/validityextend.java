/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CustomerController;

import Controller.ClientLogin;
import Database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "validityextend", urlPatterns = {"/validityextend"})
public class validityextend extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            
            String Aname = request.getParameter("name");
            String mail=request.getParameter("mailid");
            String username=request.getParameter("uname");
            String validity=request.getParameter("Extend");
            int hid=0;
            PreparedStatement ps1=con.prepareStatement("select id from addhouse where hname=?");
            ps1.setString(1,Aname);
            ResultSet rs=ps1.executeQuery();
            while(rs.next())
            {
                hid=rs.getInt(1);
            }
            PreparedStatement ps = con.prepareStatement("insert into validityextension(assestname,mailid,username,extend,id) values(?,?,?,?,?)");
            
            ps.setString(1,Aname);
            ps.setString(2,mail);
            ps.setString(3,username);
            ps.setString(4,validity);
            ps.setInt(5,hid);
            int i = ps.executeUpdate();

            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Request send suuccessfully');");
                pw.println("window.location.href = \"validityExtension.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Error...!!!!Try Again Later..');");
                pw.println("window.location.href = \"validityExtension.jsp\";");
                pw.println("</script>");
            }
        } catch (Exception ex) {
            Logger.getLogger(ClientLogin.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
