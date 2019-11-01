package dto;

import java.util.Date;

public class PrescrizioneDTO {
	

	private int id_prescrizione; 
	private int id_paziente; 
	private int id_medico; 
	private Date data; 
	private String farmaco;
	
	public PrescrizioneDTO(int id_prescrizione, int id_paziente, int id_medico, Date data, String farmaco) {
		this.id_prescrizione = id_prescrizione;
		this.id_paziente = id_paziente;
		this.id_medico = id_medico;
		this.data = data;
		this.farmaco = farmaco;
	}
	public int getId_prescrizione() {
		return id_prescrizione;
	}

	public int getId_paziente() {
		return id_paziente;
	}

	public int getId_medico() {
		return id_medico;
	}

	public Date getData() {
		return data;
	}

	public String getFarmaco() {
		return farmaco;
	}



}
