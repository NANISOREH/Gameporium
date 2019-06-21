package Model;
import Beans.Bean;
import Beans.BeanIndirizzo;
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

public class IndirizzoModel implements Model {

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

	private static final String TABLE_NAME = "indirizzo";

	@Override
	public synchronized void doSave(Bean indirizzo) throws SQLException {
		BeanIndirizzo c=(BeanIndirizzo) indirizzo;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + IndirizzoModel.TABLE_NAME
				+ " (codiceInridizzo,via,civico,citta,cap) VALUES (?, ?, ?, ?, ?)";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, c.getCodiceIndirizzo());
			preparedStatement.setString(2, c.getVia());
			preparedStatement.setInt(3, c.getCivico());
			preparedStatement.setString(4, c.getCitta());
			preparedStatement.setInt(5, c.getCap());
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
	public synchronized BeanIndirizzo doRetrieveByKey(Object key) throws SQLException {
		
		int codiceIndirizzo= (int) key;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanIndirizzo bean = new BeanIndirizzo();

		String selectSQL = "SELECT * FROM " + IndirizzoModel.TABLE_NAME + " WHERE codiceIndirizzo = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, codiceIndirizzo);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCodiceIndirizzo(rs.getInt("codiceIndirizzo"));
				bean.setVia((rs.getString("via")));
				bean.setCivico(rs.getInt("civico"));
				bean.setCitta(rs.getString("citta"));
				bean.setCap(rs.getInt("cap"));
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

		String deleteSQL = "DELETE FROM " + IndirizzoModel.TABLE_NAME + " WHERE codiceIndirizzo = ?";

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

		Collection<Bean> Indirizzo = new LinkedList<Bean>();

		String selectSQL = "SELECT * FROM " + IndirizzoModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanIndirizzo bean = new BeanIndirizzo();

				bean.setCodiceIndirizzo(rs.getInt("codiceIndirizzo"));
				bean.setVia((rs.getString("via")));
				bean.setCivico(rs.getInt("civico"));
				bean.setCitta(rs.getString("citta"));
				bean.setCap(rs.getInt("cap"));
				Indirizzo.add(bean);
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
		return Indirizzo;
	}
	}


