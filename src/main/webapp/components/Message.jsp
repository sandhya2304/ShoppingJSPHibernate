


<%


  String mymsg =  (String)session.getAttribute("msg");
  if(mymsg != null)
  {
	
	  //out.print(mymsg);
	 

%>

<div class="alert alert-success alert-dismissible fade show"
	role="alert">
	<strong><%= mymsg %></strong> 
	
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>



<%    
	 session.removeAttribute("msg");
  }

%>