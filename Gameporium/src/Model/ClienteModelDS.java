package Model;
import Beans.BeanCliente;
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

public class ClienteModelDS implements ClienteModel {

	private static DataSource ds;

	static {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");

			ds = (DataSource) envCtx.lookup("jdbc/gameporiumdb");

		} catch (NamingException e) {
			System.out.println("Error:" + e.getMessage());
		}
	}

	private static final String TABLE_NAME = "cliente";

	@Override
	public synchronized void doSave(BeanCliente Cliente) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ClienteModelDS.TABLE_NAME
				+ " (CF, dataNascita,nome,cognome,username,passwordU,recapito,cap,via,provincia) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		Date dt=new java.sql.Date(Cliente.getDataNascita().getTime());
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, Cliente.getCF());
			preparedStatement.setDate(2, dt);
			preparedStatement.setString(3, Cliente.getNome());
			preparedStatement.setString(4, Cliente.getCognome());
			preparedStatement.setString(5, Cliente.getUsername());
			preparedStatement.setString(6, Cliente.getPasswordU());
			preparedStatement.setString(7, Cliente.getRecapito());
			preparedStatement.setInt(8, Cliente.getCap());
			preparedStatement.setString(9, Cliente.getVia());
			preparedStatement.setString(10, Cliente.getVia());
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
	public synchronized BeanCliente doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanCliente bean = new BeanCliente();

		String selectSQL = "SELECT * FROM " + ClienteModelDS.TABLE_NAME + " WHERE codiceProdotto = ?";

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

		String deleteSQL = "DELETE FROM " + ClienteModelDS.TABLE_NAME + " WHERE CF = ?";

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
	public synchronized Collection<BeanCliente> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<BeanCliente> Cliente = new LinkedList<BeanCliente>();

		String selectSQL = "SELECT * FROM " + ClienteModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanCliente bean = new BeanCliente();

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
				Cliente.add(bean);
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
		return Cliente;
	}

}