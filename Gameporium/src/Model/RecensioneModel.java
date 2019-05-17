package Model;
import java.sql.SQLException;
import java.util.Collection;
import Beans.BeanRecensione;

public interface RecensioneModel {
	public void doSave(BeanRecensione product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public BeanRecensione doRetrieveByKey(int code) throws SQLException;
	
	public Collection<BeanRecensione> doRetrieveAll(String order) throws SQLException;
}