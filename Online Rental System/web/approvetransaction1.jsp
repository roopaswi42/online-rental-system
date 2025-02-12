<%@page import="java.sql.PreparedStatement"%>
<%
    String user = (String) session.getAttribute("username");
    String mob = (String) session.getAttribute("mobile");
%>  
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Database.DatabaseConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.activation.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    Connection con = DatabaseConnection.initializeDatabase();
    Statement st = con.createStatement();
    PreparedStatement ps=con.prepareStatement("select * from approvetransaction");
    String assetname="",transactiontype="",amount="",date="",mobile="",mode="";
    ResultSet rs=ps.executeQuery();
    while(rs.next())
    {
        assetname=rs.getString(1);
        transactiontype=rs.getString(2);
        amount=rs.getString(3);
        date=rs.getString(4);
        mobile=rs.getString(5);
        mode=rs.getString(6);
    }
    PreparedStatement ps1 = con.prepareStatement("insert into transaction(transaction_type,transaction_date,amount,mobile,mode,AssetName) values(?,?,?,?,?,?)");
    ps1.setString(1,transactiontype);
    ps1.setString(2,date);
    ps1.setString(3,amount);
    ps1.setString(4,mobile);
    ps1.setString(5,mode);
    ps1.setString(6,assetname);
    int i = ps1.executeUpdate();
    
    
    PreparedStatement ps2=con.prepareStatement("delete from approvetransaction where amount=?");
    ps2.setString(1,amount);
    int j = ps2.executeUpdate();
    if (i > 0) {%>
            <p onload="call()"></p>
           <% 
               
              response.sendRedirect("ApproveTransaction.jsp");
              }
            else {
           
           %>
               <p onload="call1()"></p>
            <%
                response.sendRedirect("ApproveTransaction.jsp");
                }
            %>
%>