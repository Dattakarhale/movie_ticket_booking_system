package bigprojectpackage;
import javax.persistence.*;
@Entity
public class Movie {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int movie_id;
	private String movie_title;
	private String movie_description;
	private String movie_duration;
	private int rating;
	private String show1;
	private String show2;
	private String show3;
	private int show1seat;
	private int show2seat;
	private int show3seat;
	private int price;
	
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_description() {
		return movie_description;
	}
	public void setMovie_description(String movie_description) {
		this.movie_description = movie_description;
	}
	public String getMovie_duration() {
		return movie_duration;
	}
	public void setMovie_duration(String movie_duration) {
		this.movie_duration = movie_duration;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getShow1() {
		return show1;
	}
	public void setShow1(String show1) {
		this.show1 = show1;
	}
	public String getShow2() {
		return show2;
	}
	public void setShow2(String show2) {
		this.show2 = show2;
	}
	public String getShow3() {
		return show3;
	}
	public void setShow3(String show3) {
		this.show3 = show3;
	}
	public int getShow1seat() {
		return show1seat;
	}
	public void setShow1seat(int show1seat) {
		this.show1seat = show1seat;
	}
	public int getShow2seat() {
		return show2seat;
	}
	public void setShow2seat(int show2seat) {
		this.show2seat = show2seat;
	}
	public int getShow3seat() {
		return show3seat;
	}
	public void setShow3seat(int show3seat) {
		this.show3seat = show3seat;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}

