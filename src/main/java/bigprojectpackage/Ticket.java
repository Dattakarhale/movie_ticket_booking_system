package bigprojectpackage;
import javax.persistence.*;
@Entity
public class Ticket {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int ticket_id;
	private String temail;
	private int tmovie_id;
	private String tmovie_title;
	private int amount;
	private String Date;
	private int tseats;
	private String showtime;
	
	
	public int getTicket_id() {
		return ticket_id;
	}
	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}
	public String getTemail() {
		return temail;
	}
	public void setTemail(String temail) {
		this.temail = temail;
	}
	public int getTmovie_id() {
		return tmovie_id;
	}
	public void setTmovie_id(int tmovie_id) {
		this.tmovie_id = tmovie_id;
	}
	public String getTmovie_title() {
		return tmovie_title;
	}
	public void setTmovie_title(String tmovie_title) {
		this.tmovie_title = tmovie_title;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public int getTseats() {
		return tseats;
	}
	public void setTseats(int tseats) {
		this.tseats = tseats;
	}
	public String getShowtime() {
		return showtime;
	}
	public void setShowtime(String showtime) {
		this.showtime = showtime;
	}
	

}
