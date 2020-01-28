package dto;

import java.util.Date;

import com.google.gson.JsonObject;

import dao.MedicoDAO;

public class VisitaDTO {
	
	public JsonObject toJson() {
		JsonObject json = new JsonObject();
		json.addProperty("data",data.toString());
		json.addProperty("id_prenotazione",id_prenotazione);
		json.addProperty("id_medico",id_medico);
		json.addProperty("id_paziente",id_paziente);
		json.addProperty("stato",stato);
		json.addProperty("referto",referto);
		json.addProperty("nome_medico",nome_medico);
		json.addProperty("cognome_medico",cognome_medico);
		json.addProperty("luogo",luogo);
		return json;
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


	private String nome_visita= null;

	

	public String getNome_visita() {
		if(nome_visita == null)
			nome_visita = new TipologiaVisitaDTO(id_visita).getNome_visita();
		return nome_visita;
	}


	public String getLuogo() {
		return luogo;
	}



	public void setLuogo(String luogo) {
		this.luogo = luogo;
	}



	public VisitaDTO(int id_prenotazione, int id_medico, int id_paziente, int stato, String referto, Date data, Integer id_visita, String luogo) {
		this.data = data;
		this.id_prenotazione = id_prenotazione;
		this.id_medico = id_medico;
		this.id_paziente = id_paziente;
		this.stato = stato;
		this.referto = referto;
		this.id_visita = id_visita;
		this.luogo = luogo;
	}

	

}