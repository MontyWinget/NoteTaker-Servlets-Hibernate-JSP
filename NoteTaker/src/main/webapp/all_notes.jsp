<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>

<%@ include file="all_js_css.jsp" %>

</head>
<body>

	<div class="container">
	
	<%@ include file="navbar.jsp" %>
		<br>
		<h1>All Notes</h1>
		
		<div class="row">
		<div class="col-12">
		
		<%
		
		Session showNotesSession  = FactoryProvider.getFactory().openSession();
		Query q = showNotesSession.createQuery("from Note");
		List<Note> list = q.list();
		
		for(Note note : list){
			
		%>
		 
		<div class="card mt-3">
	  	<!-- <img class="card-img-top m-4" style="max-width:100px" src="img/note.png" alt="Card image cap"> -->
	  		<div class="card-body px-4">
	    	<h5 class="card-title"><%= note.getTitle() %></h5>
	    	<p class="card-text">
	    	<%= note.getContent() %>
	    	</p>
	    	<h6 class="text-primary" style="text-align:right"><%= note.getAddedDate() %></h6>
	    	<div class="container text-center mt-2">
	    	<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
	    	<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
	    	</div>
	  		</div>
		</div>
		 
		<%		
		}
		
		showNotesSession.close();	
		%>
		
		</div>
		</div>
		
		
	
	</div>

</body>
</html>