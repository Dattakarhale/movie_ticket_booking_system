package bigprojectpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 * Servlet implementation class servlet2
 */
@WebServlet("/servlet2")
public class servlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Configuration cfg = new Configuration();
		cfg.configure();
		SessionFactory sf = cfg.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		
		int movieid = Integer.parseInt(request.getParameter("movie_id"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		int seats = Integer.parseInt(request.getParameter("seats"));
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String movietitle = request.getParameter("movie_title");
		String useremail = request.getParameter("useremail");
		
		Ticket t = new Ticket();
		t.setDate(date);
		t.setShowtime(time);
		t.setAmount(amount);
		t.setTmovie_id(movieid);
		t.setTmovie_title(movietitle);
		t.setTseats(seats);
		t.setTemail(useremail);
		
		s.save(t);
		tx.commit();
		
		response.sendRedirect("viewTicket.jsp");
		
	}

	

}
