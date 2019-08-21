package global.sesoc.project.vo;

public class MemberVO {
	private String id = "";
	private String password = "";
	private String nickName = "";
	private String cert = "";
	private String payment = "";
	public MemberVO() {
		super();
	}
	public MemberVO(String id, String password, String nickName, String cert, String payment) {
		super();
		this.id = id;
		this.password = password;
		this.nickName = nickName;
		this.cert = cert;
		this.payment = payment;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getCert() {
		return cert;
	}
	public void setCert(String cert) {
		this.cert = cert;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", nickName=" + nickName + ", cert=" + cert
				+ ", payment=" + payment + "]";
	}

	
	
}
