package Model;
import java.sql.SQLException;
import java.util.Collection;
import Beans.BeanGioco;

public interface GiocoModel {
	public void doSave(BeanGioco product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public BeanGioco doRetrieveByKey(int code) throws SQLException;
	
	public Collection<BeanGioco> doRetrieveAll(String order) throws SQLException;
}