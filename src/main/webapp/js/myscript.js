

// Add to cart
function add_to_cart(pid,pname,price){
	
    	let cart = localStorage.getItem('cart');
	    if(cart == null)
	     {
	    	
	    	let products = [];
	    	let product = {productId:pid,productName:pname,pQty:1,pPrice:price};
	    	
	    	products.push(product);
	    	localStorage.setItem("cart",JSON.stringify(products));
	    	
	    	console.log("product is added for first time ");
	    	 	
	     }else{
	    	 
	    	 //cart is already present
	    	 let pCart = JSON.parse(cart);
	    	 
	    	 let oldProduct = pCart.find((item) => item.productId == pid) 
	    	 console.log(oldProduct);
	    	 
	    	 if(oldProduct)
	    	   {
	    		 
	    		 //we have to increase the qty
	    		oldProduct.pQty = oldProduct.pQty+1;
	    		pCart.map((item) =>{
	    			if(item.productId == oldProduct.productId)
	    			  {
	    				  item.pQty = oldProduct.pQty;
	    			  }
	    		})
	    		
	    		 localStorage.setItem("cart",JSON.stringify(pCart));
	    		console.log("product is qty is increased ");
	    		 
	    	   }else{
	    		   
	    		   //we have to add product
	    		    let product = {productId:pid,productName:pname,pQty:1,pPrice:price};
		    		 pCart.push(product);
		    		 localStorage.setItem("cart",JSON.stringify(pCart));
		    		 
		    		 console.log("product is added :) ");
	    	   }
	    	 
	     }
	    
	    updateCart();
	     
	  
}

//**********************************************************************************


// Update Cart

//****************************************************************************

   function updateCart(){
	
	  let cartString = localStorage.getItem("cart");
	  let cart  = JSON.parse(cartString);
	  
	  if(cart == null || cart.length == 0)
	   {
		  console.log("Cart is empty !!");
		  $(".cart-items").html(" ( 0 ) ");
		  $(".cart-body").html("<h3> Cart does not have any items </h3> ");
		  $(".checkout-btn").addClass('disabled');
	   }else {
		   
		   //there is something in cart
		   
		   console.log(cart);
		   $(".cart-items").html(`( ${cart.length})`);
		   let table = `
		     
		     <table class='table'> 
		     <thead class='thread-light' >
		        <tr>
		          <th> Item Name </th>
		          <th> Price      </th>
		          <th> Qty        </th>
		          <th> Total Price  </th>
		          <th> Action </th>
		     
		        </tr>
		     </thead>
		   
		   
		   
		   `;
		   
		   let totalPrice = 0;
		   cart.map((item) =>{
			 
			   table += `
			   
			      <tr>
			        <td> ${item.productName} </td>
			        <td> ${item.pPrice} </td>
			        <td> ${item.pQty} </td>
			        <td> ${item.pQty*item.pPrice} </td>
			        <td> <button class="btn btn-danger btn-sm"> Remove </button>  </td>
			      </tr>
	   
			   `
				 totalPrice += item.pPrice * item.pQty;
				   
			   
		   })
		   
		   table = table+`
		   
		     <tr> <td colspan='5' class="text-right font-weight-bold m-9"> Total Price : ${totalPrice} </td> </tr>
		   </table>`;
		   $(".cart-body").html(table);
	   }
	
}
   
   $(document).ready(function(){
	   updateCart();
   })



