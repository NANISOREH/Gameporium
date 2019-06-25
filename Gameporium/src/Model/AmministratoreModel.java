package Model;
import Beans.Bean;
import Beans.BeanAmministratore;
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

public class AmministratoreModel implements Model {

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
	public synchronized void doSave(Bean amministratore) throws SQLException {
		BeanAmministratore a= (BeanAmministratore) amministratore;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + AmministratoreModel.TABLE_NAME
				+ " (nome,cognome,username,passwordU,recapito) VALUES (?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(3, a.getNome());
			preparedStatement.setString(4, a.getCognome());
			preparedStatement.setString(5, a.getUsername());
			preparedStatement.setString(6, a.getPasswordU());
			preparedStatement.setString(7, a.getRecapito());
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
	public synchronized BeanAmministratore doRetrieveByKey(Object codice) throws SQLException {
		
		String username=(String) codice;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanAmministratore bean = new BeanAmministratore();

		String selectSQL = "SELECT * FROM " + AmministratoreModel.TABLE_NAME + " WHERE username = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, username);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCognome(rs.getString("cognome"));
				bean.setNome(rs.getString("nome"));
				bean.setPasswordU(rs.getString("passwordU"));
				bean.setRecapito(rs.getString("recapito"));
				bean.setUsername(rs.getString("username"));
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
		
		String username=(String) codice;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + AmministratoreModel.TABLE_NAME + " WHERE username = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, username);

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
	
	public synchronized BeanAmministratore doRetrieveByUserPass(String user, String pass) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanAmministratore bean = new BeanAmministratore();

		String selectSQL = "SELECT * FROM " + AmministratoreModel.TABLE_NAME + " WHERE username = ? AND PasswordU = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, user);
			preparedStatement.setString(2, pass);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCognome(rs.getString("cognome"));
				bean.setNome(rs.getString("nome"));
				bean.setPasswordU(rs.getString("passwordU"));
				bean.setRecapito(rs.getString("recapito"));
				bean.setUsername(rs.getString("username"));
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
	public synchronized Collection<Bean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Bean> Amministratore = new LinkedList<Bean>();

		String selectSQL = "SELECT * FROM " + AmministratoreModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanAmministratore bean = new BeanAmministratore();

				bean.setCognome(rs.getString("cognome"));
				bean.setNome(rs.getString("nome"));
				bean.setPasswordU(rs.getString("passwordU"));
				bean.setRecapito(rs.getString("recapito"));
				bean.setUsername(rs.getString("username"));
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