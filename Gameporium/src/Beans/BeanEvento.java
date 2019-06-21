package Beans;

import java.io.Serializable;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;

public class BeanEvento extends Bean implements Serializable {
	private static final long serialVersionUID = 1L;
	int codiceEvento, numeroPartecipanti;
	String nome, luogo, descrizione,locandina;
	LocalDate dataEvento;
	LocalTime ora;
	
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
	
	public String getLocandina() {
		return locandina;
	}

	public void setLocandina(String locandina) {
		this.locandina = locandina;
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

	public LocalDate getDataEvento() {
		return dataEvento;
	}

	public void setDataEvento(LocalDate newData) {
		this.dataEvento = newData;
	}

	public LocalTime getOra() {
		return ora;
	}

	public void setOra(LocalTime time) {
		this.ora = time;
	}

	@Override
	public String toString() {
		return "BeanEvento [codiceEvento=" + codiceEvento + ", numeroPartecipanti=" + numeroPartecipanti + ", nome="
				+ nome + ", luogo=" + luogo + ", descrizione=" + descrizione + ", dataEvento=" + dataEvento + ", ora=" + ora + "]";
	}
	
	
	
	

}
