<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
 <%@include file="./components/components_css_jss.jsp" %>
</head>
<body>

<!-- navbar -->
  <%@include file="./components/Navbar.jsp" %>
  
  <div class="row mt-5">
    <div class="col-md-4 offset-md-4">'
         <div class="card">
            <div class="card-body px-5">
                <h3 class="text-center my-3"> Sign Up </h3>

					<form>
						<div class="form-group">
							<label for="name">User Name</label> <input type="text"
								class="form-control" id="name" placeholder="Enter UserName" />
						</div>
						<div class="form-group">
							<label for="email">User Email</label> <input type="email"
								class="form-control" id="email" placeholder="Enter email" />
						</div>
						<div class="form-group">
							<label for="password">User password</label> <input
								type="password" class="form-control" id="password"
								placeholder="Enter password" />
						</div>
						<div class="form-group">
							<label for="phone">User phone</label> <input type="text"
								class="form-control" id="phone" placeholder="Enter phone" />
						</div>
						<div class="form-group">
							<label for="phone">User Address</label>
							<textarea class="form-control" style="height: 200px;"
								placeholder="Enter Address"></textarea>
						</div>
						<div class="container">
							<button class="btn btn-outline-success text-center">Register</button>
							<button class="btn btn-outline-warning">Reset</button>
						</div>


					</form>
				</div>
         </div>
      
    </div>
  
  </div>

</body>
</html>