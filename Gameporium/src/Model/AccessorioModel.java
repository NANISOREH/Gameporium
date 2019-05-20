package Model;
import java.sql.SQLException;
import java.util.Collection;
import Beans.BeanAccessorio;

public interface AccessorioModel {
	public void doSave(BeanAccessorio bean) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public BeanAccessorio doRetrieveByKey(int code) throws SQLException;
	
	public Collection<BeanAccessorio> doRetrieveAll(String order) throws SQLException;
}