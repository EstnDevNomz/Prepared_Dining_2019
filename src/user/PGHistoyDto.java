package user;

import java.sql.Timestamp;

public class PGHistoyDto {
	private Timestamp paymentDate;
	private String email;
	private String phone;
	private String withdraw;
	private String card;
	private String cdn;
	private String name;
	private String intallment;
	
	
	public Timestamp getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Timestamp paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getWithdraw() {
		return withdraw;
	}
	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getCdn() {
		return cdn;
	}
	public void setCdn(String cdn) {
		this.cdn = cdn;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntallment() {
		return intallment;
	}
	public void setIntallment(String intallment) {
		this.intallment = intallment;
	}
	
	

}
