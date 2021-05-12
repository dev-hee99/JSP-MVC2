package expermodel;

import java.util.Date;

public class ExerciseBoard{
	private String email; //이메일 외래키
	private Date regdate; //날짜
	private String part; //부위
	private String ename; // 운동명
	private float weight; // 무게
	private int setnum; // 세트(순서)
	private int count; // 개수
	private int no; //번호
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	public int getSetnum() {
		return setnum;
	}
	public void setSetnum(int setnum) {
		this.setnum = setnum;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
