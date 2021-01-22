<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
 <%@include file="./components/components_css_jss.jsp" %>
</head>
<body>

<!-- navbar -->
  <%@include file="./components/Navbar.jsp" %>
  
<div class="container">
  <div class="row">
     <div class="col-md-6 offset-md-3" >
     
        <div class="card mt-3">
        
           <div class="card-header custom-bg text-white">
           
             <h3>LOGIN</h3>
           
           </div>
           
            <%@ include file="./components/Message.jsp" %>
           
            <div class="card-body">

						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label>
								<input name="email"
									type="email" class="form-control" id="exampleInputEmail1"
									 placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label>
								 <input name="password"
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							
							<a href="register.jsp" class="text-center d-block mb-2"> Register here </a>
							
							<div class="container text-center">
							    <button type="submit" class="btn btn-primary border-0 custom-bg">Submit</button>
							    <button type="reset" class="btn btn-warning ">Reset</button>
							</div>
							
							
						</form>

					</div>
           
  
        
        </div>
     
     </div>
     
  </div>
</div>

</body>
</html>