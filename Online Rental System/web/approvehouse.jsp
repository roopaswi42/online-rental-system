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
    PreparedStatement ps=con.prepareStatement("select * from approve");
    ResultSet rs=ps.executeQuery();
    int id1=0;
    String cuname="";
    while(rs.next()){
      id1=rs.getInt(1);
      cuname=rs.getString(2);  
    }
    PreparedStatement ps1 = con.prepareStatement("update addhouse set occupency=0 where id=?");
    ps1.setInt(1,id1);
    int i=ps1.executeUpdate();
    if(i>0){
        System.out.println(cuname);
    }
    else
    {
        System.out.println("failed");
    }
    
    
    //Inserting into housedetails
    PreparedStatement ps6 = con.prepareStatement("insert into housedetails(id,username) values(?,?)");
    ps6.setInt(1,id1);
    ps6.setString(2,cuname);
    int k = ps6.executeUpdate();
    
    //Mailsendig to customer 
    System.out.println("Hiii");
    PreparedStatement ps3= con.prepareStatement("select * from userregister where username=?");
    ps3.setString(1,cuname);
    ResultSet rs1 = ps3.executeQuery();
    String email="";
    while(rs1.next()){
         email=rs1.getString(4);
    }
    final String user="ravillahomesinvoice@gmail.com";//change accordingly  
    final String password="RavillaHomes@23";//change accordingly  
    final String msg="This mail is to inform that admin had accepted your request"; 
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
           message.setSubject("Approve House");    
           message.setContent(msg,"text/html");
           Transport.send(message);    
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);}  


   //Mailsending to client
    PreparedStatement ps2 = con.prepareStatement("select * from addhouse where id=?");
    ps2.setInt(1,id1);
    ResultSet rs3 = ps2.executeQuery();
    String mail="";
    String hname="";
    while(rs3.next()){
         mail=rs3.getString(4);
         hname=rs3.getString(1);
    }
    
    final String user1="ravillahomesinvoice@gmail.com";//change accordingly  
    final String password1="RavillaHomes@23";//change accordingly  
    final String msg1="This mail is to inform that admin had asigned your asset   "+hname+"    to customer    "+cuname+""; 
    final String to1=mail;//change accordingly  
    Properties props1 = new Properties();    
          props1.put("mail.smtp.host", "smtp.gmail.com");    
          props1.put("mail.smtp.socketFactory.port", "587");    
          props1.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");
          props1.put("mail.smtp.starttls.enable",true);
          props1.put("mail.smtp.auth", "true");    
          props1.put("mail.smtp.port", "587");   

          Session ses1 = Session.getInstance(props1,    
           new javax.mail.Authenticator() {    
           @Override
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(user1,password1);  
           }    
          });     
          try {    
           MimeMessage message = new MimeMessage(ses1);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to1));    
           message.setSubject("Approve House");    
           message.setContent(msg1,"text/html");
           Transport.send(message);    
           System.out.println("message sent successfully");    
          } catch (MessagingException e) {throw new RuntimeException(e);}
          PreparedStatement ps4 = con.prepareStatement("delete from approve where id=? or username=?");
          ps4.setInt(1,id1);
          ps4.setString(2,cuname);
          int j=ps4.executeUpdate();
            if (i > 0) {%>
            <p onload="call()"></p>
           <% 
               
              response.sendRedirect("approve.jsp");
              }
            else {
           
           %>
               <p onload="call1()"></p>
            <%
                response.sendRedirect("approve.jsp");
                }
            %>