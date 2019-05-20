package Beans;

import java.io.Serializable;
import java.sql.Time;

public class BeanGioco implements Serializable{
	private static final long serialVersionUID = 1L;
	int codiceProdotto, numeroGiocatori, etaConsigliata;
	String nomeCategoria, descrizioneCategoria;
	Time durata;

	public BeanGioco()
	{
		codiceProdotto=-1;
		numeroGiocatori=-1;
		etaConsigliata=-1;
		nomeCategoria="";
		descrizioneCategoria="";
		durata=null;
	}

	public int getCodiceProdotto() {
		return codiceProdotto;
	}

	public void setCodiceProdotto(int newCodiceProdotto) {
		this.codiceProdotto = newCodiceProdotto;
	}

	public int getNumeroGiocatori() {
		return numeroGiocatori;
	}

	public void setNumeroGiocatori(int newNumeroGiocatori) {
		this.numeroGiocatori = newNumeroGiocatori;
	}

	public int getEtaConsigliata() {
		return etaConsigliata;
	}

	public void setEtaConsigliata(int newEtaConsigliata) {
		this.etaConsigliata = newEtaConsigliata;
	}

	public String getNomeCategoria() {
		return nomeCategoria;
	}

	public void setNomeCategoria(String newNomeCategoria) {
		this.nomeCategoria = newNomeCategoria;
	}

	public String getDescrizioneCategoria() {
		return descrizioneCategoria;
	}

	public void setDescrizioneCategoria(String newDescrizioneCategoria) {
		this.descrizioneCategoria = newDescrizioneCategoria;
	}

	public Time getDurata() {
		return durata;
	}

	public void setDurata(Time newDurata) {
		this.durata = newDurata;
	}

	@Override
	public String toString() {
		return "BeanGioco [codiceProdotto=" + codiceProdotto + ", numeroGiocatori=" + numeroGiocatori
				+ ", etaConsigliata=" + etaConsigliata + ", nomeCategoria=" + nomeCategoria + ", descrizioneCategoria="
				+ descrizioneCategoria + ", durata=" + durata + "]";
	}
	
	
	
	
}
