package bigprojectpackage;
import javax.persistence.*;
@Entity
public class Admin {

	@Id
	private String ausername;
	private String apassword;
	
	public String getAusername() {
		return ausername;
	}
	public void setAusername(String ausername) {
		this.ausername = ausername;
	}
	public String getApassword() {
		return apassword;
	}
	public void setApassword(String apassword) {
		this.apassword = apassword;
	}
	
	
}
