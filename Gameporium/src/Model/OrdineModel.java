package Model;
import java.sql.SQLException;
import java.util.Collection;
import Beans.BeanOrdine;

public interface OrdineModel {
	public void doSave(BeanOrdine product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public BeanOrdine doRetrieveByKey(int code) throws SQLException;
	
	public Collection<BeanOrdine> doRetrieveAll(String order) throws SQLException;
}