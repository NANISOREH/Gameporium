package Model;
import java.sql.SQLException;
import java.util.Collection;
import Beans.BeanComposizione;

public interface ComposizioneModel {
	public void doSave(BeanComposizione product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public BeanComposizione doRetrieveByKey(int code) throws SQLException;
	
	public Collection<BeanComposizione> doRetrieveAll(String order) throws SQLException;
}