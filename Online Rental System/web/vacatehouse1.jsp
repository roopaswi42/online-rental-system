<%@page import="java.sql.PreparedStatement"%>
<%
    String username = (String) session.getAttribute("AdminUsername");
    int id = Integer.parseInt(session.getAttribute("AdminID").toString());
    String name = (String) session.getAttribute("AdminName");
    String sid = request.getParameter("hid");
    int hid = Integer.parseInt(sid);
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
    PreparedStatement ps=con.prepareStatement("select * from vacate");
    ResultSet rs=ps.executeQuery();
    int id1=0;
    String cuname="";
    while(rs.next()){
      id1=rs.getInt(1);
      cuname=rs.getString(2);  
    }
    
    
     PreparedStatement ps3= con.prepareStatement("select * from userregister where username=?");
    ps3.setString(1,cuname);
    ResultSet rs1 = ps3.executeQuery();
    String email="";
    while(rs1.next()){
         email=rs1.getString(4);
    }
    final String user="ravillahomesinvoice@gmail.com";//change accordingly  
    final String password="RavillaHomes@23";//change accordingly  
    final String msg="This mail is to inform that admin had did not accept your request for vacating house"; 
    final String to=email;//change accordingly  
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
           return new PasswordAuthentication(user,password);  
           }    
          });     
          try {    
           MimeMessage message = new MimeMessage(ses);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject("Vacating House");    
           message.setContent(msg,"text/html");
           Transport.send(message);    
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);} 
          
          
          
          
          PreparedStatement ps4 = con.prepareStatement("delete from vacate where id=?");
          ps4.setInt(1,id1);
          int k=ps4.executeUpdate();
            if (k > 0) {%>
            <p onload="call()"></p>
           <% 
               
              response.sendRedirect("approvevacate.jsp");
              }
            else {
           
           %>
               <p onload="call1()"></p>
            <%
                response.sendRedirect("approvevacate.jsp");
                }

%>