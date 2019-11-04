package form;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
public class LoginForm extends ActionForm {
	private String username,password = null;
	public String getUsername() {
	return (username);
	}
	public void setUsername(String username) {
	this.username = username;
	System.out.println("username form"+username);
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password=password;
		System.out.println("password form"+password);

	}
	public void reset(ActionMapping mapping,
	HttpServletRequest request) {
	this.username = null;
	this.password=null;
	}
}
