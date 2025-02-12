
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

        <title>View Transaction</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
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
                <hr class="sidebar-divider my-0">

              
                <!-- Nav Item - Pages Collapse Menu -->
                <!-- Nav Item - Charts -->
                <li class="nav-item">
                    <a class="nav-link" href="UserHome.jsp">
                        <i class="fas fa-home"></i>
                        <span>DashBoard</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="SearchHouse.jsp">
                        <i class="fas fa-home"></i>
                        <span>Search House</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <a class="nav-link" href="CustHouseDetails.jsp">
                        <i class="fas fa-home"></i>
                        <span>House Details</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="AddTransaction.jsp">
                        <i class="fas fa-home"></i>
                        <span>Add Transaction</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="validityExtension.jsp">
                        <i class="fas fa-home"></i>
                        <span>Validity Extension</span></a>
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
                                     <a class="dropdown-item" href="CustomerDetail.jsp?mob=<%=Mob%>">
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
                    <!-- End of Topbar -->
        
        <!-- Begin Page Content -->
                    <div class="container-fluid">
                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Transaction Details</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>SR.No</th>
                                                <th>Transaction Type</th>
                                                <th>Transaction Date</th>
                                                <th>Amount</th>
                                                <th>Mobile Number</th>
                                                <th>Type Of Rent</th>
                                                <th>Assetname</th>
                                                <th></th>

   
                                            </tr>
                                        </thead>
                                        
                                        <tbody>
                                            <%
                                                try {
                                                    Connection con = DatabaseConnection.initializeDatabase();
                                                    Statement st = (Statement) con.createStatement();
                                                    String sql = "select * from transaction where mobile like '%" + Mob + "%' ";
                                                    ResultSet rs = st.executeQuery(sql);
                                                    int id1;
                                                    while (rs.next()) {
                                                        id1=rs.getInt(1);

                                            %>
                                            <tr>
                                                <td><%=rs.getString(1)%></td>
                                                <td><%=rs.getString(2)%></td>
                                                <td><%=rs.getString(3)%></td>
                                                <td><%=rs.getString(4)%></td>
                                                <td><%=rs.getString(5)%></td>
                                                <td><%=rs.getString(6)%></td>
                                                <td><%=rs.getString(7)%></td>
                                                <td><a href="DeleteTransaction.jsp?id=<%=id1%>"><input type="submit" class="fadeIn fourth" value="Delete"></a></td>
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

