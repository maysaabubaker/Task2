package model;

public class Task {
private int tid;	
private String title,summary,status;	
public Task(int tid, String title, String summary, String status) {
setTid(tid);
setTitle(title);
setSummary(summary);
setStatus(status);
}
public void setTid(int tid) {
	this.tid=tid;
}
public int getTid() {
	return tid;
}
public void setTitle(String title) {
	this.title=title;
}
public String getTitle() {
	return title;
}
public void setSummary(String summary) {
	this.summary=summary;
}
public String getSummary() {
	return summary;
}
public void setStatus(String status) {
	this.status=status;
}
public String getStatus() {
	return status;
}
}
