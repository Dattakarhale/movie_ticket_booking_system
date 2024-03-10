package bigprojectpackage;
import javax.persistence.*;
@Entity
public class User {
	@Id
	private String uemail;
	private String uname;
	private String umobile;
	private String upassword;
	
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUmobile() {
		return umobile;
	}
	public void setUmobile(String mob) {
		this.umobile = mob;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
}
