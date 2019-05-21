package Model;
import Beans.Bean;
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

public class ProductModel implements Model {

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

	private static final String TABLE_NAME = "prodotto";

	@Override
	public synchronized void doSave(Bean product) throws SQLException {
		BeanProduct p = (BeanProduct) product;

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + ProductModel.TABLE_NAME
				+ " (CodiceProdotto, codiceCategoria, foto, titolo, disponibilita, prezzo, produttore, descrizione, IVA, novita, offerta) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, p.getCodice());
			preparedStatement.setInt(2, p.getCodCategoria());
			preparedStatement.setString(3, p.getFoto());
			preparedStatement.setString(4, p.getTitolo());
			preparedStatement.setInt(5, p.getDisponibilita());
			preparedStatement.setDouble(6, p.getPrezzo());
			preparedStatement.setString(7, p.getProduttore());
			preparedStatement.setString(8, p.getDescrizione());
			preparedStatement.setInt(9, p.getIVA());
			preparedStatement.setBoolean(10, p.isNovita());
			preparedStatement.setBoolean(11, p.isOfferta());
			
			
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
	public synchronized BeanProduct doRetrieveByKey(Object codice) throws SQLException {
		
		int code=(int) codice;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanProduct bean = new BeanProduct();

		String selectSQL = "SELECT * FROM " + ProductModel.TABLE_NAME + " WHERE codiceProdotto = ?";

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
				bean.setDisponibilita(rs.getInt("disponibilita"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setProduttore(rs.getString("produttore"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setIVA(rs.getInt("IVA"));
				bean.setNovita(rs.getBoolean("novita"));
				bean.setNovita(rs.getBoolean("offerta"));
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

		String deleteSQL = "DELETE FROM " + ProductModel.TABLE_NAME + " WHERE codiceProdotto = ?";

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

		Collection<Bean> product = new LinkedList<Bean>();

		String selectSQL = "SELECT * FROM " + ProductModel.TABLE_NAME;

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
				bean.setDisponibilita(rs.getInt("disponibilita"));
				bean.setPrezzo(rs.getDouble("prezzo"));
				bean.setProduttore(rs.getString("produttore"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setIVA(rs.getInt("IVA"));
				bean.setNovita(rs.getBoolean("novita"));
				bean.setNovita(rs.getBoolean("offerta"));
				product.add(bean);
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
		return product;
	}

}