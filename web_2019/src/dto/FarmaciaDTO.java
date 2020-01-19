package dto;

public class FarmaciaDTO {

	int id;
	String email;
	String indirizzo;
	
	public FarmaciaDTO(int id, String email, String indirizzo) {
		this.id = id;
		this.email = email;
		this.indirizzo = indirizzo;
	}
	
	public int getId() {
		return this.id;
	}

}
