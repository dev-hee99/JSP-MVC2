package expermodel;

import java.util.Date;

public class ExperBoard {
	private int num;	//�� ��ȣ
	private int readcnt; // ��ȸ��
	private int recom;  // ��õ��
	// �Խ������� 1.�����Խ��� 2.��������(�) 3.��������(�Ĵ�)
	private int btype;  
	// �Խñ� ���� 1.�������� 2. �Ϲݱ�
	private int wtype;
	//�̸���
	private String email;
	//�̸�
	private String name;
	//����
	private String subject;
	//����
	private String content;
	//����
	private String file1;
	//��¥
	private Date regdate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getRecom() {
		return recom;
	}
	public void setRecom(int recom) {
		this.recom = recom;
	}
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}
	public int getWtype() {
		return wtype;
	}
	public void setWtype(int wtype) {
		this.wtype = wtype;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
}
