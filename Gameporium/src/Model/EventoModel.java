package Model;
import java.sql.SQLException;
import java.util.Collection;
import Beans.BeanEvento;

public interface EventoModel {
	public void doSave(BeanEvento product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public BeanEvento doRetrieveByKey(int code) throws SQLException;
	
	public Collection<BeanEvento> doRetrieveAll(String order) throws SQLException;
}