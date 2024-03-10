package bigprojectpackage;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class CreateDatabase {

	public static void main(String[] args) {
		
		Configuration cfg = new Configuration();
		cfg.configure();
		SessionFactory sf = cfg.buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		
		Admin ad = new Admin();
		ad.setAusername("admin");
		ad.setApassword("admin");
		
//		Movie m = new Movie();
//		m.setMovie_title("Avenger");
//		m.setMovie_description("A Thrilling story unfolds when the hero unites of the marvel universe");
//		m.setMovie_duration("2h 40m");
//		m.setRating(5);
//		m.setPrice(240);
//		m.setShow1seat(100);
//		m.setShow2seat(100);
//		m.setShow3seat(100);
//		m.setShow1("10:00");
//		m.setShow2("14:00");
//		m.setShow3("20:00");
		
		//User u = new User();
		//u.setUemail("user1");
		
//		Ticket t = new Ticket();
//		t.setDate("17-10-2023");
//		t.setTseats(6);
//		t.setShowtime("10:00");
//		
//		Ticket t2 = new Ticket();
//		t2.setDate("16-10-2023");
//		t2.setTseats(20);
//		t2.setShowtime("14:00");
		
		s.save(ad);
//		s.save(m);
//		s.save(t);
//		s.save(t2);
//		s.save(ad);
		
		tx.commit();

	}

}
