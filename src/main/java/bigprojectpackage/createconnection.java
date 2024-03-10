package bigprojectpackage;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class createconnection {

	public static Session getConnection() {
		Configuration cfg = new Configuration();
		cfg.configure();
		SessionFactory sf = cfg.buildSessionFactory();
		Session s = sf.openSession();
		
		return s;
	}
}
