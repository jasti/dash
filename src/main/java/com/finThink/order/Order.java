package com.finThink.order;

/**
 * @author Jasti
 */
import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Order {

	private long orderId;
	private String transType;
	private long secId;
	private String status;
	private Date TradeDate;

	public long getOrderId() {
		return orderId;
	}

	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}

	public String getTransType() {
		return transType;
	}

	public void setTransType(String transType) {
		this.transType = transType;
	}

	public long getSecId() {
		return secId;
	}

	public void setSecId(long secId) {
		this.secId = secId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getTradeDate() {
		return TradeDate;
	}

	public void setTradeDate(Date tradeDate) {
		TradeDate = tradeDate;
	}

}
