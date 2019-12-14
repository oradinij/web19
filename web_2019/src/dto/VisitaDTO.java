package dto;

import java.util.Date;

public class VisitaDTO {
	
	

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
