package Model;
import Beans.Bean;
import Beans.BeanPagamento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PagamentoModel implements Model {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/GameporiumDB");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "metodoPagamento";

	public synchronized void customDoSave(Bean pagamento, String username) throws SQLException {
		BeanPagamento c= (BeanPagamento) pagamento;
		System.out.println(c);
		Connection connection = null;
		PreparedStatement entStatement = null;
		PreparedStatement relStatement = null;

		String insertSQL = "INSERT INTO " + PagamentoModel.TABLE_NAME
				+ " (circuito,numCarta,cvv,scadenza) VALUES (?, ?, ?, ?)";
		
		String insertRel = "INSERT INTO possiede(username,numCarta) VALUES (?, ?)";
		
		try {
			connection = ds.getConnection();
			entStatement = connection.prepareStatement(insertSQL);
			entStatement.setString(1, c.getCircuito());
			entStatement.setLong(2, c.getNumCarta());
			entStatement.setInt(3, c.getCvv());
			entStatement.setString(4, c.getScadenza());
			entStatement.executeUpdate();
			
			relStatement = connection.prepareStatement(insertRel);
			relStatement.setString(1, username);
			relStatement.setLong(2, c.getNumCarta());
			relStatement.executeUpdate();
			
			connection.commit();
		} finally {
			try {
				if (entStatement != null && relStatement!= null)
					entStatement.close();
				relStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	@Override
	public synchronized BeanPagamento doRetrieveByKey(Object key) throws SQLException {
		
		int CodiceMetodo= (int) key;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanPagamento bean = new BeanPagamento();

		String selectSQL = "SELECT * FROM " + PagamentoModel.TABLE_NAME + " WHERE numCarta = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, CodiceMetodo);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setNumCarta((rs.getLong("numCarta")));
				bean.setCvv(rs.getInt("cvv"));
				bean.setCircuito(rs.getString("circuito"));
				bean.setScadenza(rs.getString("scadenza"));
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return bean;
	}
	

	@Override
	public synchronized boolean doDelete(Object codice) throws SQLException {
		
		int code=(int) codice;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + PagamentoModel.TABLE_NAME + " WHERE numCarta = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, code);

			result = preparedStatement.executeUpdate();

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return (result != 0);
	}

	@Override
	public synchronized Collection<Bean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Bean> Pagamento = new LinkedList<Bean>();

		String selectSQL = "SELECT * FROM " + PagamentoModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanPagamento bean = new BeanPagamento();

				bean.setNumCarta((rs.getLong("numCarta")));
				bean.setCvv(rs.getInt("cvv"));
				bean.setCircuito(rs.getString("circuito"));
				bean.setScadenza(rs.getString("scadenza"));
				Pagamento.add(bean);
			}

		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
		return Pagamento;
	}

	public synchronized Collection<Bean> doRetrieveByUser(String user) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Bean> Pagamento = new LinkedList<Bean>();

		String selectSQL = "SELECT * FROM " + PagamentoModel.TABLE_NAME +" as p JOIN possiede as po on p.numCarta=po.numCarta WHERE username=?";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, user);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				BeanPagamento bean = new BeanPagamento();

				bean.setCircuito(rs.getString("circuito"));
				bean.setNumCarta(rs.getLong("numCarta"));
				bean.setCvv(rs.getInt("cvv"));
				bean.setScadenza(rs.getString("scadenza"));
				Pagamento.add(bean);
			}
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
	}
		System.out.println(Pagamento);
		return Pagamento;
	}

	@Override
	public void doSave(Bean bean) throws SQLException {
		// TODO Auto-generated method stub
		
	}
}

