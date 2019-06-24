package Beans;

import java.io.Serializable;



	public class BeanPagamento extends Bean implements Serializable{
		private static final long serialVersionUID = 1L;
		int cvv;
		long numCarta;
		String circuito,scadenza, secureCode;
		
		public String getSecureCode() {
			
			return secureCode;
		}

		public void setSecureCode() {
			String cod = Long.toString(numCarta);
			secureCode = cod.substring(cod.length() - 4);

		}

		public BeanPagamento()
		{
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


		public long getNumCarta() {
			return numCarta;
		}

		public void setNumCarta(long l) {
			this.numCarta = l;
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
			return "BeanPagamento [cvv=" + cvv + ", numCarta=" + numCarta + ", circuito=" + circuito + ", scadenza="
					+ scadenza + "]";
		}
		

	}
