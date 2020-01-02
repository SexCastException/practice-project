package cn.huazai123.maven.web.entity;

import java.math.BigDecimal;

public class Pay {
	private String outTradeNo; // 商户订单号，商户网站订单系统中唯一订单号，必填
	private BigDecimal totalAmount; // 付款金额，必填
	private String subject; // 订单名称，必填
	private String body; // 商品描述
	private String productCode = "FAST_INSTANT_TRADE_PAY"; // 商品码
	private String timeoutExpress; // 自定义超时时间参数

	public String getOutTradeNo() {
		return outTradeNo;
	}

	public void setOutTradeNo(String outTradeNo) {
		this.outTradeNo = outTradeNo;
	}

	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public String getTimeoutExpress() {
		return timeoutExpress;
	}

	public void setTimeoutExpress(String timeoutExpress) {
		this.timeoutExpress = timeoutExpress;
	}

}
