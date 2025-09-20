package com.searchNoteServlet;

import java.io.IOException;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import com.entites.Note;
import com.helper.FactoryProvider;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchNoteServlet")
public class SearchNoteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String queryText = request.getParameter("query"); // get search input
        
        Session s = FactoryProvider.getFactory().openSession();
        
        // Search notes by title or content
        Query<Note> q = s.createQuery("from Note n where n.title like :x or n.content like :x", Note.class);
        q.setParameter("x", "%" + queryText + "%");
        
        List<Note> list = q.list();
        s.close();

        // Send results to JSP
        request.setAttribute("notes", list);
        request.setAttribute("searchQuery", queryText);
        request.getRequestDispatcher("search_results.jsp").forward(request, response);
    }
}
