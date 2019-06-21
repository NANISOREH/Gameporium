package Model;
import Beans.Bean;
import Beans.BeanPagamento;
import java.sql.Connection;
import java.sql.Date;
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

	private static final String TABLE_NAME = "pagamento";

	@Override
	public synchronized void doSave(Bean pagamento) throws SQLException {
		BeanPagamento c= (BeanPagamento) pagamento;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + PagamentoModel.TABLE_NAME
				+ " (codiceP,numCarta,cvv,circuito,scadenza) VALUES (?, ?, ?, ?, ?,?)";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, c.getCodiceP());
			preparedStatement.setInt(2, c.getNumCarta());
			preparedStatement.setInt(3, c.getCvv());
			preparedStatement.setString(4, c.getCircuito());
			preparedStatement.setString(5, c.getScadenza());
			preparedStatement.executeUpdate();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
		}
	}

	@Override
	public synchronized BeanPagamento doRetrieveByKey(Object key) throws SQLException {
		
		int codiceP= (int) key;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanPagamento bean = new BeanPagamento();

		String selectSQL = "SELECT * FROM " + PagamentoModel.TABLE_NAME + " WHERE codiceP = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, codiceP);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCodiceP(rs.getInt("codiceP"));
				bean.setNumCarta((rs.getInt("numCarta")));
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

		String deleteSQL = "DELETE FROM " + PagamentoModel.TABLE_NAME + " WHERE codiceP = ?";

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

				bean.setCodiceP(rs.getInt("codiceP"));
				bean.setNumCarta((rs.getInt("numCarta")));
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
	}

