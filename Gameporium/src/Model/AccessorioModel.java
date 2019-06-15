package Model;
import Beans.Bean;
import Beans.BeanAccessorio;
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

public class AccessorioModel implements Model {

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

	private static final String TABLE_NAME = "accessorio";

	@Override
	public synchronized void doSave(Bean accessorio) throws SQLException {
		BeanAccessorio a= (BeanAccessorio) accessorio;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + AccessorioModel.TABLE_NAME
				+ " (CodiceProdotto, nomeCategoria, descrizioneCategoria) VALUES (?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(3, a.getCodiceProdotto());
			preparedStatement.setString(1, a.getDescrizioneCategoria());
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
	public synchronized BeanAccessorio doRetrieveByKey(Object codice) throws SQLException {
		
		int code=(int) codice;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanAccessorio bean = new BeanAccessorio();

		String selectSQL = "SELECT * FROM " + AccessorioModel.TABLE_NAME + " AS g JOIN prodotto as p on g.codiceProdotto=p.codiceProdotto WHERE g.codiceProdotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCodiceProdotto(rs.getInt("codiceProdotto"));
				bean.setDescrizioneCategoria(rs.getString("descrizioneCategoria"));
				bean.setNomeCategoria(rs.getString("nomeCategoria"));
				bean.setCodCategoria(rs.getInt("codiceCategoria"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setDisponibilita(rs.getInt("disponibilita"));
				bean.setFoto(rs.getString("foto"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setPrezzo(rs.getBigDecimal("prezzo"));
				bean.setProduttore(rs.getString("produttore"));
				bean.setIVA(rs.getInt("IVA"));
				bean.setNovita(rs.getBoolean("novita"));
				bean.setOfferta(rs.getBoolean("offerta"));
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
		return false;
	}

	@Override
	public synchronized Collection<Bean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		Collection<Bean> Accessorio = new LinkedList<Bean>();

		String selectSQL = "SELECT * FROM " + AccessorioModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanAccessorio bean = new BeanAccessorio();
				bean.setCodiceProdotto(rs.getInt("codiceProdotto"));
				bean.setDescrizioneCategoria(rs.getString("descrizioneCategoria"));
				bean.setNomeCategoria(rs.getString("nomeCategoria"));
				bean.setCodCategoria(rs.getInt("codiceCategoria"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setDisponibilita(rs.getInt("disponibilita"));
				bean.setFoto(rs.getString("foto"));
				bean.setTitolo(rs.getString("titolo"));
				bean.setPrezzo(rs.getBigDecimal("prezzo"));
				bean.setProduttore(rs.getString("produttore"));
				bean.setIVA(rs.getInt("IVA"));
				bean.setNovita(rs.getBoolean("novita"));
				bean.setOfferta(rs.getBoolean("offerta"));
				Accessorio.add(bean);
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
		
		return Accessorio;
	}

}