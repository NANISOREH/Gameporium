package Model;
import Beans.Bean;
import Beans.BeanOrdine;
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

public class OrdineModel implements Model {

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

	private static final String TABLE_NAME = "ordine";

	@Override
	public synchronized void doSave(Bean ordine) throws SQLException {
		
		BeanOrdine o=(BeanOrdine) ordine;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + OrdineModel.TABLE_NAME
				+ " (codiceOrdine, indirizzoSpedizione, tipoSpedizione, dataSpedizione, codiceSpedizione, codicePagamento, importo, metodo, indirizzoFatturazione) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, o.getCodiceOrdine());
			preparedStatement.setString(2, o.getIndirizzoSpedizione());
			preparedStatement.setString(3, o.getTipoSpedizione());
			preparedStatement.setDate(4, Date.valueOf(o.getDataSpedizione()));
			preparedStatement.setInt(6, o.getCodiceSpedizione());
			preparedStatement.setInt(7, o.getCodicePagamento());
			preparedStatement.setDouble(8, o.getImporto());
			preparedStatement.setString(9, o.getMetodo());
			preparedStatement.setString(10, o.getIndirizzoFatturazione());
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
	public synchronized BeanOrdine doRetrieveByKey(Object codice) throws SQLException {
		
		int code=(int) codice;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanOrdine bean = new BeanOrdine();

		String selectSQL = "SELECT * FROM " + OrdineModel.TABLE_NAME + " WHERE codiceOrdine = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCodiceOrdine(rs.getInt("codiceOrdine"));
				bean.setIndirizzoSpedizione(rs.getString("indirizzoSpedizione"));
				bean.setTipoSpedizione(rs.getString("tipoSpedizione"));
				bean.setDataSpedizione(rs.getDate("dataSpedizione").toLocalDate());
				bean.setCodiceSpedizione(rs.getInt("codiceSpedizione"));
				bean.setCodicePagamento(rs.getInt("codicePagamento"));
				bean.setImporto(rs.getDouble("importo"));
				bean.setMetodo(rs.getString("metodo"));
				bean.setIndirizzoFatturazione(rs.getString("indirizzoFatturazione"));
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

		String deleteSQL = "DELETE FROM " + OrdineModel.TABLE_NAME + " WHERE codiceOrdine = ?";

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

		Collection<Bean> Ordine = new LinkedList<Bean>();

		String selectSQL = "SELECT o.codiceOrdine, o.indirizzoSpedizione, o.tipoSpedizione, o.dataOrdine, o.dataSpedizione, o.codiceSpedizione, o.codicePagamento, o.importo, o.metodo, o.indirizzoFatturazione, e.username\r\n" + 
				" FROM " + OrdineModel.TABLE_NAME +" as o JOIN effettua as e on o.codiceOrdine=e.codiceOrdine";

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanOrdine bean = new BeanOrdine();

				bean.setCodiceOrdine(rs.getInt("codiceOrdine"));
				bean.setIndirizzoSpedizione(rs.getString("indirizzoSpedizione"));
				bean.setTipoSpedizione(rs.getString("tipoSpedizione"));
				bean.setDataSpedizione(rs.getDate("dataSpedizione").toLocalDate());
				bean.setCodiceSpedizione(rs.getInt("codiceSpedizione"));
				bean.setCodicePagamento(rs.getInt("codicePagamento"));
				bean.setImporto(rs.getDouble("importo"));
				bean.setMetodo(rs.getString("metodo"));
				bean.setIndirizzoFatturazione(rs.getString("indirizzoFatturazione"));
				bean.setUsername(rs.getString("username"));
				Ordine.add(bean);
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
		return Ordine;
	}

	public synchronized Collection<Bean> doRetrieveByUser(String user) throws SQLException{
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Bean> Ordine = new LinkedList<Bean>();

		String selectSQL = "SELECT * FROM " + OrdineModel.TABLE_NAME +" as o JOIN effettua as e on o.codiceOrdine=e.codiceOrdine WHERE username=?";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, user);

			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				BeanOrdine bean = new BeanOrdine();

				bean.setCodiceOrdine(rs.getInt("codiceOrdine"));
				bean.setIndirizzoSpedizione(rs.getString("indirizzoSpedizione"));
				bean.setTipoSpedizione(rs.getString("tipoSpedizione"));
				bean.setDataOrdine(rs.getDate("dataOrdine").toLocalDate());
				bean.setDataSpedizione(rs.getDate("dataSpedizione").toLocalDate());
				bean.setCodiceSpedizione(rs.getInt("codiceSpedizione"));
				bean.setCodicePagamento(rs.getInt("codicePagamento"));
				bean.setImporto(rs.getDouble("importo"));
				bean.setMetodo(rs.getString("metodo"));
				bean.setIndirizzoFatturazione(rs.getString("indirizzoFatturazione"));
				bean.setUsername(rs.getString("username"));
				Ordine.add(bean);
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
		return Ordine;
	}
}