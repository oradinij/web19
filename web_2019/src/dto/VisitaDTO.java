package dto;

import java.util.Date;

public class VisitaDTO {
	
	

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


	private Date data;
	private int id_prenotazione;
	private int id_medico;
	private int id_paziente;
	private int stato;
	private String referto;

	public Date getData() {
		return data;
	}


	public VisitaDTO(int id_prenotazione, int id_medico, int id_paziente, int stato, String referto, Date data) {
		this.data = data;
		this.id_prenotazione = id_prenotazione;
		this.id_medico = id_medico;
		this.id_paziente = id_paziente;
		this.stato = stato;
		this.referto = referto;
	}
	

}
