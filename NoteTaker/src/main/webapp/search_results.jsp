<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.List,com.entites.Note" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
<%@include file="all_jsp_css.jsp"%>
</head>
<body>
<div class="container mt-4">
    <%@include file="navbar.jsp"%>

    <h3>Search Results for "<%= request.getAttribute("searchQuery") %>"</h3>
    <hr>
    
    <%
        List<Note> notes = (List<Note>) request.getAttribute("notes");
        if (notes != null && !notes.isEmpty()) {
            for (Note note : notes) {
    %>
        <div class="card mb-3">
            <div class="card-body">
                <h5 class="card-title"><%= note.getTitle() %></h5>
                <p class="card-text"><%= note.getContent() %></p>
                <small class="text-muted">ID: <%= note.getId() %></small>
            </div>
        </div>
    <%
            }
        } else {
    %>
        <p class="text-muted">No results found for "<%= request.getAttribute("searchQuery") %>".</p>
    <%
        }
    %>
</div>
</body>
</html>
