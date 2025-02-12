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
    PreparedStatement ps=con.prepareStatement("select * from validityextension");
    ResultSet rs=ps.executeQuery();
    String mail="",username="",extend="";
    int id=0;
    String assetname="";
    while(rs.next()){
        assetname=rs.getString(1);
        mail=rs.getString(2);
        username=rs.getString(3);
        extend=rs.getString(4);
        id=rs.getInt(5);
    }
    


    final String user1="ravillahomesinvoice@gmail.com";//change accordingly  
    final String password="RavillaHomes@23";//change accordingly  
    final String msg="This mail is to inform that your request for extention of time period for "+extend+" for asset "+assetname+" is not approved by the owner"; 
    final String to=mail;//change accordingly  
    Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "587");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");
          props.put("mail.smtp.starttls.enable",true);
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "587");   

          Session ses = Session.getInstance(props,    
           new javax.mail.Authenticator() {    
           @Override
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(user1,password);  
           }    
          });     
          try {    
           MimeMessage message = new MimeMessage(ses);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject("Disapprove Validity Extension");    
           message.setContent(msg,"text/html");
           Transport.send(message);    
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);}  

          PreparedStatement ps4 = con.prepareStatement("delete from validityextension where id=?");
          ps4.setInt(1,id);
          int i=ps4.executeUpdate();
            if (i > 0) {%>
            <p onload="call()"></p>
           <% 
               
              response.sendRedirect("approveextension.jsp");
              }
            else {
           
           %>
               <p onload="call1()"></p>
            <%
                response.sendRedirect("approveextension.jsp");
                }
 %>