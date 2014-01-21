package com.finThink.security;

/**
 * @author Jasti
 */
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.finThink.order.Order;

@Path("/security")
public class SecurityResource {

	SecurityDAO securityDao = new SecurityDAO();
	


	@GET
	@Produces({ MediaType.APPLICATION_JSON })
	public List<Security> findAll() {
		System.out.println("Incoming request processed");
		return securityDao.findAll();
	}

	@GET @Path("{id}")
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	public Security findById(@PathParam("id") String id) {
		return securityDao.findById(Integer.parseInt(id));
	}
	
	@GET @Path("{id}/trades")
	@Produces({ MediaType.APPLICATION_JSON})
	public List<Order> findTradesBySecurity(@PathParam("id") String secId) {
		return securityDao.findOrdersBySecurity(Integer.parseInt(secId));
	}
	
}
