package com.jsp.pj1.dto;

public class PDto {
	public String creditCardFirm;
	public String bank;
	public String easyPay;
	
	public String account;
	public String cardNumber;
	public String inval;
	public String cvc;
	public String pwd;
	public String installment;
	public int withdraw;
	public String email;
	public String customer_name;
	public String tell;
	public int distance;
	
	
	public PDto (String creditCardFirm, String bank, String easyPay,
			String account, String cardNumber,  String inval, String cvc, 
			String pwd, String installment, int withdraw, String email, 
			String customer_name, String tell, int distance ) {
		
		this.creditCardFirm = creditCardFirm;
		this.bank = bank;
		this.easyPay = easyPay;
		this.account = account;
		this.cardNumber = cardNumber;
		this.inval = inval;
		this.cvc = cvc;
		this.pwd = pwd;
		this.installment = installment;
		this.withdraw = withdraw;
		this.email = email;
		this.customer_name = customer_name;
		this.tell = tell;
		this.distance = distance;	
	}
	
	
	public String getCreditCardFirm() {
		return creditCardFirm;
	}
	public void setCreditCardFirm(String creditCardFirm) {
		this.creditCardFirm = creditCardFirm;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getEasyPay() {
		return easyPay;
	}
	public void setEasyPay(String easyPay) {
		this.easyPay = easyPay;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getInval() {
		return inval;
	}
	public void setInval(String inval) {
		this.inval = inval;
	}
	public String getCvc() {
		return cvc;
	}
	public void setCvc(String cvc) {
		this.cvc = cvc;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getInstallment() {
		return installment;
	}
	public void setInstallment(String installment) {
		this.installment = installment;
	}
	public int getWithdraw() {
		return withdraw;
	}
	public void setWithdraw(int withdraw) {
		this.withdraw = withdraw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setUsername(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public int getDistance() {
		return distance;
	}
	public void setDistance(int distance) {
		this.distance = distance;
	}
	
	
	
	

}
