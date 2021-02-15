

<!-- validation for checkout -->
<%
    
     User user = (User)session.getAttribute("current-user");
     if(user == null)
     {
    	 session.setAttribute("msg","You are not logged in!! Login first to access checkout");
    	 response.sendRedirect("login.jsp");
    	 return;
     }
     
     
 %>    




<title>Checkout</title>
<%@include file="./components/components_css_jss.jsp" %>
</head>
<body>
<!-- navbar -->
  <%@include file="./components/Navbar.jsp" %>
   
   
     <div class="container">
        <div class="row mt-5">
           
            <div class="col-md-6">
                <!-- Card -->
                <div class="card"> 
                  <div class="card-body">
                  
                    <h3 class="text-center mb-5">Your selected items </h3>
                  
                     <div class="cart-body">
                
                     </div>
                
                  </div>
                </div>  
            
            </div>
            <div class="col-md-6">
              <!-- form details -->
              
               <div class="card"> 
                  <div class="card-body">
                  
                    <h3 class="text-center mb-5">Your details for Order </h3>
                  
                      <form>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									
									value="<%= user.getUserEmail() %>"
									>
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Your Name</label> <input
									type="text" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter name"
									value="<%= user.getUserName() %>"
									>
								
							</div>
							
							<div class="form-group">
								<label for="exampleInputEmail1">Your Contact</label> <input
									type="text" class="form-control" id="phone"
									placeholder="Enter Phone"
									value="<%= user.getUserPhone() %>"
									>
								
							</div>

							<div class="form-group">
								<label for="exampleFormControlTextarea1">
								   You Shipping  Addresss
								</label>
								<textarea class="form-control" id="exampleFormControlTextarea1"
									rows="3" placeholder="Enter your address"
									value="<%= user.getUserAddress() %>"
									></textarea>
							</div>
							
							<div class="container text-center">
							 
							  <button class="btn btn-outline-success ">Order Now</button>
							  <button class="btn btn-outline-success ">Continue Shopping..</button>
							
							</div>


						</form>		
					</div>
                </div>  
         
            </div>
        
        </div>
     
     </div>
      
   
   
   
   
  <%@include file="./components/common_modals.jsp" %>
</body>
</html>