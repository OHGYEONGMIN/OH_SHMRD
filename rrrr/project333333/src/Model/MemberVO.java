package Model;

public class MemberVO {
	private String num,id,pw,name,sex,tel,addr,mail,room;
	//-----------------------------------회원가입 용 --------------------------------------------------
	public MemberVO(String id, String pw, String name, String sex, String tel, String addr, String mail, String room) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.sex = sex;
		this.tel = tel;
		this.addr = addr;
		this.mail = mail;
		this.room = room;
	}
//-----------------------------------회원가입 용 --------------------------------------------------
//-----------------------------------회원 리스트 뷰 용 ------------------------------------
    
	public MemberVO(String num,String id, String pw, String name, String sex, String tel, String addr, String mail, String room) {
		
		this.num = num;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.sex = sex;
		this.tel = tel;
		this.addr = addr;
		this.mail = mail;
		this.room = room;
	}
	//-----------------------------------게터 세터------------------------------------------------
	
	public String getNum() {
		return num;
	}
	
	public void setNum(String num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	
	//-----------------------------------게터 세터------------------------------------------------
	

}
