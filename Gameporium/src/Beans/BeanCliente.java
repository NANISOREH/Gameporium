package Beans;
import java.io.Serializable;

public class BeanCliente extends Bean implements Serializable {
	private static final long serialVersionUID = 1L;
	String nome, cognome, username, passwordU, recapito;
	int cartaPred;
	
	public int getCartaPred() {
		return cartaPred;
	}

	public void setCartaPred(int cartaPred) {
		this.cartaPred = cartaPred;
	}

	public BeanCliente()
	{
		nome="";
		cognome="";
		username="";
		passwordU="";
		recapito="";
		cartaPred=-1;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String newNome) {
		this.nome = newNome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String newCognome) {
		this.cognome = newCognome;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String newUsername) {
		this.username = newUsername;
	}

	public String getPasswordU() {
		return passwordU;
	}

	public void setPasswordU(String newPasswordU) {
		this.passwordU = newPasswordU;
	}

	public String getRecapito() {
		return recapito;
	}

	public void setRecapito(String newRecapito) {
		this.recapito = newRecapito;
	}

	@Override
	public String toString() {
		return "BeanCliente [nome=" + nome + ", cognome=" + cognome + ", username=" + username + ", passwordU="
				+ passwordU + ", recapito=" + recapito + ", cartaPred=" + cartaPred + "]";
	}

}



