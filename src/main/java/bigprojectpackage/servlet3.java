package bigprojectpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;



/**
 * Servlet implementation class servlet3
 */
@WebServlet("/servlet3")
public class servlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Session s = createconnection.getConnection();
		Transaction tx = s.beginTransaction();
		
		try {
			String submit = request.getParameter("submit");
			if (submit.equals("add")) {
				
				int price = Integer.parseInt(request.getParameter("movie_price"));
				int rating = Integer.parseInt(request.getParameter("movie_rating"));
				int show1seat = Integer.parseInt(request.getParameter("show1seat"));
				int show2seat = Integer.parseInt(request.getParameter("show2seat"));
				int show3seat = Integer.parseInt(request.getParameter("show3seat"));
				String movie_title = request.getParameter("movie_name");
				String movie_description = request.getParameter("movie_description");
				String movie_duration = request.getParameter("movie_duration");
				String show1 = request.getParameter("show1time");
				String show2 = request.getParameter("show2time");
				String show3 = request.getParameter("show3time");
				Movie m = new Movie();
				m.setMovie_title(movie_title);
				m.setMovie_description(movie_description);
				m.setMovie_duration(movie_duration);
				m.setRating(rating);
				m.setPrice(price);
				m.setShow1(show1);
				m.setShow2(show2);
				m.setShow3(show3);
				m.setShow1seat(show1seat);
				m.setShow2seat(show2seat);
				m.setShow3seat(show3seat);
				s.save(m);
				tx.commit();
				response.sendRedirect("adminhome.jsp");
				
			}
			
		} catch (Exception e) {
			
		}
		
		try {
			int update=0;
			update = Integer.parseInt(request.getParameter("update"));
			
			if (update != 0) {
				
				int price = Integer.parseInt(request.getParameter("movie_price"));
				int rating = Integer.parseInt(request.getParameter("movie_rating"));
				int show1seat = Integer.parseInt(request.getParameter("show1seat"));
				int show2seat = Integer.parseInt(request.getParameter("show2seat"));
				int show3seat = Integer.parseInt(request.getParameter("show3seat"));
				String movie_title = request.getParameter("movie_name");
				String movie_description = request.getParameter("movie_description");
				String movie_duration = request.getParameter("movie_duration");
				String show1 = request.getParameter("show1time");
				String show2 = request.getParameter("show2time");
				String show3 = request.getParameter("show3time");
				
				Query q = s.createQuery("from Movie where movie_id=:id");
				q.setParameter("id", update);
				Movie m = (Movie)q.uniqueResult();
				m.setMovie_title(movie_title);
				m.setMovie_description(movie_description);
				m.setMovie_duration(movie_duration);
				m.setRating(rating);
				m.setPrice(price);
				m.setShow1(show1);
				m.setShow2(show2);
				m.setShow3(show3);
				m.setShow1seat(show1seat);
				m.setShow2seat(show2seat);
				m.setShow3seat(show3seat);
				s.update(m);
				tx.commit();
				response.sendRedirect("adminhome.jsp");
				
			}
			
		} catch (Exception e) {
			
		}
		
		
		try {
			int delete=0;
			delete = Integer.parseInt(request.getParameter("delete"));
			if (delete != 0) {
				
				Query q = s.createQuery("from Movie where movie_id=:id");
				q.setParameter("id", delete);
				Movie m = (Movie)q.uniqueResult();
				s.delete(m);
				tx.commit();
				response.sendRedirect("adminhome.jsp");
			}
		} catch (Exception e) {
			
		}
		
	}


}
