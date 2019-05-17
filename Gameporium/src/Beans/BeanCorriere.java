package Beans;

import java.io.Serializable;

public class BeanCorriere implements Serializable{
	private static final long serialVersionUID = 1L;
	int codiceCorriere;
	double costo;
	String nome;
	
	public BeanCorriere()
	{
		codiceCorriere=-1;
		costo=-1;
		nome="";
	}

	public int getCodiceCorriere() {
		return codiceCorriere;
	}

	public void setCodiceCorriere(int newCodiceCorriere) {
		this.codiceCorriere = newCodiceCorriere;
	}

	public double getCosto() {
		return costo;
	}

	public void setCosto(double newCosto) {
		this.costo = newCosto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String newNome) {
		this.nome = newNome;
	}

	@Override
	public String toString() {
		return "BeanCorriere [codiceCorriere=" + codiceCorriere + ", costo=" + costo + ", nome=" + nome + "]";
	}
	
	      
	
	
	
}
