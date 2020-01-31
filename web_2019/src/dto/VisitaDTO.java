package dto;

import java.util.ArrayList;
import java.util.Date;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import dao.EsameDAO;
import dao.MedicoDAO;
import dao.VisitaDAO;

public class VisitaDTO {
	
	public JsonObject toJson() {
		JsonObject json = new JsonObject();
		json.addProperty("data",data.toString());
		json.addProperty("id_prenotazione",getId_prenotazione());
		json.addProperty("id_medico",getId_medico());
		json.addProperty("id_paziente",getId_paziente());
		json.addProperty("stato",getStato());
		json.addProperty("referto",getReferto());
		json.addProperty("nome_medico",getNome_medico());
		json.addProperty("cognome_medico",getCognome_medico());
		json.addProperty("luogo",getLuogo());
		json.addProperty("nome_visita", getNome_visita());
		return json;
	}
	
	
	
	
	
	public JsonObject jsonVisitaCompletata(int id_riferimento) {
		JsonObject json = new JsonObject();
		try {

		JsonArray array_ricette = new JsonArray();
		for (PrescrizioneDTO prescrizione : new PrescrizioneDTO().getPrescrizioniByIdRiferimento(id_riferimento)) {
			array_ricette.add(prescrizione.toJson());	
		}
		json.add("lista_prescrizioni", array_ricette);

		
		
		JsonArray array_esami = new JsonArray();
		for (EsameDTO esame : new EsameDTO().getEsamiByIdRiferimento(id_riferimento)) {
			array_esami.add(esame.toJson());	
		}
		json.add("lista_esami", array_esami);

		
		JsonArray array_visite =  new JsonArray();
		for (VisitaDTO visita : new VisitaDTO().getVisiteByIdRiferimento(id_riferimento)) {
			array_visite.add(visita.toJson());	
		}
		json.add("lista_visite", array_visite);
		
		

		//Logger.log("JSON visita corrente, relativa alla  prenotazione %d: \n", id_prenotazione_visita_corrente, json.getAsString());
		return json;
		}
		catch (Exception e) {
			
			e.printStackTrace();
			
			json.addProperty("Errore", "impossibile stapare il JSON");
			
			return json;
		}


	}
	
	
	public ArrayList <VisitaDTO> getVisiteByIdRiferimento(int id_riferimento){
		
		ArrayList <VisitaDTO> visite = new VisitaDAO().getByRiferimento(id_riferimento);
		 return visite;
		
		
	}
	

	public int getId_prenotazione() {
		return id_prenotazione;
	}


	public void setId_prenotazione(int id_prenotazione) {
		this.id_prenotazione = id_prenotazione;
	}


	public int getId_medico() {
		return id_medico;
	}


	public void setId_medico(int id_medico) {
		this.id_medico = id_medico;
	}


	public int getId_paziente() {
		return id_paziente;
	}


	public void setId_paziente(int id_paziente) {
		this.id_paziente = id_paziente;
	}


	public int getStato() {
		return stato;
	}


	public void setStato(int stato) {
		this.stato = stato;
	}


	public String getReferto() {
		return referto;
	}


	public void setReferto(String referto) {
		this.referto = referto;
	}


	public void setData(Date data) {
		this.data = data;
	}


	public Date getData() {
		return data;
	}

	
	private Date data;
	private int id_prenotazione;
	private int id_medico;
	private int id_paziente;
	private int stato;
	private String referto;
	private String nome_medico= null;
	private String cognome_medico= null;
	private String luogo;
	private Integer id_visita;
	private String nome_visita= null;
	
	public String getNome_medico() {
		if(nome_medico == null) nome_medico = new MedicoDAO().getUserById(id_medico).getNome();
		return nome_medico;
	}

	public String getCognome_medico() {
		if(cognome_medico == null) cognome_medico = new MedicoDAO().getUserById(id_medico).getCognome();
		return cognome_medico;
	}

	public Integer getId_visita() {
		return id_visita;
	}



	

	public String getNome_visita() {
		return nome_visita;
	}


	public String getLuogo() {
		return luogo;
	}



	public void setLuogo(String luogo) {
		this.luogo = luogo;
	}



	public VisitaDTO(int id_prenotazione, int id_medico, int id_paziente, int stato, String referto, Date data, Integer id_visita, String luogo, String nome_visita) {
		this.data = data;
		this.id_prenotazione = id_prenotazione;
		this.id_medico = id_medico;
		this.id_paziente = id_paziente;
		this.stato = stato;
		this.referto = referto;
		this.id_visita = id_visita;
		this.luogo = luogo;
		this.nome_visita = nome_visita;
	}


	public VisitaDTO(){
		
	}

	@Override
	public boolean equals(Object obj) {
		if(obj == null)
			return false;
		if (getClass()!= obj.getClass())
			return false;
		VisitaDTO obj_visita = (VisitaDTO) obj;
		if(obj_visita.getId_prenotazione() != this.id_prenotazione)
			return false;
		else 
			return true;

	}

	
	

	

}