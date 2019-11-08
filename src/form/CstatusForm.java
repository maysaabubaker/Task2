package form;

import org.apache.struts.action.ActionForm;

public class CstatusForm extends ActionForm {
	private String status;
	private int tid;
	public void setStatus(String status) {
	this.status=status;	
	}
	public String getStatus() {
	return status;	
	}
	public void setTid(int tid) {
		this.tid=tid;	
		}
		public int getTid() {
		return tid;	
		}
	public void reset()
	{
	status=null;	
	tid=0;
	}
}
