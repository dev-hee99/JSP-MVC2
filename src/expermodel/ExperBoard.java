package expermodel;

import java.util.Date;

public class ExperBoard {
	private int num;	//글 번호
	private int readcnt; // 조회수
	private int recom;  // 추천수
	// 게시판종류 1.자유게시판 2.정보공유(운동) 3.정보공유(식단)
	private int btype;  
	// 게시글 종류 1.공지사항 2. 일반글
	private int wtype;
	//이메일
	private String email;
	//이름
	private String name;
	//제목
	private String subject;
	//내용
	private String content;
	//파일
	private String file1;
	//날짜
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
