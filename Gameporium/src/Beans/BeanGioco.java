package Beans;

import java.io.Serializable;
import java.math.BigDecimal;

public class BeanGioco extends Bean implements Serializable{
	private static final long serialVersionUID = 1L;
	int codiceProdotto, etaConsigliata, disponibilita,IVA;
	BigDecimal prezzo;
	String nomeCategoria, descrizioneCategoria,titolo,descrizione,foto,produttore, durata, numeroGiocatori, codCategoria;
	boolean offerta,novita;

	public int getDisponibilita() {
		return disponibilita;
	}

	public void setDisponibilita(int disponibilita) {
		this.disponibilita = disponibilita;
	}

	public String getCodCategoria() {
		return codCategoria;
	}

	public void setCodCategoria(String codCategoria) {
		this.codCategoria = codCategoria;
	}

	public int getIVA() {
		return IVA;
	}

	public void setIVA(int iVA) {
		IVA = iVA;
	}

	public BigDecimal getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(BigDecimal prezzo) {
		this.prezzo = prezzo;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public String getProduttore() {
		return produttore;
	}

	public void setProduttore(String produttore) {
		this.produttore = produttore;
	}

	public boolean isOfferta() {
		return offerta;
	}

	public void setOfferta(boolean offerta) {
		this.offerta = offerta;
	}

	public boolean isNovita() {
		return novita;
	}

	public void setNovita(boolean novita) {
		this.novita = novita;
	}

	public BeanGioco()
	{
		codiceProdotto=-1;
		disponibilita=0;
		codCategoria="";
		prezzo=null;
		titolo="";
		descrizione="";
		foto="";
		produttore="";
		IVA=-1;
		offerta=false;
		novita=false;
		numeroGiocatori="-1";
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

	public String getNumeroGiocatori() {
		return numeroGiocatori;
	}

	public void setNumeroGiocatori(String newNumeroGiocatori) {
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

	public String getDurata() {
		return durata;
	}

	public void setDurata(String newDurata) {
		this.durata = newDurata;
	}

	@Override
	public String toString() {
		return "BeanGioco [codiceProdotto=" + codiceProdotto + ", numeroGiocatori=" + numeroGiocatori
				+ ", etaConsigliata=" + etaConsigliata + ", nomeCategoria=" + nomeCategoria + ", descrizioneCategoria="
				+ descrizioneCategoria + ", durata=" + durata + "]";
	}
	
	
	
	
}
