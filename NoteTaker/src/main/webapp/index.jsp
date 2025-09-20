<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Note Taker: Home Page</title>
    <%@include file="all_jsp_css.jsp" %>
    <style>
      body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f0f2f5;
        margin: 0;
        padding: 0;
      }

      /* Hero Section */
      .hero {
        background: linear-gradient(135deg, #6a11cb, #2575fc);
        color: #fff;
        padding: 100px 20px;
        text-align: center;
        border-radius: 0 0 50% 50% / 0 0 10% 10%;
      }

      .hero h1 {
        font-size: 3rem;
        margin-bottom: 20px;
        text-shadow: 2px 2px 8px rgba(0,0,0,0.3);
      }

      .hero p {
        font-size: 1.2rem;
        margin-bottom: 40px;
      }

      .hero .btn {
        margin: 10px;
        padding: 12px 25px;
        font-size: 1rem;
        border-radius: 30px;
        transition: transform 0.3s, box-shadow 0.3s;
      }

      .hero .btn:hover {
        transform: scale(1.1);
        box-shadow: 0 8px 20px rgba(0,0,0,0.3);
      }

      /* Feature Cards */
      .features {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        margin: 50px 0;
        gap: 20px;
      }

      .card-feature {
        background: #fff;
        padding: 30px 20px;
        border-radius: 20px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        width: 250px;
        text-align: center;
        transition: transform 0.3s, box-shadow 0.3s;
      }

      .card-feature:hover {
        transform: translateY(-10px);
        box-shadow: 0 12px 30px rgba(0,0,0,0.15);
      }

      .card-feature h3 {
        margin-bottom: 15px;
        color: #2575fc;
      }

      .card-feature p {
        font-size: 0.95rem;
        color: #555;
      }

      @media (max-width: 768px) {
        .hero h1 { font-size: 2.2rem; }
        .features { flex-direction: column; align-items: center; }
      }
    </style>
  </head>

  <body>
    <%@include file="navbar.jsp" %>

    <!-- Hero Section -->
    <section class="hero">
      <h1>Welcome to NoteCraft</h1>
      <p>Your personal space to create, update, and manage notes efficiently.</p>
      <a href="add_notes.jsp" class="btn btn-light text-primary">Add Note</a>
      <a href="allnotes.jsp" class="btn btn-outline-light">View Notes</a>
    </section>

    <!-- Feature Cards -->
    <section class="features">
      <div class="card-feature">
        <h3>Create Notes</h3>
        <p>Add new notes with title and content. Organize your thoughts quickly and efficiently.</p>
      </div>
      <div class="card-feature">
        <h3>Update Notes</h3>
        <p>Edit your existing notes anytime. Keep your information accurate and up-to-date.</p>
      </div>
      <div class="card-feature">
        <h3>Delete Notes</h3>
        <p>Remove old or unwanted notes with ease. Maintain a clean and organized workspace.</p>
      </div>
    </section>
  </body>
</html>
