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

	public String getNome() {		
		return this.nome_farmacia;
	}

	
}

