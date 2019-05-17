package Model;
import Beans.BeanProduct;
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

public class ProductModelDS implements ProductModel {

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

	private static final String TABLE_NAME = "prodotto";

	@Override
	public synchronized void doSave(BeanProduct Product) throws SQLException {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductModelDS.TABLE_NAME
				+ " (CodiceProdotto, codiceCategoria, foto, titolo, disponibilità, prezzo, produttore, descrizione, IVA) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, Product.getCodice());
			preparedStatement.setInt(2, Product.getCodCategoria());
			preparedStatement.setString(3, Product.getFoto());
			preparedStatement.setString(4, Product.getTitolo());
			preparedStatement.setInt(5, Product.getDisponibilità());
			preparedStatement.setDouble(6, Product.getPrezzo());
			preparedStatement.setString(7, Product.getProduttore());
			preparedStatement.setString(8, Product.getDescrizione());
			preparedStatement.setInt(9, Product.getIVA());
			
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
	public synchronized BeanProduct doRetrieveByKey(int code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanProduct bean = new BeanProduct();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME + " WHERE codiceProdotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCodice(rs.getInt("codiceProdotto"));
				bean.setCodCategoria(rs.getInt("codiceCategoria"));
				bean.setFoto(rs.getString("foto"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setDisponibilità(rs.getInt("disponibilità"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setProduttore(rs.getString("produttore"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setIVA(rs.getInt("IVA"));
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

		String deleteSQL = "DELETE FROM " + ProductModelDS.TABLE_NAME + " WHERE codiceProdotto = ?";

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
	public synchronized Collection<BeanProduct> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<BeanProduct> Product = new LinkedList<BeanProduct>();

		String selectSQL = "SELECT * FROM " + ProductModelDS.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanProduct bean = new BeanProduct();

				bean.setCodice(rs.getInt("codiceProdotto"));
				bean.setCodCategoria(rs.getInt("codiceCategoria"));
				bean.setFoto(rs.getString("foto"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setDisponibilità(rs.getInt("disponibilità"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setProduttore(rs.getString("produttore"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setIVA(rs.getInt("IVA"));
				Product.add(bean);
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
		return Product;
	}

}