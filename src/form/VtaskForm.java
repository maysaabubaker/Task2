package form;

import org.apache.struts.action.ActionForm;

public class VtaskForm extends ActionForm {
private int pid;
public void setPid(int pid) {
	this.pid=pid;
}
public int getPid() {
	return pid;
}
public void reset() {
	pid=0;
}
}
