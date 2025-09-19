package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entites.Note;
import com.helper.FactoryProvider;


@WebServlet("/savenoteservlet")
public class Savenot extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public Savenot() {
        // TODO Auto-generated constructor stub
    }




	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 try {
	            // Get data from form
	            String title = request.getParameter("title");
	            String content = request.getParameter("content");

	            // Create Note object
	            Note note = new Note(title, content, new Date());

	            // Hibernate save
	            Session s = FactoryProvider.getFactory().openSession();
	            Transaction tx = s.beginTransaction();

	            s.save(note);

	            tx.commit();
	            s.close();

	            // Response back
	            response.setContentType("text/html");
	            PrintWriter out = response.getWriter();
	            out.println("<h1 style='text-align:center;'>Note is added successfully!</h1>");
	            out.println("<h2 style='text-align:center;'><a href='allnotes.jsp'>View All Notes</a></h2>");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}
	
	
	

}
