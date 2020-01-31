package dto;


import com.google.gson.JsonObject;

import dao.TipologiaVisitaDAO;
import utils.Logger;

public class TipologiaVisitaDTO {

	private int id_visita;
	private String nome_visita;
	private String costo_visita;
	private String specializzazione;

	public JsonObject toJson() {
		JsonObject json = new JsonObject();
		json.addProperty("id_visita", id_visita);
		json.addProperty("nome_visita", nome_visita);
		json.addProperty("costo_visita", costo_visita);
		json.addProperty("specializzazione", specializzazione);
		return json;
	}
	
	public int getId_visita() {
		return id_visita;
	}
	public void setId_visita(int id_visita) {
		this.id_visita = id_visita;
	}

	public String getCosto_visita() {
		return costo_visita;
	}
	
	public String getNome_visita() {
		return nome_visita;
	}
	public void setNome_visita(String nome_visita) {
		this.nome_visita = nome_visita;
	}
	private String getSpecializzazione() {
		return this.specializzazione;
	}

	public TipologiaVisitaDTO(int id_visita, String nome_visita, String costo_visita, String specializzazione) {

		this.id_visita = id_visita;
		this.nome_visita = nome_visita;
		this.costo_visita = costo_visita;
		this.specializzazione = specializzazione;
	}

	public TipologiaVisitaDTO(int id_visita) {
		
		
		
		
		TipologiaVisitaDTO visita_tmp = new TipologiaVisitaDAO().getById(id_visita);	
		this.id_visita = id_visita;
		this.nome_visita = visita_tmp.getNome_visita();
		this.costo_visita = visita_tmp.getCosto_visita();
		this.specializzazione = visita_tmp.getSpecializzazione();
	}
	

	@Override
	public boolean equals(Object obj) {
		if(obj == null)
			return false;
		if (getClass()!= obj.getClass())
			return false;
		TipologiaVisitaDTO obj_visita = (TipologiaVisitaDTO) obj;
		if(obj_visita.getId_visita() != this.id_visita)
			return false;
		else 
			return true;

	}

}
