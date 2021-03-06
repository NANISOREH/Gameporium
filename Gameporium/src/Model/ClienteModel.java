package Model;
import Beans.Bean;
import Beans.BeanCliente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ClienteModel implements Model {

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

	private static final String TABLE_NAME = "cliente";

	@Override
	public synchronized void doSave(Bean cliente) throws SQLException {
		BeanCliente c=(BeanCliente) cliente;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ClienteModel.TABLE_NAME
				+ " (nome,cognome,username,passwordU,recapito,cartaPred) VALUES (?, ?, ?, ?, ?, ?)";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setString(1, c.getNome());
			preparedStatement.setString(2, c.getCognome());
			preparedStatement.setString(3, c.getUsername());
			preparedStatement.setString(4, c.getPasswordU());
			preparedStatement.setString(5, c.getRecapito());
			preparedStatement.setLong(6, c.getCartaPred());
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
	public synchronized BeanCliente doRetrieveByKey(Object user) throws SQLException {
		
		String username=(String) user;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanCliente bean = new BeanCliente();

		String selectSQL = "SELECT * FROM " + ClienteModel.TABLE_NAME + " WHERE username = ?";

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
				bean.setCartaPred(rs.getInt("cartaPred"));
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
	
	public synchronized BeanCliente doRetrieveByEmail(String email) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanCliente bean = new BeanCliente();

		String selectSQL = "SELECT * FROM " + ClienteModel.TABLE_NAME + " WHERE recapito = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, email);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCognome(rs.getString("cognome"));
				bean.setNome(rs.getString("nome"));
				bean.setPasswordU(rs.getString("passwordU"));
				bean.setRecapito(rs.getString("recapito"));
				bean.setUsername(rs.getString("username"));
			}
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
		return bean;
	}
	
	public synchronized BeanCliente doRetrieveByUserPass(String user, String pass) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanCliente bean = new BeanCliente();

		String selectSQL = "SELECT * FROM " + ClienteModel.TABLE_NAME + " WHERE username = ? AND PasswordU = ?";

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
				bean.setCartaPred(rs.getLong("cartaPred"));
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

		String deleteSQL = "DELETE FROM " + ClienteModel.TABLE_NAME + " WHERE username = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setString(1, username);

			result = preparedStatement.executeUpdate();
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
		return (result != 0);
	}

	@Override
	public synchronized Collection<Bean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Bean> Cliente = new LinkedList<Bean>();

		String selectSQL = "SELECT * FROM " + ClienteModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanCliente bean = new BeanCliente();

				bean.setCognome(rs.getString("cognome"));
				bean.setNome(rs.getString("nome"));
				bean.setPasswordU(rs.getString("passwordU"));
				bean.setRecapito(rs.getString("recapito"));
				bean.setUsername(rs.getString("username"));
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
	
	public synchronized void doUpdate(String column1, String column2, String column3, String column4, String column5, String username) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL ="UPDATE "+ClienteModel.TABLE_NAME+" SET nome=?, cognome=?, username=?, passwordU=?, recapito=? WHERE username='"+username+"'";


		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, column1);
			preparedStatement.setString(2, column2);
			preparedStatement.setString(3, column3);
			preparedStatement.setString(4, column4);
			preparedStatement.setString(5, column5);


				
				preparedStatement.executeUpdate();
				connection.commit();
		    }

	    finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
	    		}
	}
	
	public synchronized void doUpdateCard(String column, String username, Object value) throws SQLException
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "UPDATE "+ ClienteModel.TABLE_NAME + " as c SET "+column+"= ? WHERE c.username= ?";

		try {
				connection = ds.getConnection();
				preparedStatement = connection.prepareStatement(selectSQL);
				
				if(value instanceof String) {
					String val = (String) value;
					preparedStatement.setString(1, val);
					preparedStatement.setString(2, username);
				}
				if(value instanceof Long) {
					long val= (Long) value;
					preparedStatement.setLong(1, val);
					preparedStatement.setString(2, username);
				}

				preparedStatement.executeUpdate();
				connection.commit();
		    }

	    finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} finally {
				if (connection != null)
					connection.close();
			}
	    		}
	}

}