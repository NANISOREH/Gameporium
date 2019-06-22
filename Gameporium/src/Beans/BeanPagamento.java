package Beans;

import java.io.Serializable;



	public class BeanPagamento extends Bean implements Serializable{
		private static final long serialVersionUID = 1L;
		int codiceMetodo, numCarta, cvv;
		String circuito,scadenza, secureCode;
		
		public String getSecureCode() {
			String cod = Integer.toString(numCarta);
			return cod.substring(cod.length() - 4);
		}

		public void setSecureCode(String secureCode) {
			this.secureCode = secureCode;
		}

		public BeanPagamento()
		{
			codiceMetodo=-1;
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

		public int getCodiceMetodo() {
			return codiceMetodo;
		}

		public void setCodiceMetodo(int newCodiceMetodo) {
			this.codiceMetodo = newCodiceMetodo;
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
			return "BeanPagamento [codiceMetodo=" + codiceMetodo + ", numCarta=" + numCarta + ", cvv=" + cvv + ", circuito="
					+ circuito + ", scadenza=" + scadenza + "]";
		}


	}
