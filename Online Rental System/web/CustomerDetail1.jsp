<%
    String user = (String) session.getAttribute("username");
    String mob = (String) session.getAttribute("mobile");
    int id = Integer.parseInt(session.getAttribute("id").toString());
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

        <title>Client Details</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <style>
            .image-container {
                position: relative;
            }
            .image {
                opacity: 1;
                display: block;
                width: 100%;
                height: auto;
                transition: .5s ease;
                backface-visibility: hidden;
            }
            .middle {
                transition: .5s ease;
                opacity: 0;
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                -ms-transform: translate(-50%, -50%);
                text-align: center;

                .image-container:hover .image {
                    opacity: 0.3;
                }
                .image-container:hover .middle {
                    opacity: 1;
                }
                hr{
                    margin-bottom: 2px;
                    margin-top: 2px;
                }
            </style>
        </head>

        <body id="page-top">

            <!-- Page Wrapper -->
            <div id="wrapper">

                <!-- Sidebar -->
                <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                    <!-- Sidebar - Brand -->
                    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                        
                        <div class="sidebar-brand-text mx-3">Online Rental</div>
                    </a>

                    <!-- Divider -->
                    

                    
                    <!-- Nav Item - Pages Collapse Menu -->
                    <!-- Nav Item - Charts -->
                   <hr class="sidebar-divider my-0">
                   <li class="nav-item">
                    <a class="nav-link" href="Home.jsp">
                        <i class="fas fa-home"></i>
                        <span>Dashboard</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ClientAddHouse.jsp">
                        <i class="fas fa-home"></i>
                        <span>Add House</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="HouseDetails.jsp">
                        <i class="fas fa-home"></i>
                        <span>House Details</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="approveextension.jsp">
                        <i class="fas fa-home"></i>
                        <span>Approve Extension</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="CustomerHistory.jsp">
                        <i class="fas fa-home"></i>
                        <span>History Of Customers</span></a>
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
                                        <span class="mr-2 d-none d-lg-inline text-gray-600 small">${customername}</span>
                                        <i class="fas fa-user"></i>
                                    </a>
                                    <!-- Dropdown - User Information -->
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                                       <a class="dropdown-item" href="ClientDetails.jsp?mob=<%=mob%>">
                                            <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                            Profile
                                        </a>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#ProfileModal">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Update Profile
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
           
                        </nav>
                        <!-- End of Topbar -->

                        <%      String mobile = (String) request.getParameter("mob");
                            Connection con = null;
                        %>
                        <!-- Begin Page Content -->
                        <%                try {
                                con = DatabaseConnection.initializeDatabase();
                                String query = "select * from userregister " + "where mobile = '" + mobile + "'";
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery(query);
                                while (rs.next()) {

                        %>
                        <section>
                            <div class="container">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="card" style="background: linear-gradient(45deg, black, transparent); box-shadow: 5px 10px;border: 1px solid;">
                                            <div class="card-body">
                                                <div class="card-title mb-4">
                                                    <div class="d-flex justify-content-start">
                                                        <div class="image-container">
                                                            <img src="img/i2.jpg" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />
                                                                
                                                        </div>
                                                        <div class="userData ml-3">
                                                            <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold"><a href="javascript:void(0);"><%= rs.getString(7)%></a></h2>
                                                            </div>
                                                            <div class="ml-auto">
                                                                <input type="button" class="btn btn-primary d-none" id="btnDiscard" value="Discard Changes" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                                                <li class="nav-item">
                                                                    <a class="nav-link active" id="basicInfo-tab" data-toggle="tab" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="true">Basic Info</a>
                                                                </li>
                                                                <li class="nav-item">
                                                                    <a class="nav-link" id="connectedServices-tab" data-toggle="tab" href="#connectedServices" role="tab" aria-controls="connectedServices" aria-selected="false">Connected Services</a>
                                                                </li>
                                                            </ul>
                                                            <div class="tab-content ml-1" id="myTabContent">
                                                                <div class="tab-pane fade show active" id="basicInfo" role="tabpanel" aria-labelledby="basicInfo-tab">
                                                                    <div class="row">
                                                                        <div class="col-sm-3 col-md-2 col-5">
                                                                            <label style="font-weight:bold; color: white;">Full Name</label>
                                                                    </div>
                                                                    <div class="col-md-8 col-6">
                                                                        <%=rs.getString(2)%>&nbsp;&nbsp;<%= rs.getString(3)%>
                                                                    </div>
                                                                </div>
                                                                <hr />

                                                                <div class="row">
                                                                    <div class="col-sm-3 col-md-2 col-5">
                                                                        <label style="font-weight:bold; color: white;">Email:</label>
                                                                    </div>
                                                                    <div class="col-md-8 col-6">
                                                                        <%=rs.getString(4)%>
                                                                    </div>
                                                                </div>
                                                                <hr/>


                                                                <div class="row">
                                                                    <div class="col-sm-3 col-md-2 col-5">
                                                                        <label style="font-weight:bold; color: white;">Mobile</label>
                                                                    </div>
                                                                    <div class="col-md-8 col-6">
                                                                        <%=rs.getString(5)%>
                                                                    </div>
                                                                </div>
                                                                <hr />
                                                                <div class="row">
                                                                    <div class="col-sm-3 col-md-2 col-5">
                                                                        <label style="font-weight:bold; color: white;">Gender</label>
                                                                    </div>
                                                                    <div class="col-md-8 col-6">
                                                                        <%=rs.getString(6)%>
                                                                    </div>
                                                                </div>
                                                                <hr />
                                                                <div class="row">
                                                                    <div class="col-sm-3 col-md-2 col-5">
                                                                        <label style="font-weight:bold; color: white;">Address</label>
                                                                    </div>
                                                                    <div class="col-md-8 col-6">
                                                                        <%=rs.getString(9)%>
                                                                    </div>
                                                                </div>
                                                                <hr />
                                                                <div class="row">
                                                                    <div class="col-sm-3 col-md-2 col-5">
                                                                        <label style="font-weight:bold; color: white;">City</label>
                                                                    </div>
                                                                    <div class="col-md-8 col-6">
                                                                        <%=rs.getString(10)%>
                                                                    </div>
                                                                </div>
                                                                <hr />
                                                            </div>
                                                            <div class="tab-pane fade" id="connectedServices" role="tabpanel" aria-labelledby="ConnectedServices-tab">
                                                                <a href="mailto:<%=rs.getString(4)%>"> <img src="img/gmail.png" alt="" width="30" height="20"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="tel:<%=rs.getString(5)%>"> <img src="img/mobile.png" alt="" width="50" height="30"></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- End of Page Content -->
                        <%        }
                            } catch (Exception e) {

                            }
                        %>

                        <!-- Footer -->
                        <footer class="sticky-footer" style="background-color: transparent;">
                            <div class="container my-auto">
                                <div class="copyright text-center my-auto" style="color: white">
                                        <span>Copyright &copy;  Online Rental System </span>
                                </div>
                            </div>
                        </footer>
                        <!-- End of Footer -->

                    </div>
                    <!-- End of Content Wrapper -->

                </div>
                <!-- End of Page Wrapper -->

                <!-- Scroll to Top Button-->
                <a class="scroll-to-top rounded" href="#page-top">
                    <i class="fas fa-angle-up"></i>
                </a>




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
