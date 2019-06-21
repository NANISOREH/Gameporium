package Beans;

import java.io.Serializable;



	public class BeanPagamento extends Bean implements Serializable{
		private static final long serialVersionUID = 1L;
		int codiceP, numCarta, cvv;
		String circuito,scadenza;
		
		public BeanPagamento()
		{
			codiceP=-1;
			numCarta= -1;
			cvv = -1;
			circuito="";
			scadenza="";
		}

		public String getScadenza() {
			return scadenza;
		}

		public void setScadenza(String scadenza) {
			this.scadenza = scadenza;
		}

		public int getCodiceP() {
			return codiceP;
		}

		public void setCodiceP(int newCodiceP) {
			this.codiceP = newCodiceP;
		}

		public int getNumCarta() {
			return numCarta;
		}

		public void setNumCarta(int newNumCarta) {
			this.numCarta = newNumCarta;
		}
		
		public int getCvv() {
			
			return this.cvv;
		}
		
		public void setCvv(int newCvv) {
			this.cvv = newCvv;
		}

		public String getCircuito() {
			return circuito;
		}

		public void setCircuito(String newCircuito) {
			this.circuito = newCircuito;
		}
		
		@Override
		public String toString() {
			return "BeanPagamento [codiceP=" + codiceP + ", numCarta=" + numCarta + ", cvv=" + cvv + ", circuito="
					+ circuito + ", scadenza=" + scadenza + "]";
		}


	}
