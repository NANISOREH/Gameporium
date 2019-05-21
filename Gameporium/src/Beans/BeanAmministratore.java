package Beans;
//
import java.io.Serializable;
import java.util.Date;

public class BeanAmministratore extends Bean implements Serializable {
	private static final long serialVersionUID = 1L;
	String CF, nome, cognome, username, passwordU, recapito, via, provincia;
	Date dataNascita;
	int cap;
	
	public BeanAmministratore()
	{
		CF="";
		nome="";
		cognome="";
		username="";
		passwordU="";
		recapito="";
		via="";
		provincia="";
		dataNascita=null;
		cap=-1;
	}

	public String getCF() {
		return CF;
	}

	public void setCF(String newCF) {
		CF = newCF;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String newNome) {
		this.nome = newNome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String newCognome) {
		this.cognome = newCognome;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String newUsername) {
		this.username = newUsername;
	}

	public String getPasswordU() {
		return passwordU;
	}

	public void setPasswordU(String newPasswordU) {
		this.passwordU = newPasswordU;
	}

	public String getRecapito() {
		return recapito;
	}

	public void setRecapito(String newRecapito) {
		this.recapito = newRecapito;
	}

	public String getVia() {
		return via;
	}

	public void setVia(String newVia) {
		this.via = newVia;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String newProvincia) {
		this.provincia = newProvincia;
	}

	public Date getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(Date newDataNascita) {
		this.dataNascita = newDataNascita;
	}

	public int getCap() {
		return cap;
	}

	public void setCap(int newCap) {
		this.cap = newCap;
	}

	@Override
	public String toString() {
		return "BeanAmministratore [CF=" + CF + ", nome=" + nome + ", cognome=" + cognome + ", username=" + username
				+ ", passwordU=" + passwordU + ", recapito=" + recapito + ", via=" + via + ", provincia=" + provincia
				+ ", dataNascita=" + dataNascita + ", cap=" + cap + "]";
	}
	
	
	
	

	

}
