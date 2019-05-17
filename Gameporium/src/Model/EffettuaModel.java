package Model;
import java.sql.SQLException;
import java.util.Collection;
import Beans.BeanEffettua;

public interface EffettuaModel {
	public void doSave(BeanEffettua product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public BeanEffettua doRetrieveByKey(int code) throws SQLException;
	
	public Collection<BeanEffettua> doRetrieveAll(String order) throws SQLException;
}