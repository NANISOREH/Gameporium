package Beans;

import java.io.Serializable;
import java.math.BigDecimal;

public class BeanAccessorio extends Bean implements Serializable{
	private static final long serialVersionUID = 1L;
	int codiceProdotto,disponibilita,codCategoria,IVA;
	BigDecimal prezzo;
	boolean offerta,novita;
	String nomeCategoria, descrizioneCategoria,titolo,descrizione,foto,produttore;
	public BeanAccessorio() {
		codiceProdotto=-1;
		disponibilita=0;
		codCategoria=0;
		prezzo=null;
		titolo="";
		descrizione="";
		foto="";
		produttore="";
		IVA=-1;
		offerta=false;
		novita=false;
		nomeCategoria="";
		descrizioneCategoria="";
	}
	public int getCodiceProdotto() {
		return this.codiceProdotto;
	}
	public int getDisponibilita() {
		return disponibilita;
	}
	public void setDisponibilita(int disponibilita) {
		this.disponibilita = disponibilita;
	}
	public int getCodCategoria() {
		return codCategoria;
	}
	public void setCodCategoria(int codCategoria) {
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
	public void setCodiceProdotto(int newCodiceProdotto) {
		this.codiceProdotto = newCodiceProdotto;
	}
	public String getNomeCategoria() {
		return this.nomeCategoria;
	}
	public void setNomeCategoria(String newNomeCategoria) {
		this.nomeCategoria = newNomeCategoria;
	}
	public String getDescrizioneCategoria() {
		return this.descrizioneCategoria;
	}
	public void setDescrizioneCategoria(String newDescrizioneCategoria) {
		this.descrizioneCategoria = newDescrizioneCategoria;
	}
	@Override
	public String toString() {
		return "BeanAccessorio [codiceProdotto=" + codiceProdotto + ", nomeCategoria=" + nomeCategoria
				+ ", descrizioneCategoria=" + descrizioneCategoria + "]";
	}
}
