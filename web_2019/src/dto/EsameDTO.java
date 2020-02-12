package dto;

import java.util.ArrayList;
import java.util.Date;

import com.google.gson.JsonObject;

import dao.EsameDAO;
import dao.MedicoDAO;
import dao.PrescrizioneDAO;
import web_2019.Assets;

public class EsameDTO {

	private int id_esame;
	private int id_prenotazione;
	private int id_riferimento;
	private int id_paziente;
	private int id_medico;
	private String data_ora;
	private String data;
	private String nomeEsame;
	private String area;
	private String referto;
	private int stato;
	private String nome_medico;
	private String cognome_medico;

	
	

	public EsameDTO(int id_esame, String area, int id_paziente, int id_medico, String data_ora, String nomeEsame, String referto, int id_prenotazione, int id_riferimento, int stato) {
		this.id_esame = id_esame;
		this.id_prenotazione = id_prenotazione;
		this.id_riferimento = id_riferimento;
		this.id_medico = id_medico;
		this.id_paziente = id_paziente;
		this.data_ora = data_ora;
		this.data = data_ora.split(" ")[0];
		this.nomeEsame = nomeEsame;
		this.setNome_medico(new MedicoDAO().getUserById(id_medico).getNome());
		this.setCognome_medico(new MedicoDAO().getUserById(id_medico).getCognome());
		this.referto = referto;
		this.stato = stato;
		this.area = area;
	}
	
	
	public EsameDTO() {
		
		
	}
	
	
public JsonObject toJson () {
		
		JsonObject json= new JsonObject();
		
		json.addProperty("nome_esame", getNomeEsame());
		json.addProperty("id_prenotazione", getId_prenotazione());
		json.addProperty("data", getData());
		json.addProperty("data_ora", getData_ora());
		json.addProperty("stato", getStato());
		json.addProperty("specializzazione", getArea());

		
		return json;
		
	}
	
	public String getData_ora() {
		return data_ora;
}


	public ArrayList <EsameDTO> getEsamiByIdRiferimento(int id_riferimento){
		
		 ArrayList <EsameDTO> esami = new EsameDAO().getByRiferimento(id_riferimento);
		 return esami;
		
	}
	
	public int getId_esame() {
		return id_esame;
	}
	public int getId_prenotazione() {
		return id_prenotazione;
	}
	public void setId_esame(int id_esame) {
		this.id_esame = id_esame;
	}
	public int getId_paziente() {
		return id_paziente;
	}
	public void setId_paziente(int id_paziente) {
		this.id_paziente = id_paziente;
	}
	public int getId_medico() {
		return id_medico;
	}
	
	
	public String getArea() {
		return new EsameDAO().getSpecializzazioneEsame(this.id_esame);
	}

	public void setArea(String area) {
		this.area= area;
	}
	
	public void setId_medico(int id_medico) {
		this.id_medico = id_medico;
	}

	public String getReferto() {
		return referto;
	}

	public void setReferto(String referto) {
		this.referto = referto;
	}

	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getNomeEsame() {
		return nomeEsame;
	}
	public void setNomeEsame(String nomeEsame) {
		this.nomeEsame = nomeEsame;
	}
	public int getMedico() {
		return id_medico;
	}
	public void setMedico(int medico) {
		this.id_medico = medico;
	}
	public int getStato() {
		return stato;
	}

	public void setStato(int stato) {
		this.stato = stato;
	}
	
	public String getBottone() {
		
		if (this.stato == Assets.DA_PRENOTARE)
			return "<button type='button' >Prenota ora </button>";
		else if (this.stato == Assets.PRENOTAZIONE_EFFETTUATA)
			return "<button type='button' >Dettagli </button> <button type='button' >Annulla</button>";
		else
			return "<button type='button' >Dettagli </button>";
		
	}


	public String getNome_medico() {
		return nome_medico;
	}


	public void setNome_medico(String nome_medico) {
		this.nome_medico = nome_medico;
	}


	public String getCognome_medico() {
		return cognome_medico;
	}


	public void setCognome_medico(String cognome_medico) {
		this.cognome_medico = cognome_medico;
	}


}
