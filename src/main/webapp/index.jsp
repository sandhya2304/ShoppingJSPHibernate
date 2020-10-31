

<%@page import="com.shop.FactoryProvider"%>
<html>
<body>

<h1>Session factory Object</h1>

<%

out.println(FactoryProvider.getSessionFactory());

%>


</body>
</html>
