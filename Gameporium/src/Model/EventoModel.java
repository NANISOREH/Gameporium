package Model;
import Beans.Bean;
import Beans.BeanEvento;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.Collection;
import java.util.LinkedList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class EventoModel implements Model {

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

	private static final String TABLE_NAME = "evento";

	@Override
	public synchronized void doSave(Bean evento) throws SQLException {

		BeanEvento e=(BeanEvento) evento;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		String insertSQL = "INSERT INTO " + EventoModel.TABLE_NAME
				+ " (codiceEvento,nome,luogo,descrizione,dataEvento,ora,numeroPartecipanti) VALUES (?, ?, ?, ?, ?, ?, ?)";
		Date dt=new java.sql.Date(e.getData().getTime());
		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			preparedStatement.setInt(1, e.getCodiceEvento());
			preparedStatement.setString(2, e.getNome());
			preparedStatement.setString(3, e.getLuogo());
			preparedStatement.setString(4, e.getDescrizione());
			preparedStatement.setDate(5, dt);
			preparedStatement.setTime(6, e.getOra());
			preparedStatement.setInt(7, e.getNumeroPartecipanti());
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
	public synchronized BeanEvento doRetrieveByKey(Object codice) throws SQLException {
		
		int code=(int) codice;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		BeanEvento bean = new BeanEvento();

		String selectSQL = "SELECT * FROM " + EventoModel.TABLE_NAME + " WHERE codiceEvento = ?";

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, code);

			ResultSet rs = preparedStatement.executeQuery();
			
			while (rs.next()) {
				
				bean.setCodiceEvento(rs.getInt("codiceEvento"));
				bean.setNome(rs.getString("nome"));
				bean.setLuogo(rs.getString("luogo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setData(rs.getDate("dataEvento"));
				bean.setOra(rs.getTime("ora"));
				bean.setNumeroPartecipanti(rs.getInt("numeroPartecipanti"));
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

		String deleteSQL = "DELETE FROM " + EventoModel.TABLE_NAME + " WHERE codiceEvento = ?";

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

		Collection<Bean> Evento = new LinkedList<Bean>();

		String selectSQL = "SELECT * FROM " + EventoModel.TABLE_NAME;

		if (order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}

		try {
			connection = ds.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				BeanEvento bean = new BeanEvento();

				bean.setCodiceEvento(rs.getInt("codiceEvento"));
				bean.setNome(rs.getString("nome"));
				bean.setLuogo(rs.getString("luogo"));
				bean.setDescrizione(rs.getString("descrizione"));
				bean.setData(rs.getDate("dataEvento"));
				bean.setOra(rs.getTime("ora"));
				bean.setNumeroPartecipanti(rs.getInt("numeroPartecipanti"));
				Evento.add(bean);
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
		return Evento;
	}

}