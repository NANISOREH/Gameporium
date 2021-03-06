package Model;
import Beans.Bean;
import Beans.BeanComposizione;
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

public class ComposizioneModel implements Model {

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

	private static final String TABLE_NAME = "composizione";

	@Override
	public synchronized void doSave(Bean composizione) throws SQLException {
		BeanComposizione c=(BeanComposizione) composizione;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ComposizioneModel.TABLE_NAME
				+ " (codiceOrdine, codiceProdotto, quantita) VALUES (?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(2, c.getCodiceProdotto());
			preparedStatement.setInt(3, c.getQuantita());
			preparedStatement.setInt(1, c.getCodiceOrdine());
			preparedStatement.executeUpdate();

			connection.commit();
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
	public synchronized BeanComposizione doRetrieveByKey(Object codice) throws SQLException {
		
		int code=(int) codice;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanComposizione bean = new BeanComposizione();

		String selectSQL = "SELECT * FROM " + ComposizioneModel.TABLE_NAME + " WHERE codiceOrdine = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCodiceProdotto(rs.getInt("codiceProdotto"));
				bean.setCodiceOrdine(rs.getInt("codiceOrdine"));
				bean.setQuantita(rs.getInt("quantita"));
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

		String deleteSQL = "DELETE FROM " + ComposizioneModel.TABLE_NAME + " WHERE codiceOrdine = ?";

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

		Collection<Bean> Composizione = new LinkedList<Bean>();

		String selectSQL = "SELECT * FROM " + ComposizioneModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanComposizione bean = new BeanComposizione();

				bean.setCodiceProdotto(rs.getInt("codiceProdotto"));
				bean.setCodiceOrdine(rs.getInt("codiceOrdine"));
				bean.setQuantita(rs.getInt("quantita"));
				Composizione.add(bean);
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
		return Composizione;
	}

}