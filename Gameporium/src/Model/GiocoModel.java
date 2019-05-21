package Model;
import Beans.Bean;
import Beans.BeanGioco;
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

public class GiocoModel implements Model {

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

	private static final String TABLE_NAME = "gioco";

	@Override
	public synchronized void doSave(Bean gioco) throws SQLException {

		BeanGioco g=(BeanGioco) gioco;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + GiocoModel.TABLE_NAME
				+ " (CodiceProdotto, nomeCategoria, descrizioneCategoria, durata, etaConsigliata, numGiocatori) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, g.getCodiceProdotto());
			preparedStatement.setString(2, g.getNomeCategoria());
			preparedStatement.setString(3, g.getDescrizioneCategoria());
			preparedStatement.setTime(4, g.getDurata());
			preparedStatement.setInt(5, g.getEtaConsigliata());
			preparedStatement.setInt(6, g.getNumeroGiocatori());
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
	public synchronized BeanGioco doRetrieveByKey(Object codice) throws SQLException {
		
		int code=(int) codice;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanGioco bean = new BeanGioco();

		String selectSQL = "SELECT * FROM " + GiocoModel.TABLE_NAME + " WHERE codiceProdotto = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCodiceProdotto(rs.getInt("codiceProdotto"));
				bean.setDescrizioneCategoria(rs.getString("descrizioneCategoria"));
				bean.setNomeCategoria(rs.getString("nomeCategoria"));
				bean.setDurata(rs.getTime("durata"));
				bean.setEtaConsigliata(rs.getInt("etaConsigliata"));
				bean.setNumeroGiocatori(rs.getInt("numGiocatori"));
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

		String deleteSQL = "DELETE FROM " + GiocoModel.TABLE_NAME + " WHERE codiceProdotto = ?";

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

		Collection<Bean> Gioco = new LinkedList<Bean>();

		String selectSQL = "SELECT * FROM " + GiocoModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanGioco bean = new BeanGioco();

				bean.setCodiceProdotto(rs.getInt("codiceProdotto"));
				bean.setDescrizioneCategoria(rs.getString("descrizioneCategoria"));
				bean.setNomeCategoria(rs.getString("nomeCategoria"));
				bean.setDurata(rs.getTime("durata"));
				bean.setEtaConsigliata(rs.getInt("etaConsigliata"));
				bean.setNumeroGiocatori(rs.getInt("numGiocatori"));
				Gioco.add(bean);
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
		return Gioco;
	}

}