package global.sesoc.project.vo;

public class MemberVO {
	private String id = "";
	private String password = "";
	private String nickName = "";
	private int cert = 0;
	
	public MemberVO() {
		super();
	}

	public MemberVO(String id, String password, String nickName, int cert) {
		super();
		this.id = id;
		this.password = password;
		this.nickName = nickName;
		this.cert = cert;
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

	public int getCert() {
		return cert;
	}

	public void setCert(int cert) {
		this.cert = cert;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", nickName=" + nickName + ", cert=" + cert + "]";
	}
	
	
}
