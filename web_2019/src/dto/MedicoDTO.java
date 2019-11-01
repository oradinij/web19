package dto;

import java.util.ArrayList;

public class MedicoDTO {
	private int id;
	private ArrayList<PazienteDTO> listaPazienti;
	private String email;
	private int idSpecializzazione;

	public MedicoDTO(String email, int id, int idSpecializzazione,ArrayList<PazienteDTO> listaPazienti) {
		this.email = email;
		this.id = id;
		this.listaPazienti = listaPazienti;
		this.idSpecializzazione =idSpecializzazione;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public ArrayList<PazienteDTO> getListaPazienti() {
		return listaPazienti;
	}
	public void setListaPazienti(ArrayList<PazienteDTO> listaPazienti) {
		this.listaPazienti = listaPazienti;
	}

	public PazienteDTO getPazienteById(int id_paziente) {
		for(PazienteDTO paziente : this.listaPazienti) {
			if(paziente.getId()== id_paziente)
				return paziente;
		}
		return null;		
	}
	public int getIdSpecializzazione() {
		return this.idSpecializzazione;
	}



}
