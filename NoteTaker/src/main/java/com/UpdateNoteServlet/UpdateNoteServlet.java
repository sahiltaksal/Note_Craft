package com.UpdateNoteServlet;

import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.entites.Note;
import com.helper.FactoryProvider;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateNoteServlet")
public class UpdateNoteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Step 1: Forward user to update_note.jsp form with noteId
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int noteId = Integer.parseInt(request.getParameter("noteId"));
        request.setAttribute("noteId", noteId);
        request.getRequestDispatcher("update_note.jsp").forward(request, response);
    }

    // Step 2: Handle form submission and update the note
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int noteId = Integer.parseInt(request.getParameter("noteId"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        Session s = FactoryProvider.getFactory().openSession();
        Transaction tx = s.beginTransaction();

        Note note = s.get(Note.class, noteId);
        if (note != null) {
            note.setTitle(title);
            note.setContent(content);
            s.update(note);
        }

        tx.commit();
        s.close();

        response.sendRedirect("allnotes.jsp");
    }
}
