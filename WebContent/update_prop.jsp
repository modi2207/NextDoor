<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/listing.css">
<script>
  
	    function myfun()
	    {
	         
	              console.log("hello");

	              var e=document.getElementById("add");

	               if(!e.checkValidity())
	               {
	                     e.style.border="2px solid red";
	                     console.log(e);
	               }

	               e=document.getElementById("city");

	               if(!e.checkValidity())
	               {
	                     e.style.border="2px solid red";
	               }
	               e=document.getElementById("state");

	               if(!e.checkValidity())
	               {
	                     e.style.border="2px solid red";
	               }

	               e=document.getElementById("pincode");

	               if(!e.checkValidity())
	               {
	                     e.style.border="2px solid red";
	               }

	               e=document.getElementById("area");

	               if(!e.checkValidity())
	               {
	                     e.style.border="2px solid red";
	               }

	               e=document.getElementById("rent");

	               if(!e.checkValidity())
	               {
	                     e.style.border="2px solid red";
	               }
	               e=document.getElementById("deposit");

	               if(!e.checkValidity())
	               {
	                     e.style.border="2px solid red";
	               }
	               e=document.getElementById("date");

	               if(!e.checkValidity())
	               {
	                     e.style.border="2px solid red";
	               }
	    }
    </script>

 <script>

 updateList1 = function() {
    	var input1 = document.getElementsByClassName('file1');
    	console.log("1");
    	var output1 = document.getElementById('filetext1');
        output1.value = input1[0].files[0].name;
   }
  
  updateList2 = function() {
	  var input2 = document.getElementsByClassName('file2');
  	var output2 = document.getElementById('filetext2');
  	console.log("2");
    
      output2.value = input2[0].files[0].name;
  
}
  
  updateList3 = function() {
      var input3 = document.getElementsByClassName('file3');
  	var output3 = document.getElementById('filetext3');
  	console.log("3");
    
      output3.value = input3[0].files[0].name;
      

}


   	    
        

  </script>


</head>
<body>

<%
	try
	{
		 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=Nextdoor","sa","chirag2207");
	     HttpSession sess = request.getSession();
	
	  int uid=Integer.parseInt((String)sess.getAttribute("id"));
	   
	  System.out.println("user id is: "+uid);
	    int pid=Integer.parseInt(request.getParameter("pid"));
	    sess.setAttribute("pid",""+pid);
		 
	  String inst="select * from Property_data where pid="+pid;
	  
	  
	  Statement s = con1.createStatement();
	  ResultSet rs = s.executeQuery(inst);
		
	  
	rs.next();
		
		  String addr1=rs.getString("addr1");
		  int pcode=Integer.parseInt(rs.getString("pcode"));
			  
	%>
	

 <div id="div1">  
        <img src="images/logo.jpg" id="img" alt=""> 
     <ul>   
          
 
  <li id="id2" ><a href="main1.jsp"  >Home |</a></li>
         <li id="id3" style="position: absolute; left:200px;" ><a href="Add_list.html" >Add Listing |</a></li>
         <li id="id4" style="position: absolute; left:310px;" ><a href="#"  >Customer Services |</a></li>
         <li id="id71" style="position: absolute; left:490px;"> <a href="Agreement.jsp"> Property Services |</a>
      <li id="id71" style="position: absolute; left:650px;"> <a href="mylisting.jsp"> My Listings |</a>

         <li id="id5" style="position: absolute; left:760px;" ><a href="myprofile.jsp?e="  >My Account |</a></li>
          
         <li onmouseover="this.style.backgroundColor='#a9a9a9'"> <a href="myfavorite.jsp"  id="id56" style=" position:absolute; left:870px; top:15px; ">My Favorites |</a></li>
         
       
      <li style="position:absolute; left:1200px; top:0px; height:60px; padding-top: 15px;" id="id7" ><a href="Signout" >Sign out  </a></li>
                              
     </ul>
    
 </div>
 <header class="page-header">
		<p class="details"><span class="ast">* </span>Add the below details to upload asset</p>
	</header>

	<section class="main-container">
		<header class="head-box">
			<h2>The Basics</h2>
		</header>

		<form class="form-body" action="update">
			<div class="desc">
				<p><span class="ast">*</span> All fields in this section are required</p>
			</div>
			
			<%
 if(rs.getString("ptype").equals("home"))
  {
	   %> 
	   <div class="type">
				<label class="form-label" for="p-type">Property Type <span class="ast">*</span></label><br>
				<select id="p-type" name="ptype" class="form-input" style="width: 30%; font-size: 1.3rem;" required="true" value="<%=rs.getString("ptype")%>">
				    <option value="home" selected >Home</option>
					<option value="shop">Shop</option>
				</select>
			</div>
			
			   <% 
   }
   else
   {
  %>
			

      <div class="type">
				<label class="form-label" for="p-type">Property Type <span class="ast">*</span></label><br>
				<select id="p-type" name="ptype" class="form-input" style="width: 30%; font-size: 1.3rem;" >
				    <option value="home"  >Home</option>
					<option value="shop" selected >Shop</option>
				</select>
			</div>
          
	<%
   }
	%>
	
			<div class="type">
				<label class="form-label" for="add">Address 1 <span class="ast">*</span></label>
				<input  id="add" type="text" name="address1" value="<%=addr1%>">
			</div>

       <div class="type">
				<label class="form-label" for="add">Near Area <span class="ast">*</span></label>
				<input  id="add" type="text" name="addr" value="<%=rs.getString("addr2")%>">
			</div>
			
			 <div class="type">
			
				<input  type="hidden" id="id" type="text" name="pid"  value="<%=rs.getInt("pid")%>">
			</div>
       
       
			<div class="type">
				<label class="form-label" for="city">City <span class="ast">*</span></label>
				<input  id="city" type="text" name="city" value="<%=rs.getString("city")%>">
			</div>

			<div class="type">
				<label class="form-label" for="state">State <span class="ast">*</span></label>
				<input  id="state" type="text" name="state" value="<%=rs.getString("stat")%>">
			</div>
			<div class="type">
				<label class="form-label" for="pincode">Pincode <span class="ast">*</span></label>
				<input  type="text" id="pincode" name="pincode" value="<%=pcode%>">
			</div>

			<div class="type">
				<label  class="form-label" for="area">Area (in square feet) <span class="ast">*</span></label>
				<input  type="text" id="area" name="area"  value="<%=rs.getString("area")%>">
			</div>

			<div class="type">
				<label  class="form-label" for="rent">Rent(Rs.) <span class="ast">*</span></label>
				<input  type="text" id="rent" name="rent"  value="<%=rs.getString("rent")%>">
			</div>

			<div class="type">
				<label  class="form-label" for="deposit">Deposit <span class="ast">*</span></label>
				<input  id="deposit" type="text" name="deposit"  value="<%=rs.getString("deposit")%>">
			</div>

			<div class="type">
				<label class="form-label"  for="date">Available Date <span class="ast">*</span></label>
				<input  name="date" id="date" type="text" onfocus="(this.type='date')" value="<%=rs.getString("a_data")%>" onblur="if(!this.value)this.type='text'">
			</div>

         <div class="type">
				<label  class="form-label" for="desc">Property Description<span class="ast">*</span></label>
				<input  type="text" style="height:100px; padding-top:0px;" id="desc" name="desc" value="<%=rs.getString("p_desc")%>">
			</div>
         

 			<div class="type">
 				<label class="form-label" for="file">	Upload Images <span class="ast">*</span></label>
				<div class="uploadBox" draggable="false">
				<div class="file-input">
					  <input type="file" style="visibility: hidden" class="file1" id="file1" name="file1"  accept="image/pjpeg, image/jpeg, image/gif, image/x-png, image/x-citrix-pjpeg, image/jpg, image/png" onchange="javascript:updateList1()">
					  <label for="file1">Select file 1</label>
				</div>

			   	<p style="margin: 0;">Selected file:</p>
	              <input type="text" id="filetext1" name="filetext1" style="position:relative; left:30px; width:200px;" value="<%=rs.getString("url1")%>">
                	   <div class="file-input">
					  <input type="file" style="visibility: hidden" class="file2" id="file2" name="file2"  accept="image/pjpeg, image/jpeg, image/gif, image/x-png, image/x-citrix-pjpeg, image/jpg, image/png" onchange="javascript:updateList2()">
					  <label for="file2">Select file 2</label>
					</div>

				<p style="margin:0;">Selected file: </p>
	                  <input type="text" id="filetext2" name="filetext2" style="position:relative; left:30px; width:200px;" value="<%=rs.getString("url2")%>">
                	  <div class="file-input">
					  <input type="file" style="visibility: hidden"  class="file3" id="file3" name="file3"  accept="image/pjpeg, image/jpeg, image/gif, image/x-png, image/x-citrix-pjpeg, image/jpg, image/png"  onchange="javascript:updateList3()">
					  <label for="file3">Select file 3</label>
				</div>

				<p style="margin: 0;">Selected file:</p>
	              <input type="text" id="filetext3" name="filetext3" style="position:relative; left:30px; width:200px;" value="<%=rs.getString("url3")%>">
                 
				</div>
			</div>
   

		<input type="submit"  value="Update Changes" class="btn btn-primary btn-lg" >
		</form>
	</section>

   <%
	  
	}
	catch(Exception e)
	{
	  System.out.println(e.getMessage());
	}
	%>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
 
  


</body>
</html>