package form;

import org.apache.struts.action.ActionForm;

public class AddeForm extends ActionForm {
private String username;private String password;
private String fname;private String lname;private String address;
private String email;private String phone;
private int level;
public void setUsername(String username) {
this.username=username;	
}
public void setPassword(String password) {
this.password=password;	
}
public void setEmail(String email) {
this.email=email;	
}
public void setAddress(String address) {
this.address=address;	
}
public void setLname(String lname) {
this.lname=lname;	
}
public void setFname(String fname) {
this.fname=fname;
}
public void setPhone(String phone) {
this.phone=phone;
}

public String getPhone() {
return phone;	
}
public String getEmail() {
return email;	
}
public String getAddress() {
return address;	
}
public String getLname() {
return lname;	
}
public String getFname() {
	return fname;
}
public String getUsername() {
	return username;
}
public String getPassword() {
	return password;
}

public void setLevel(int level) {
this.level=level;
}
public int getLevel(){
     return level;	
}
public void reset() {
	username=null;
	password=null;
	fname=null;
	lname=null;
	address=null;
	email=null;
	phone=null;
	level=0;	
}

}
