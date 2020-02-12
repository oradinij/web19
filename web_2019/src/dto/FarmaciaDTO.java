package dto;

public class FarmaciaDTO {

	int id;
	String email;
	String indirizzo;
	String nome_farmacia;
	
	public FarmaciaDTO(int id, String email, String indirizzo, String nome_farmacia) {
		this.id = id;
		this.email = email;
		this.indirizzo = indirizzo;
		this.nome_farmacia= nome_farmacia;
	}
	
	public int getId() {
		return this.id;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public String getNome_farmacia() {
		return nome_farmacia;
	}

	public void setNome_farmacia(String nome_farmacia) {
		this.nome_farmacia = nome_farmacia;
	}

	public void setId(int id) {
		this.id = id;
	}

	
}

