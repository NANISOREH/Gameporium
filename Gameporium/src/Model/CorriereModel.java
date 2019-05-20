package Model;
import java.sql.SQLException;
import java.util.Collection;
import Beans.BeanCorriere;

public interface CorriereModel {
	public void doSave(BeanCorriere product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public BeanCorriere doRetrieveByKey(int code) throws SQLException;
	
	public Collection<BeanCorriere> doRetrieveAll(String order) throws SQLException;
}