package Model;
import Beans.Bean;
import Beans.BeanEvento;
import Beans.BeanPartecipazione;
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

public class PartecipazioneModel implements Model {

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

	private static final String TABLE_NAME = "partecipazione";

	@Override
	public synchronized void doSave(Bean partecipazione) throws SQLException {

		BeanPartecipazione p=(BeanPartecipazione) partecipazione;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		EventoModel em=new EventoModel();
		BeanEvento be=new BeanEvento();
		be= em.doRetrieveByKey(p.getCodiceEvento());
		
		String insertSQL = "INSERT INTO " + PartecipazioneModel.TABLE_NAME
				+ " (CodiceEvento, username) VALUES (?, ?)";
		
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, p.getCodiceEvento());
			preparedStatement.setString(2, p.getCodiceCliente());
			preparedStatement.executeUpdate();

			connection.commit();
			em.doUpdate("numeroPartecipanti", p.getCodiceEvento(), be.getNumeroPartecipanti()+1);
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
	public synchronized BeanPartecipazione doRetrieveByKey(Object codice) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int code=(int) codice;
		BeanPartecipazione bean = new BeanPartecipazione();

		String selectSQL = "SELECT * FROM " + PartecipazioneModel.TABLE_NAME + " WHERE username = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				bean.setCodiceEvento(rs.getInt("codiceEvento"));
				bean.setCodiceCliente(rs.getString("username"));
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

	public synchronized boolean doDelete(Object codice) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int code=(int) codice;
		int result = 0;

		String deleteSQL = "DELETE FROM " + PartecipazioneModel.TABLE_NAME + " WHERE username = ?";

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

		Collection<Bean> Partecipazione = new LinkedList<Bean>();

		String selectSQL = "SELECT * FROM " + PartecipazioneModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanPartecipazione bean = new BeanPartecipazione();

				bean.setCodiceEvento(rs.getInt("codiceEvento"));
				bean.setCodiceCliente(rs.getString("username"));
				Partecipazione.add(bean);
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
		return Partecipazione;
	}


}
