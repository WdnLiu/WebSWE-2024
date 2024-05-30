package models;
import java.sql.Timestamp;

public class Tweet implements java.io.Serializable {

	 private static final long serialVersionUID = 1L;

	 private int id;
	 private int uid;
	 private int pid = 0;
	 private Timestamp postDateTime;
	 private String title;
	 private String content;

	 public Tweet() {
	 }

	 public Integer getId() {
		 return this.id;
	 }
	 
	 public void setId(Integer id) {
		 this.id = id;
	 }

	 public int getUid() {
		 return this.uid;
	 }
	 
	 public void setUid(int uid) {
		 this.uid = uid;
	 }
	 
	 public String getTitle() {
		 return this.title;
	 }
	 
	 public void setTitle(String title) {
		 this.title = title;
	 }
	 
	 public Timestamp getPostDateTime() {
		 return this.postDateTime;
	 }
	 public void setPostDateTime(Timestamp postDateTime) {
		 this.postDateTime = postDateTime;
	 }
	 
	 public String getContent() {
		 return this.content;
	 }
	 public void setContent(String content) {
		 this.content = content;
	 }

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

}