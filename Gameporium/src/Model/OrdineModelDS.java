package Model;
import Beans.BeanOrdine;
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

public class OrdineModelDS implements OrdineModel {

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
	public synchronized void doSave(BeanOrdine Ordine) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + OrdineModelDS.TABLE_NAME
				+ " (codiceOrdine, indirizzoSpedizione, tipoSpedizione, dataSpedizione, codiceSpedizione, codicePagamento, importo, metodo, indirizzoFatturazione) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, Ordine.getCodiceOrdine());
			preparedStatement.setString(2, Ordine.getIndirizzoSpedizione());
			preparedStatement.setString(3, Ordine.getTipoSpedizione());
			preparedStatement.setDate(4, Ordine.getDataSpedizione());
			preparedStatement.setInt(6, Ordine.getCodiceSpedizione());
			preparedStatement.setInt(7, Ordine.getCodicePagamento());
			preparedStatement.setDouble(8, Ordine.getImporto());
			preparedStatement.setString(9, Ordine.getMetodo());
			preparedStatement.setString(10, Ordine.getIndirizzoFatturazione());
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
	public synchronized BeanOrdine doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanOrdine bean = new BeanOrdine();

		String selectSQL = "SELECT * FROM " + OrdineModelDS.TABLE_NAME + " WHERE codiceOrdine = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCodiceOrdine(rs.getInt("codiceOrdine"));
				bean.setIndirizzoSpedizione(rs.getString("indirizzoSpedizione"));
				bean.setTipoSpedizione(rs.getString("tipoSpedizione"));
				bean.setDataSpedizione(rs.getDate("dataSpedizione"));
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
	public synchronized boolean doDelete(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		int result = 0;

		String deleteSQL = "DELETE FROM " + OrdineModelDS.TABLE_NAME + " WHERE codiceOrdine = ?";

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
	public synchronized Collection<BeanOrdine> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<BeanOrdine> Ordine = new LinkedList<BeanOrdine>();

		String selectSQL = "SELECT * FROM " + OrdineModelDS.TABLE_NAME;

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
				bean.setDataSpedizione(rs.getDate("dataSpedizione"));
				bean.setCodiceSpedizione(rs.getInt("codiceSpedizione"));
				bean.setCodicePagamento(rs.getInt("codicePagamento"));
				bean.setImporto(rs.getDouble("importo"));
				bean.setMetodo(rs.getString("metodo"));
				bean.setIndirizzoFatturazione(rs.getString("indirizzoFatturazione"));
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