package dto;


import com.google.gson.JsonObject;

import dao.TipologiaVisitaDAO;

public class TipologiaVisitaDTO {

	private int id_visita;
	private String nome_visita;
	private String costo_visita;

	public JsonObject toJson() {
		JsonObject json = new JsonObject();
		json.addProperty("id_visita", id_visita);
		json.addProperty("nome_visita", nome_visita);
		json.addProperty("costo_visita", costo_visita);
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

	public TipologiaVisitaDTO(int id_visita, String nome_visita, String costo_visita) {

		this.id_visita = id_visita;
		this.nome_visita = nome_visita;
		this.costo_visita = costo_visita;
	}

	public TipologiaVisitaDTO(int id_visita) {
		this.id_visita = id_visita;
		this.nome_visita = new TipologiaVisitaDAO().getNameById(id_visita);
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
