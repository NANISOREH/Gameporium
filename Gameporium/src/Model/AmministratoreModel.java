package Model;
import java.sql.SQLException;
import java.util.Collection;
import Beans.BeanAmministratore;

public interface AmministratoreModel {
	public void doSave(BeanAmministratore product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public BeanAmministratore doRetrieveByKey(int code) throws SQLException;
	
	public Collection<BeanAmministratore> doRetrieveAll(String order) throws SQLException;
}