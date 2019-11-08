package form;

import org.apache.struts.action.ActionForm;

public class AddtForm extends ActionForm {
String title,summary;
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
public void reset()
{
title=null;
summary=null;
}

}
