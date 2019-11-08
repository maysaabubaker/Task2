package form;

import org.apache.struts.action.ActionForm;

public class ARForm extends ActionForm {
	private int tid;
	public void setTid(int tid) {
		this.tid=tid;
	}
	public int getTid() {
		return tid;
	}
	public void reset() {
		tid=0;
	}
}
