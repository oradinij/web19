package dto;

import dao.MedicoDAO;
import web_2019.Assets;

public class PrescrizioneDTO {


	private int id_prescrizione; 
	private int id_paziente; 
	private int id_medico; 
	private String data; 
	private String farmaco;
	Integer stato;
	private String nome_medico;






	public PrescrizioneDTO(int id_prescrizione, int id_paziente, int id_medico, String data, String farmaco, Integer stato) {
		this.id_prescrizione = id_prescrizione;
		this.id_paziente = id_paziente;
		this.id_medico = id_medico;
		this.data = data;
		this.farmaco = farmaco;
		this.stato = stato;
	}

	public String getNome_medico() {
		MedicoDTO med = new MedicoDAO().getUserById(id_medico);
		return med.getNome() + " "+ med.getCognome();

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

	public String getData() {
		return data;
	}

	public String getFarmaco() {
		return farmaco;
	}

	public String getBottone() {
		if(this.stato == Assets.FARMACO_EROGATO)
			return "gia ritirato";
		else return "<a href = ./emettiPrescrizione.jsp>Emetti Prescrizione</a>";
	}
	public Integer getStato() {
		return stato;
	}

}