package bidding.Bean;

import java.util.Date;

/* A bean to stire all the details about the items,sellerid,bidderID*/

public class SellerItem {

	private String sellerId;
	private String item;
	private String category;
	private int amount;
	private int timer;
	private String status;
	private String itemId;
	private int maxbid=0;
	private String winBidderId;
	private double profit;
	private double riniProfit;
	
	
	public String getSellerId() {
		return sellerId;
	}
	
	public int getMaxbid() {
		return maxbid;
	}

	public void setMaxbid(int maxbid) {
		this.maxbid = maxbid;
	}

	public String getWinBidderId() {
		return winBidderId;
	}

	public void setWinBidderId(String winBidderId) {
		this.winBidderId = winBidderId;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public double getProfit() {
		return profit;
	}

	public void setProfit(double profit) {
		this.profit = profit;
	}

	public double getRiniProfit() {
		return riniProfit;
	}

	public void setRiniProfit(double riniProfit) {
		this.riniProfit = riniProfit;
	}

	public int getTimer() {
		return timer;
	}
	public void setTimer(int timer) {
		this.timer = timer;
	}
	
		
	
}
