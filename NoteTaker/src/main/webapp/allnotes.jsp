<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List,org.hibernate.Session,org.hibernate.query.Query,com.entites.Note,com.helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes</title>
<%@include file="all_jsp_css.jsp"%>
<style>
    body {
    
        background-color: #f8f9fa;
    }
    .card {
        border-radius: 15px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        transition: transform 0.2s;
    }
    .card:hover {
        transform: scale(1.02);
    }
    .delete-btn {
        float: right;
    }
</style>
</head>
<body>

<div class="container mt-4">
    <%@include file="navbar.jsp"%>
    <h2 class="mb-4 text-center">All Notes</h2>

    <div class="row">
        <div class="col-12">

            <%
                Session s = FactoryProvider.getFactory().openSession();
                Query<Note> q = s.createQuery("from Note", Note.class);
                List<Note> list = q.list();
                for (Note note : list) {
            %>
                <div class="card mb-3">
                    <div class="card-body">
                        <h5 class="card-title"><%= note.getTitle() %></h5>
                        <p class="card-text"><%= note.getContent() %></p>
                        <small class="text-muted">ID: <%= note.getId() %></small>
                        
                        <!-- Delete Button -->
                        <form action="DeleteNoteServlet" method="post" class="delete-btn">
                            <input type="hidden" name="noteId" value="<%= note.getId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </div>
                </div>
            <%
                }
                s.close();
            %>

        </div>
    </div>
</div>

</body>
</html>
