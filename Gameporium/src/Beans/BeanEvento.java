package Beans;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

public class BeanEvento extends Bean implements Serializable {
	private static final long serialVersionUID = 1L;
	int codiceEvento, numeroPartecipanti;
	String nome, luogo, descrizione,locandina;
	public String getLocandina() {
		return locandina;
	}

	public void setLocandina(String locandina) {
		this.locandina = locandina;
	}

	Date dataEvento;
	Time ora;
	
	public BeanEvento()
	{
		codiceEvento=-1;
		numeroPartecipanti=-1;
		nome="";
		luogo="";
		descrizione="";
		dataEvento=null;
		ora=null;
		locandina="";
	}

	public int getCodiceEvento() {
		return codiceEvento;
	}

	public void setCodiceEvento(int newCodiceEvento) {
		this.codiceEvento = newCodiceEvento;
	}

	public int getNumeroPartecipanti() {
		return numeroPartecipanti;
	}

	public void setNumeroPartecipanti(int newNumeroPartecipanti) {
		this.numeroPartecipanti = newNumeroPartecipanti;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String newNome) {
		this.nome = newNome;
	}

	public String getLuogo() {
		return luogo;
	}

	public void setLuogo(String newLuogo) {
		this.luogo = newLuogo;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String newDescrizione) {
		this.descrizione = newDescrizione;
	}

	public Date getData() {
		return dataEvento;
	}

	public void setData(Date newData) {
		this.dataEvento = newData;
	}

	public Time getOra() {
		return ora;
	}

	public void setOra(Time time) {
		this.ora = time;
	}

	@Override
	public String toString() {
		return "BeanEvento [codiceEvento=" + codiceEvento + ", numeroPartecipanti=" + numeroPartecipanti + ", nome="
				+ nome + ", luogo=" + luogo + ", descrizione=" + descrizione + ", data=" + dataEvento + ", ora=" + ora + "]";
	}
	
	
	
	

}
