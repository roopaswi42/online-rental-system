<%@page import="java.sql.PreparedStatement"%>
<%
    String username = (String) session.getAttribute("AdminUsername");
    int id1= Integer.parseInt(session.getAttribute("AdminID").toString());
    String name1 = (String) session.getAttribute("AdminName");
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

        <title>Admin Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
               <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                    <div class="sidebar-brand-icon rotate-n-15">
                       
                    </div>
                    <div class="sidebar-brand-text mx-3">Online Rental</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->

                <!-- Divider -->
                <hr class="sidebar-divider">

               

               
                <!-- Heading -->
                <div class="sidebar-heading">
                    
                </div>
                <!-- Nav Item - Pages Collapse Menu -->
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="AdminDashboard.jsp">
                        <i class="fas fa-user fa-2x"></i>
                        <span>Dashboard</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ViewClients.jsp">
                        <i class="fas fa-user fa-2x"></i>
                        <span>Clients</span></a>
                </li>

                <!-- Nav Item - Tables -->
                 
                <li class="nav-item">
                    <a class="nav-link" href="ViewUsers.jsp">
                        <i class="fas fa-user fa-2x"></i>
                        <span>Users</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="ViewHouses.jsp">
                        <i class="fas fa-home"></i>
                        <span>Houses</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="approve.jsp">
                        <i class="fas fa-home"></i>
                        <span>Approve Houses</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="approvevacate.jsp">
                        <i class="fas fa-user fa-2x"></i>
                        <span>Vacate Request</span></a>
                </li>
               

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column" style="background: url(img/i2.jpg) no-repeat center center fixed; background-size: cover; -o-background-size: cover; -moz-background-size: cover; -webkit-background-size: cover;">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>                         

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${AdminName}</span>
                                    <i class="fas fa-user"></i>
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#ProfileModal">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->
                    <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Customer Details</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>SR.No</th>
                                                
                                                <th>House Name</th>
                                                <th>Customer Name</th>
                                                <th></th>


   
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            <%
                                                try {
                                                    int i=1;
                                                    Connection con = DatabaseConnection.initializeDatabase();
                                                    Statement st = (Statement) con.createStatement();
                                                    String hname="";
                                                    String sql = "select * from housedetails ";
                                                    ResultSet rs = st.executeQuery(sql);
                                                    //System.out.print(mob);
                                                    
                                                    while (rs.next()) {
                                                        //hname=rs.getString(1);
                                                       int id=rs.getInt(1);
                                                       String user1=rs.getString(2);
                                                       System.out.print(user1);
                                                       String name="",mail="";
                                                       String fname="",lname="",mobile="";
                                                        PreparedStatement ps=con.prepareStatement("Select * from addhouse where id=?");
                                                         ps.setInt(1,id );
                                                         ResultSet rs1=ps.executeQuery();
                                                         while(rs1.next())
                                                         {
                                                             name=rs1.getString(1);
                                                             mail=rs1.getString(4);
                                                         }
                                                         PreparedStatement ps1=con.prepareStatement("Select * from userregister where username=?");
                                                         ps1.setString(1,user1);
                                                         ResultSet rs2=ps1.executeQuery();
                                                         while(rs2.next())
                                                         {
                                                             fname=rs2.getString(2);
                                                             lname=rs2.getString(3);
                                                             mobile=rs2.getString(5);
                                                         }
                                                         
                                                         
                                                         
                                                                 
                                                             
                                                         
                                            %>
                                            <tr>
                                                <td><%=i%></td>
                                                <td><%=name%></td>
                                                <td><%=fname+lname%></td>
                                                
                                                <td><a href="CustomerDetail2.jsp?mob=<%=mobile%>"><input type="submit" class="fadeIn fourth" value="View"></a></td>
                                                
                                            </tr>
                                            <%
                                                   
                                                         }

                                                        
                                                    
                                                    
                                                    con.close();
                                                } catch (Exception e) {
                                                    e.printStackTrace();
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->
                

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/datatables-demo.js"></script>
    <script type = "text/javascript" >
            function preventBack(){
                window.history.forward();
            }
            setTimeout("preventBack()",0);
            window.onunload=function(){null};
        </script>
    </body>
</html>
