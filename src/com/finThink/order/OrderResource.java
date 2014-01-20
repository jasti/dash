package com.finThink.order;

/**
 * @author Jasti
 */

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

@Path("/trades")
public class OrderResource {

	OrderDAO tradeDao = new OrderDAO();
	
	
	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public String hello() {
		return "{Hello : World}";
	}

	@GET @Path("{id}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Order findById(@PathParam("id") String id) {
		return tradeDao.findById(Integer.parseInt(id));
	}
	
 
	
}
