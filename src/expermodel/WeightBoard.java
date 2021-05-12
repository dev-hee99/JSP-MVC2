package expermodel;

import java.util.Date;

public class WeightBoard {
	private String email;
	private Date regdate;
	private float weight;
	private float bodyfat;
	private float musclemass;
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
	public float getWeight() {
		return weight;
	}
	public void setWeight(float weight) {
		this.weight = weight;
	}
	public float getBodyfat() {
		return bodyfat;
	}
	public void setBodyfat(float bodyfat) {
		this.bodyfat = bodyfat;
	}
	public float getMusclemass() {
		return musclemass;
	}
	public void setMusclemass(float musclemass) {
		this.musclemass = musclemass;
	}
}
