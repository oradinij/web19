package dto;

import java.util.Date;

public class EsameDTO {

	private int id_esame;
	private int id_paziente;
	private int id_medico;
	private Date data;
	private String nomeEsame;
	private String referto;

	
	public EsameDTO(int id_esame, int id_paziente, int id_medico, Date data, String nomeEsame, String referto) {
		super();
		this.id_esame = id_esame;
		this.id_medico = id_medico;
		this.id_paziente = id_paziente;
		this.data = data;
		this.nomeEsame = nomeEsame;
		this.referto = referto;
	}
	
	public int getId_esame() {
		return id_esame;
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


}
