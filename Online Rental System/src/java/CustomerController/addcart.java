/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CustomerController;

import Database.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "addcart", urlPatterns = {"/addcart"})
public class addcart extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    PrintWriter pw = response.getWriter();
    HttpSession csession = request.getSession(true);
    String username = (String) csession.getAttribute("customerusername");
    //int id = Integer.parseInt(csession.getAttribute("customerid").toString());
    String name = (String) csession.getAttribute("customername");
    String sid = request.getParameter("hid");
    int hid = Integer.parseInt(sid);
    try{
        Connection con = DatabaseConnection.initializeDatabase();
        PreparedStatement ps = con.prepareStatement("insert into approve(id,username) values(?,?)");
            ps.setInt(1,hid);
            ps.setString(2,username);
            int i = ps.executeUpdate();

            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Request is send Sucessfully');");
                pw.println("window.location.href = \"SearchHouse.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Error...!!!!Try Again Later..');");
                pw.println("window.location.href = \"SearchHouse.jsp\";");
                pw.println("</script>");
            }

    }    catch (SQLException | ClassNotFoundException ex) {
             Logger.getLogger(addcart.class.getName()).log(Level.SEVERE, null, ex);
         }
        }
    }

