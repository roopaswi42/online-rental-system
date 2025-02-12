<%
    String username = (String) session.getAttribute("customerusername");
    int id = Integer.parseInt(session.getAttribute("customerid").toString());
    String name = (String) session.getAttribute("customername");
    String Mob=(String) session.getAttribute("mob");
%>  
<%@page import="CustomerController.addcart"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vacate House</title>
    </head>
    <body>
          <%
            PrintWriter pw = response.getWriter();
            String sid = request.getParameter("id");
            int hid = Integer.parseInt(sid);
            try{
        Connection con = DatabaseConnection.initializeDatabase();
        PreparedStatement ps = con.prepareStatement("insert into vacate(id,username) values(?,?)");
            ps.setInt(1,hid);
            ps.setString(2,username);
            int i = ps.executeUpdate();

            if (i > 0) {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Request send suuccessfully');");
                pw.println("window.location.href = \"CustHouseDetails.jsp\";");
                pw.println("</script>");
            } else {
                pw.println("<script type=\"text/javascript\">");
                pw.println("alert('Error...!!!!Try Again Later..');");
                pw.println("window.location.href = \"CustHouseDetails.jsp\";");
                pw.println("</script>");
            }
    }    catch (Exception e) {
             
         }
            %>
    </body>
