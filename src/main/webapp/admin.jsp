<%@page import="com.shop.dao.UserDao"%>
<%@page import="com.shop.entities.Product"%>
<%@page import="com.shop.dao.ProductDao"%>
<%@page import="com.shop.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.shop.FactoryProvider"%>
<%@page import="com.shop.dao.CategoryDao"%>
<%@page import="com.shop.entities.User"%>


<%
    
     User user = (User)session.getAttribute("current-user");
     if(user == null)
     {
    	 session.setAttribute("msg","You are not logged in");
    	 response.sendRedirect("login.jsp");
    	 return;
     }else{
    	 
    	 if(user.getUserType().equals("normal")){
    		 session.setAttribute("msg","you are not admin !! So you can't access");
    		 response.sendRedirect("login.jsp");
        	 return;
    	 }
    	 
     }


%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>

<%@include file="./components/components_css_jss.jsp" %>
</head>
<body>

<!-- navbar -->
  <%@include file="./components/Navbar.jsp" %>
   
   <div class="container admin">
   
      <div class="container-fluid mt-3">
        <%@ include file="./components/Message.jsp" %>
      
      </div>
      
                     	<%
							
							CategoryDao categoryDao = new CategoryDao(FactoryProvider.getSessionFactory());
							List<Category> list = categoryDao.allCategory();
							
							
							ProductDao productDao = new ProductDao(FactoryProvider.getSessionFactory());
							List<Product> listProduct = productDao.getAllProducts();
							
							
							UserDao userDao = new UserDao(FactoryProvider.getSessionFactory());
							List<User> userList = userDao.getAllUsers();
							
							
							%>
							
      
     
 
   <!-- first row -->
        <div class="row mt-4">
         
         <!-- first column -->
            <div class="col-md-4">
            
              <div class="card text-center">
              
                <div class="container">
                  
                  <img class="img-fluid rounded-circle" alt="users" 
                       src="image/usersIcon.png" style="max-width: 120px;">
                
                </div>
               
                   <div class="card-body ">
                         
                         <h1><%= userList.size() %>  </h1>
                         <h1 class="text-uppercase text-muted">Users</h1>
                   
                   </div>
              
              
              </div>
            
            
            </div>
            
            
             <!-- second column -->
            <div class="col-md-4">
            
                <div class="card text-center">
               
                   <div class="card-body ">
                   
                      <div class="container">
                  
                         <img class="img-fluid rounded-circle" alt="users" 
                          src="image/note.png" style="max-width: 120px;">
                
                     </div>
                        
                          <h1><%= list.size() %> </h1>
                         <h1 class="text-uppercase text-muted">Catgeories</h1>
                   
                   </div>
              
              
              </div>
            
            
            </div>
            
            
             <!-- third column -->
            <div class="col-md-4">
            
             
                <div class="card  text-center">
               
                   <div class="card-body">
                   
                        <div class="container">
                  
                           <img class="img-fluid rounded-circle" alt="users" 
                             src="image/dairy-products.png" style="max-width: 120px;">
                
                           </div>
                        
                         <h1> <%= listProduct.size() %>   </h1>
                         <h1 class="text-uppercase text-muted">Products</h1>
                   
                   </div>
              
              
              </div>
            
            
            </div>
        
        </div>
        
        <!-- seond row -->
        <div class="row mt-4">
        
               
             <!-- first column -->
            <div class="col-md-6">
            
            
               <div class="card  text-center" data-toggle="modal" data-target="#addCategoryModal">
               
                   <div class="card-body">
                   
                        <div class="container">
                  
                           <img class="img-fluid rounded-circle" alt="users" 
                             src="image/key.png" style="max-width: 120px;">
                
                           </div>
                        
                         <p class="mt-3">Click here to add Categories</p>
                         <h1 class="text-uppercase text-muted">Add Category</h1>
                   
                   </div>
              
              
              </div>
            
            
            </div>
            
            
                  
             <!-- second column -->
            <div class="col-md-6">
            
                <div class="card"  data-toggle="modal" data-target="#add-product-modal" >
               
                   <div class="card-body  text-center">
                   
                        <div class="container">
                  
                           <img class="img-fluid rounded-circle" alt="users" 
                             src="image/plus.png" style="max-width: 120px;">
                
                           </div>
                        
                        <p class="mt-3">Click here to add Products</p>
                         <h1 class="text-uppercase text-muted">Add Products</h1>
                   
                   </div>
              
              
              </div>
            
            
            </div>
             
        </div>
        
   </div>
   
   
   <!-- add category modal -->
     <div class="container ">


		<!-- Modal -->
		<div class="modal fade" id="addCategoryModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header custom-bg text-white">
						<h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<form action="ProductOperationServlet" method="post">
						
						
						 <input type="hidden" name="operation" value="addCategory" />
 						
							<div class="form-group">
								<input
									type="text" class="form-control" name="catTitle"
									placeholder="Enter category title" required />
								
							</div>
							<div class="form-group">
								<textarea style="height: 250px"
									class="form-control" name="catDesc"
									placeholder="Enter category description" required >
									
									
									</textarea>
								
							</div>
							<div class="container text-center">
							  <button class="btn btn-outline-success" type="submit" class="btn btn-primary">
							     Submit
							  </button>
							  <button type="button" class="btn btn-secondary" data-dismiss="modal">
							      Close
							   </button>
							</div>
						</form>



					</div>
					
				</div>
			</div>
		</div>


	</div>
     
      <!-- end category modal -->
      
      
      <!-- product modal -->
      

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
	
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				
				<!-- product form -->
				
					<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
						
						
						 <input type="hidden" name="operation" value="addProduct" />
 						
							<div class="form-group">
								<input
									type="text" class="form-control" name="pName"
									placeholder="Enter product title" required />
								
							</div>
							<div class="form-group">
								<textarea style="height: 150px"
									class="form-control" name="pDesc"
									placeholder="Enter product description" required >
									
									
									</textarea>
								
							</div>
							
							<div class="form-group">
								<input
									type="number" class="form-control" name="pPrice"
									placeholder="Enter product price" required />
								
							</div>
							
							<div class="form-group">
								<input
									type="number" class="form-control" name="pDiscount"
									placeholder="Enter product discount" required />
								
							</div>
							
							<div class="form-group">
								<input
									type="number" class="form-control" name="pQuality"
									placeholder="Enter product Qualtiy" required />
								
							</div>
							
						
							
							<div class="form-group">
							   <select name="catId" class="form-control">
							   
							   <%
							   
							
								   
								   for(Category cat:list)
								   {
							   
							   %>
							     
							      <option value="<%= cat.getCategoryId() %>" > <%= cat.getCategoryTitle() %> </option>
							      
							      <%
							        
								   } 
							      %>
							   
							   </select>
							</div>
							
							<div class="form-group">
							    <label for="pPic">Select Picture Of Product</label>
							    <input type="file" id="pPic" name="pPic" required />
							</div>
							
							
							
							<div class="container text-center">
							  <button class="btn btn-outline-success" type="submit" class="btn btn-primary">
							     Submit
							  </button>
							  <button type="button" class="btn btn-secondary" data-dismiss="modal">
							      Close
							   </button>
							</div>
						</form>
				
				
				
				<!-- end Form -->
				
				
				</div>
				
			</div>
		</div>
	</div>










	<!-- End product Modal -->
   
</body>
</html>