<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<style>
body{
background:url(rain.jpg) no-repeat center center/cover fixed;
color:black;
font-weight:100;
margin-top:100px;
}
</style>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
<% String user = request.getParameter("user");%>
<% String dob =request.getParameter("dob");
LocalDate userdob=LocalDate.parse(dob);
int userdate=userdob.getYear();
%>
<% LocalDate date = LocalDate.now(); 
int num = date.getYear();%><br>
<% int age = num-userdate;
if(age<18){
	RequestDispatcher rq = request.getRequestDispatcher("age.html");
	rq.forward(request, response);
}%><br><br>
<% String n = request.getParameter("number");
int len=n.length();
if(len==10){
	if(n.charAt(0)=='9' || n.charAt(0)=='8' || n.charAt(0)=='7' || n.charAt(0)=='6'){
		out.println();
	}else{
		RequestDispatcher rq = request.getRequestDispatcher("number.html");
		rq.forward(request, response);
	}
}else{
	 RequestDispatcher rq = request.getRequestDispatcher("number.html");
	 rq.forward(request, response);
}%><br>
<% Map<String,Integer> details =new HashMap<>();
 details.put("Java",20000);
 details.put("Python",20000);
 details.put("FullStack",30000);
 details.put("C",15000);
 details.put("C++",18000);%>
 <% String course = request.getParameter("select");
 int value = details.get(course);%>
 <%String amt = request.getParameter("amount");
 int amount=Integer.parseInt(amt);%>
 <% int balance = value-amount;
 if(value>amount){ %>
 <script>
 alert("Payment pending : "+ <%out.println(balance);%>)
 </script>
	 <center><h1>Congratulations Register Successfully... </h1>
	 <h3>Our team will reach you soon... <br><br>
	 <%out.println("Pending payment : "+balance);%></h3></center>
 <% }
 else{ %>
 <center>
 <h1>Congratulations Register Successfully... </h1>
 <h4>Our team will reach you soon...</h4>
 </center>
 <% }%>
</body>
</html>