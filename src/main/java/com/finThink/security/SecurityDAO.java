package com.finThink.security;
/**
 * @author Jasti
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.finThink.order.Order;
import com.finThink.util.ConnectionHelper;

public class SecurityDAO {

	public List<Security> findAll() {
		List<Security> list = new ArrayList<Security>();
		Connection c = null;
		String sql = "SELECT * FROM Security as s ";

		try {
			c = ConnectionHelper.getConnection();
			Statement s = c.createStatement();
			ResultSet rs = s.executeQuery(sql);
			while (rs.next()) {
				list.add(processSecurityRow(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			ConnectionHelper.close(c);
		}
		return list;
	}

	public Security findById(int parseInt) {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Order> findOrdersBySecurity(int id) {
		List<Order> list = new ArrayList<Order>();
		Connection c = null;
		String sql = "SELECT o.* FROM Security as s, mydb.Order as o where s.sec_id = o.sec_id and s.sec_id = ? ";

		try {
			c = ConnectionHelper.getConnection();
			Statement s = c.createStatement();
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				list.add(processOrderRow(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			ConnectionHelper.close(c);
		}
		return list;

	}

	protected Security processSecurityRow(ResultSet rs) throws SQLException {
		Security security = new Security();
		security.setSecId(rs.getInt("SEC_ID"));
		security.setSecName(rs.getString("SEC_NAME"));

		return security;
	}

	protected Order processOrderRow(ResultSet rs) throws SQLException {
		Order order = new Order();
		order.setOrderId(rs.getInt("ORDER_ID"));
		order.setTransType(rs.getString("TRANS_TYPE"));
		order.setSecId(rs.getInt("SEC_ID"));
		order.setStatus(rs.getString("STATUS"));
		order.setTradeDate(rs.getDate("TRADE_DATE"));

		return order;
	}

}
