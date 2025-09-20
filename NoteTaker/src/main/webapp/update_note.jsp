<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="org.hibernate.Session,com.entites.Note,com.helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Note</title>
<%@include file="all_jsp_css.jsp"%>
</head>
<body>
<div class="container mt-4">
    <%@include file="navbar.jsp"%>

    <%
        int noteId = Integer.parseInt(request.getAttribute("noteId").toString());
        Session s = FactoryProvider.getFactory().openSession();
        Note note = s.get(Note.class, noteId);
        s.close();
    %>

    <h2 class="mb-4 text-center">Update Note</h2>

    <form action="UpdateNoteServlet" method="post">
        <input type="hidden" name="noteId" value="<%= note.getId() %>">
        <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text" class="form-control" name="title" value="<%= note.getTitle() %>" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Content</label>
            <textarea class="form-control" name="content" rows="5" required><%= note.getContent() %></textarea>
        </div>
        <button type="submit" class="btn btn-success">Update Note</button>
    </form>
</div>
</body>
</html>
