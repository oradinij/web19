package dto;

import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import dao.MedicoDAO;
import dao.PrescrizioneDAO;
import web_2019.Assets;


public class PrescrizioneDTO {


	private int id_prescrizione; 
	private int id_paziente; 
	private int id_medico; 
	private String data_ora; 
	private String data;
	private String farmaco;
	private int stato;
	private String nome_medico;






	public PrescrizioneDTO(int id_prescrizione, int id_paziente, int id_medico, String data_ora, String farmaco, Integer stato) {
		this.id_prescrizione = id_prescrizione;
		this.id_paziente = id_paziente;
		this.id_medico = id_medico;
		this.data_ora = data_ora;
		this.data=data_ora.split(" ")[0];
		this.farmaco = farmaco;
		this.stato = stato;
	}
	
	public PrescrizioneDTO() {
		
		
	}

	public JsonObject toJson (int id_ricetta) {
		
		JsonObject json = new PrescrizioneDAO().toJson(id_ricetta);
	
		return json;
		
	}
	
public JsonObject toJson () {
		
		JsonObject json = new PrescrizioneDAO().toJson(this.id_prescrizione);
	
		return json;
		
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

	
	public ArrayList <PrescrizioneDTO> getPrescrizioniByIdRiferimento(int id_riferimento){
		
		 ArrayList <PrescrizioneDTO> prescrizioni = new PrescrizioneDAO().getByRiferimento(id_riferimento);
		 return prescrizioni;
		
	}
	
	public int getId_medico() {
		return id_medico;
	}

	public String getData() {
		return data;
	}
	
	public String getData_ora() {
		return data_ora;
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