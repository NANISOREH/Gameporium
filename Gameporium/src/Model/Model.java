package Model;
import java.sql.SQLException;
import java.util.Collection;

import Beans.Bean;

public interface Model {
	public void doSave(Bean bean) throws SQLException;

	public boolean doDelete(Object key) throws SQLException;

	public Bean doRetrieveByKey(Object key) throws SQLException;
	
	public Collection<Bean> doRetrieveAll(String order) throws SQLException;
}