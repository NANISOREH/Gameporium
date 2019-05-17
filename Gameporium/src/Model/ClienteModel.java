package Model;
import java.sql.SQLException;
import java.util.Collection;
import Beans.BeanCliente;

public interface ClienteModel {
	public void doSave(BeanCliente product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public BeanCliente doRetrieveByKey(int code) throws SQLException;
	
	public Collection<BeanCliente> doRetrieveAll(String order) throws SQLException;
}