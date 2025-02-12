<%@page import="java.sql.PreparedStatement"%>
<%
    String username = (String) session.getAttribute("customerusername");
    int id = Integer.parseInt(session.getAttribute("customerid").toString());
    String name = (String) session.getAttribute("customername");
    String Mob=(String) session.getAttribute("mob");

%>  

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Delete Transaction</title>
    </head>
    <% 
    Connection con = DatabaseConnection.initializeDatabase();
    int id1=Integer.parseInt(request.getParameter("id"));
    PreparedStatement ps=con.prepareStatement("delete from transaction where id=?");
    ps.setInt(1,id1);
    int i=ps.executeUpdate();
    
     if (i > 0) {%>
            <p onload="call()"></p>
           <% 
               
              response.sendRedirect("ViewTransaction.jsp");
              }
            else {
           
           %>
               <p onload="call1()"></p>
            <%
                response.sendRedirect("ViewTransaction.jsp");
                }
            %>