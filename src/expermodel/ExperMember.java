package expermodel;

public class ExperMember {
	private String email;
	private String pass;
	private String name;
	private float weight;
	private float height;
	private float chgweight;
	private String pwque;
	private String pwans;
	private int gender;
	private String picture;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	public float getHeight() {
		return height;
	}
	
	public String getPwque() {
		return pwque;
	}
	public void setPwque(String pwque) {
		this.pwque = pwque;
	}
	public String getPwans() {
		return pwans;
	}
	public void setPwans(String pwans) {
		this.pwans = pwans;
	}
	public void setHeight(float height) {
		this.height = height;
	}
	
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	
	public float getChgweight() {
		return chgweight;
	}
	public void setChgweight(float chgweight) {
		this.chgweight = chgweight;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
}
