package com.finThink.security;


import java.util.Iterator;
import java.util.List;

import com.finThink.order.Order;

public class TestSecurityDao {

	
	public static void main(String[] args) {
		SecurityDAO securityDao = new SecurityDAO();
		
		List<Security> securities = securityDao.findAll();
		
		for (Iterator iterator = securities.iterator(); iterator.hasNext();) {
			Security security = (Security) iterator.next();
			System.out.println("Sec ID : "+security.getSecId() +" Sec Name: " +security.getSecName());
			
		}
		
		// Find Trades for a security
		
	List<Order> orders = securityDao.findOrdersBySecurity(1);
		
		for (Iterator iterator = orders.iterator(); iterator.hasNext();) {
			Order order = (Order) iterator.next();
			System.out.println(order);
			
		}
		
		
	}
}
