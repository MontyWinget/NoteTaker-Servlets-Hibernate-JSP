<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="com.helper.*,org.hibernate.*,com.entities.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
<%@ include file="all_js_css.jsp" %>
</head>
<body>

	<div class="container">	
    <%@ include file="navbar.jsp" %>
    <br>
    
    <h1>Edit your note</h1>
    <br>
    
    <%
    
    int noteId = Integer.parseInt(request.getParameter("note_id").trim());
    Session ses = FactoryProvider.getFactory().openSession();
	
	Note note = (Note)ses.get(Note.class, noteId);
    
    %>
    
    <form action="EditUpdateServlet" method="post">
    
    	<input value="<%= note.getId() %>" name="noteId" type="hidden" />
	  
	  <div class="mb-3">
	    <label for="title" class="form-label">Note Title</label>
	    
	    <input 
	    name="title"
	    required="required"
	    type="text" 
	    class="form-control"
	    id="title" 
	    aria-describedby="emailHelp"
	    placeholder="Enter title"
	    value="<%= note.getTitle() %>"/>
	  </div>
	  
	  <div class="mb-3">
	    <label for="content" class="form-label">Note Content</label>
	    <textarea 
	    name="content"
	    required="required"
	    id="content"
	    placeholder="Enter you content here"
	    class="form-control"
	    style="height: 300px"
	    ><%= note.getContent() %>
	    </textarea>
	  </div>
	  
	  <div class="container text-center">
	  <button type="submit" class="btn btn-success">Save</button>
	  </div>
	</form>
    
    </div>
   

</body>
</html>