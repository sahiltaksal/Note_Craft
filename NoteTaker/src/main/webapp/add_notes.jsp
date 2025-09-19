<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_jsp_css.jsp" %>  
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container-fluid">
    <%@include file="navbar.jsp" %>
</div>

<div class="container mt-5">
    <div class="card shadow-lg p-4 rounded-4 border-0">
        <h2 class="text-center text-primary mb-4">📝 Add a New Note</h2>

        <form action="savenoteservlet" method="post">
          <!-- Note Title -->
          <div class="mb-3">
            <label for="title" class="form-label fw-bold">Note Title</label>
            <input required 
                   type="text" 
                   name="title"
                   class="form-control form-control-lg" 
                   id="title" 
                   placeholder="Enter note title">
          </div>

          <!-- Note Content -->
          <div class="mb-3">
            <label for="content" class="form-label fw-bold">Note Content</label>
            <textarea required 
                      name="content"
                      class="form-control form-control-lg" 
                      id="content" 
                      rows="6"
                      placeholder="Write your note here..."></textarea>
          </div>

          <!-- Submit Button -->
          <div class="text-center mt-4">
             <button type="submit" class="btn btn-primary btn-lg px-5">
                 <i class="bi bi-plus-circle"></i> Add Note
             </button>
          </div>
        </form>
    </div>
</div>
</body>
</html>
