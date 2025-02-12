<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <title>validity Extension</title>
        <style>
            body { 
                background: url(img/i2.jpg) no-repeat center center fixed; 
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
            .regform{
                padding: 20px;
                margin: 20px;
                background-color: #transparent;


            }
            .Cheadline{
                color: hotpink;
                display: flex;
                align-items: center;
                justify-content: center;
                font-style: italic;
                font-size: 30px;
            }
            label{
                color: white;
                font-size: 18px;
                font-style: italic;
                font-family: cursive;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm navbar-light" style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="Home.jsp">House-Renting</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ml-auto" style="margin-right: 20px;">
                    <a class="nav-item nav-link active" href="UserHome.jsp">Dashboard</a>
                    <a class="nav-item nav-link active" href="SearchHouse.jsp">Search Houses</a>
                    <a class="nav-item nav-link active" href="CustHouseDetails.jsp">House Details</a> 
                     <a class="nav-item nav-link active" href="AddTransaction.jsp">Add Transaction</a>
                    <a class="nav-item nav-link active" href="ViewTransaction.jsp">View Transaction</a> 
                    <a class="nav-item nav-link active" href="CustomerLogin.jsp">LogOut</a> 
                </div>
            </div>
        </nav>

        <div class="Cheadline">
            <%
    String username = (String) session.getAttribute("customerusername");
    int id = Integer.parseInt(session.getAttribute("customerid").toString());
    String name = (String) session.getAttribute("customername");

%>  
            <h1>validity Extend</h1>
        </div>
            
        <section class="regform">
             <form action="<%=request.getContextPath()%>/validityextend" enctype="multipart/form-data" method="get">
                <div class="form-row" >
                    
                    <div class="col-md-4 mb-3">
                        <label for="validationServer02">Assest name</label>
                        <input type="text" class="form-control is-valid" name="name" id="validationServer02" placeholder="Assest name"  required>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
 
                    <div class="col-md-4 mb-3">
                        <label for="validationServer03">Mail ID</label>
                        <input type="text" class="form-control is-valid" name="mailid" id="validationServer03" placeholder="User ID" required>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationServer02">User name</label>
                        <input type="text" class="form-control is-valid" name="uname" id="validationServer02" placeholder="User name"  required>
                        <div class="valid-feedback">
                            Looks good!
                        </div>
                    </div>
                    <br>
                    <div class="col-md-3 mb-2">
                        <label for="validationServer04">Extension period</label>
                        <select class="form-control is-invalid" name="Extend" id="validationServer04" required>
                            <option value="2 months">2 Months</option>
                                <option value="4 months">4 Months</option>
                              <option value="6 months">6 Months</option>
                              <option value="1 year">1 Year</option>
                        </select>
                            <div class="invalid-feedback">
                        
              
                    <button class="btn btn-primary" type="submit">Submit form</button>
            </form>
        </section>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script type = "text/javascript" >
            function preventBack(){
                window.history.forward();
            }
            setTimeout("preventBack()",0);
            window.onunload=function(){null};
        </script>
    </body>
</html>