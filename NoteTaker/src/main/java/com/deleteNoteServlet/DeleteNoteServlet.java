package com.deleteNoteServlet;

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

@WebServlet("/DeleteNoteServlet")
public class DeleteNoteServlet<T> extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        int noteId = Integer.parseInt(request.getParameter("noteId"));

        Session s = FactoryProvider.getFactory().openSession();
        Transaction tx = s.beginTransaction();

        T note = s.get((Class<T>) Note.class, noteId);
        if (note != null) {
            s.delete(note);
        }

        tx.commit();
        s.close();

        response.sendRedirect("allnotes.jsp");
    }
}
