package Beans;

import java.io.Serializable;

public class BeanAccessorio extends Bean implements Serializable{
	private static final long serialVersionUID = 1L;
	int codiceProdotto;
	String nomeCategoria, descrizioneCategoria;
	public BeanAccessorio() {
		codiceProdotto=-1;
		nomeCategoria="";
		descrizioneCategoria="";
	}
	public int getCodiceProdotto() {
		return this.codiceProdotto;
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
