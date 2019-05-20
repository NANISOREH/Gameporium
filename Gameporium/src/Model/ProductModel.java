package Model;
import Beans.BeanProduct;
import java.sql.SQLException;
import java.util.Collection;

public interface ProductModel {
	public void doSave(BeanProduct product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public BeanProduct doRetrieveByKey(int code) throws SQLException;
	
	public Collection<BeanProduct> doRetrieveAll(String order) throws SQLException;
}
