package Model;
import java.sql.SQLException;
import java.util.Collection;
import Beans.BeanPartecipazione;

public interface PartecipazioneModel {
	public void doSave(BeanPartecipazione product) throws SQLException;

	public boolean doDelete(int code) throws SQLException;

	public BeanPartecipazione doRetrieveByKey(int code) throws SQLException;
	
	public Collection<BeanPartecipazione> doRetrieveAll(String order) throws SQLException;
}