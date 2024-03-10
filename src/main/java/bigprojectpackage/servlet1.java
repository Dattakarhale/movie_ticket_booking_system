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
 * Servlet implementation class servlet1
 */
@WebServlet("/servlet1")
public class servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Configuration cfg = new Configuration();
		cfg.configure();
		SessionFactory sf = cfg.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		
			
		String mob = request.getParameter("mob");
		
		String uname = request.getParameter("name");
		String uemail = request.getParameter("email");
		String upass = request.getParameter("password");
		
		User u = new User();
		u.setUemail(uemail);
		
		u.setUmobile(mob);
		u.setUname(uname);
		u.setUpassword(upass);
		
		s.save(u);
		tx.commit();
		response.sendRedirect("login.jsp");
	}

	

}
