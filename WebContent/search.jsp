<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
       <link rel="stylesheet" href="css/home1.css">
    <link rel="stylesheet" href="css/temp1.css">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    
  

</head>
<body>
   <div id="div1">  
       <img src="images/logo.jpg" style="position:absolute; top:0px; left:0px; height:58px; width:100px;" alt=""> 
    <ul>   
         

        <li id="id2" ><a href="home.jsp"  >Home</a></li>
        <li id="id3" ><a href="login.html" >Property Services</a></li>
     <li class="nav-item dropdown" id="id4">
        <a class="nav-link dropdown-toggle drop" style="position:absolute; top:7px;" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Customer Service
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="login.html" style="background-color:lightgray; ">Complaint</a>
          <a class="dropdown-item" href="login.html" style="background-color:lightgray;" >Feedback</a>
          
      </li>
         <li id="id71"> <a href="search.jsp"> Search Property</a>
        <li id="id5" ><a href="Contactus.html"  >Contact us</a></li>
        <li id="id6" ><a href="aboutus.html"  >About us</a></li>
        
        <li> <a href="login.html" id="li1">Post Property Free</a></li>
        
     <li style="position:absolute; left:1200px; top:0px; height:60px; padding-top: 15px;" id="id7" ><a href="Login_Session" >Login   |</a></li>
        <li style="position:absolute; left:1270px; top:0px; height:60px; padding-top: 15px;" id="id8"  ><a href="Register.html" >SignUp</a></li>
     
    </ul>
   
</div>

 <div class="div3" >

    <div class="div2">

         <h1 style="position: absolute; top:150px; left:370px; color:white; opacity: 80%; font-family: Verdana, Geneva, Tahoma, sans-serif;"> Find Your Perfect Home or Shop Here </h1>
        <form action="search_filter.jsp">
         <input type="text" placeholder="Enter Landmark or Location" name="s1" id="s1" style="position:absolute; top:300px; left:400px; width:500px; height:40px; opacity: 90%;  border:none;">
         <input type="submit" value="Search" name="s1" style="position:absolute; background-color: blue; color:white;cursor: pointer; top:300px; left:900px; width:100px; height:40px; opacity: 90%;  border:none;"> 
         </form>
        </div>
        
        
          
        
    </div>
  <section class="property-list" style="position: absolute; top:850px; left:20px;">
<%
try
{
	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
    
  String inst="select * from Property_data";

  Statement s = con1.createStatement();
  ResultSet rs = s.executeQuery(inst);
 	
	%>
	<div style="background-color:cyan;"> 
  <%
  while(rs.next())
  {
	 String pid = ""+rs.getInt("pid");
	 
	HttpSession sess = request.getSession();
	sess.setAttribute("pid", pid);
%>
<a href='details_nouser.jsp?pid=<%=pid%>'>
<div class="propery-content" style="background-color:lightgray;">
<img class="home-images" src="images/<%=rs.getString("url1")%>"/>
<h2><%=rs.getString("ptype") %></h2>
<p>City:- <%=rs.getString("city") %></p>
<p>Rent: <%=rs.getString("rent") %> </p>
<p>Deposit: <%=rs.getString("deposit") %> </p>
</div></a><%
  }
  %>
  
  </div>
  <%
}
catch(Exception e)
{
  System.out.println(e.getMessage());
}
%>

</section>
     
     
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
 

</body>
</html>