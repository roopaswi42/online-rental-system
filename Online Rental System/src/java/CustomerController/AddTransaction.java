/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CustomerController;

import Database.DatabaseConnection;
import Entity.House;
import Entity.Transaction;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


public class AddTransaction extends HttpServlet {
     Transaction transaction;
    InputStream inputStream = null;

    public AddTransaction() {
        this.transaction = new Transaction();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter pw = response.getWriter();
        transaction.settype(request.getParameter("type"));
        transaction.setdate(request.getParameter("date"));
        transaction.setamount(request.getParameter("amount"));
        transaction.setname(request.getParameter("mob"));
        transaction.settime(request.getParameter("time"));
        transaction.setmode(request.getParameter("rent"));
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement ps = con.prepareStatement("insert into approvetransaction(assetname,transactiontype,amount,date,mobile,mode) values(?,?,?,?,?,?)");
            
            ps.setString(1,transaction.gettime());
            ps.setString(2,transaction.gettype());
            ps.setString(3,transaction.getamount());
            ps.setString(4,transaction.getdate());
            
            ps.setString(5,transaction.getname());
            ps.setString(6,transaction.getmode());
            int i = ps.executeUpdate();

            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Transaction  Sucessfully');");
                pw.println("window.location.href = \"AddTransaction.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Error...!!!!Try Again Later..');");
                pw.println("window.location.href = \"AddTransaction.jsp\";");
                pw.println("</script>");
            }

    }    catch (SQLException | ClassNotFoundException ex) {
             Logger.getLogger(AddTransaction.class.getName()).log(Level.SEVERE, null, ex);
         }
   
    }
}
