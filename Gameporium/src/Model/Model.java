package Model;
import java.sql.SQLException;
import java.util.Collection;

import Beans.Bean;
import Beans.BeanAccessorio;

public interface Model {
	public void doSave(Bean bean) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public Bean doRetrieveByKey(int code) throws SQLException;
	
	public Collection<Bean> doRetrieveAll(String order) throws SQLException;
}