package readinglog;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {
	String mem_id, mem_pw, mem_name, mem_gender, mem_birth, mem_phone, mem_email, mem_regtime;

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getMem_regtime() {
		return mem_regtime;
	}

	public void setMem_regtime(String mem_regtime) {
		this.mem_regtime = mem_regtime;
	}

	
	@Override
	public String toString() {
		return "MemberDTO [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_gender="
				+ mem_gender + ", mem_birth=" + mem_birth + ", mem_phone=" + mem_phone + ", mem_email=" + mem_email
				+ ", mem_regtime=" + mem_regtime + "]";
	}
	
}