package form;

import org.apache.struts.action.ActionForm;

public class AssignForm extends ActionForm {
	private int aid;
	private String title;
	private String summary;
	public void setAid(int aid) {
		System.out.println(aid);
		this.aid=aid;
	}
	public int getAid() {
		return aid;
	}
	public void setTitle(String title) {
		this.title=title;
	}
	public String getTitle()
	{
	return title;	
	}
	public void setSummary(String summary)
	{
	this.summary=summary;
	}
	public String getSummary()
	{
		return summary;
	}
	
	public void reset() {
		aid=0;
		title="";
		summary="";
	}
}
