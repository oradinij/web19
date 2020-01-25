package dto;

import java.util.Date;

import web_2019.Assets;

public class EsameDTO {

	private int id_esame;
	private int id_prenotazione;
	private int id_paziente;
	private int id_medico;
	private Date data;
	private String nomeEsame;
	private String area;
	private String referto;
	private int stato;

	
	

	public EsameDTO(int id_esame, String area, int id_paziente, int id_medico, Date data, String nomeEsame, String referto, int id_prenotazione, int stato) {
		this.id_esame = id_esame;
		this.id_prenotazione = id_prenotazione;
		this.id_medico = id_medico;
		this.id_paziente = id_paziente;
		this.data = data;
		this.nomeEsame = nomeEsame;
		this.referto = referto;
		this.stato = stato;
		this.area = area;
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
		return area;
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

	public Date getData() {
		return data;
	}
	public void setData(Date data) {
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


}
