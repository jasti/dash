package com.finThink.security;
/**
 * @author Jasti
 */
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Security {

	private long secId;
	private String secName;
	private String ticker;

	public long getSecId() {
		return secId;
	}

	public void setSecId(long secId) {
		this.secId = secId;
	}

	public String getSecName() {
		return secName;
	}

	public void setSecName(String secName) {
		this.secName = secName;
	}

	public String getTicker() {
		return ticker;
	}

	public void setTicker(String ticker) {
		this.ticker = ticker;
	}

}
