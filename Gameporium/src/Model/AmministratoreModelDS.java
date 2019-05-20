package Model;
import Beans.BeanAmministratore;
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

public class AmministratoreModelDS implements AmministratoreModel {

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

	private static final String TABLE_NAME = "amministratore";

	@Override
	public synchronized void doSave(BeanAmministratore Amministratore) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + AmministratoreModelDS.TABLE_NAME
				+ " (CF, dataNascita,nome,cognome,username,passwordU,recapito,cap,via,provincia) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Date dt=new java.sql.Date(Amministratore.getDataNascita().getTime());
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, Amministratore.getCF());
			preparedStatement.setDate(2, dt);
			preparedStatement.setString(3, Amministratore.getNome());
			preparedStatement.setString(4, Amministratore.getCognome());
			preparedStatement.setString(5, Amministratore.getUsername());
			preparedStatement.setString(6, Amministratore.getPasswordU());
			preparedStatement.setString(7, Amministratore.getRecapito());
			preparedStatement.setInt(8, Amministratore.getCap());
			preparedStatement.setString(9, Amministratore.getVia());
			preparedStatement.setString(10, Amministratore.getVia());
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
	public synchronized BeanAmministratore doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanAmministratore bean = new BeanAmministratore();

		String selectSQL = "SELECT * FROM " + AmministratoreModelDS.TABLE_NAME + " WHERE CF = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCF(rs.getString("CF"));
				bean.setCap(rs.getInt("cap"));
				bean.setCognome(rs.getString("cognome"));
				bean.setDataNascita(rs.getDate("dataNascita"));
				bean.setNome(rs.getString("nome"));
				bean.setPasswordU(rs.getString("passwordU"));
				bean.setProvincia(rs.getString("provincia"));
				bean.setRecapito(rs.getString("recapito"));
				bean.setUsername(rs.getString("username"));
				bean.setVia(rs.getString("via"));
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
	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + AmministratoreModelDS.TABLE_NAME + " WHERE CF = ?";

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
	public synchronized Collection<BeanAmministratore> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<BeanAmministratore> Amministratore = new LinkedList<BeanAmministratore>();

		String selectSQL = "SELECT * FROM " + AmministratoreModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanAmministratore bean = new BeanAmministratore();

				bean.setCF(rs.getString("CF"));
				bean.setCap(rs.getInt("cap"));
				bean.setCognome(rs.getString("cognome"));
				bean.setDataNascita(rs.getDate("dataNascita"));
				bean.setNome(rs.getString("nome"));
				bean.setPasswordU(rs.getString("passwordU"));
				bean.setProvincia(rs.getString("provincia"));
				bean.setRecapito(rs.getString("recapito"));
				bean.setUsername(rs.getString("username"));
				bean.setVia(rs.getString("via"));
				Amministratore.add(bean);
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
		return Amministratore;
	}

}