<%@page import="com.shop.FactoryProvider"%>
<html>
<head>
  <title>Shopping</title>
  
  <%@include file="./components/components_css_jss.jsp" %>
  
</head>
<body>
 <%@include file="./components/Navbar.jsp" %>
<h1>Session factory Object</h1>

<%

out.println(FactoryProvider.getSessionFactory());

%>





</body>
</html>
