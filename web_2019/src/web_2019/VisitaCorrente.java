package web_2019;

import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import dto.PazienteDTO;
import dto.TipologiaEsameDTO;
import dto.TipologiaVisitaDTO;
import dto.VisitaDTO;
import utils.Logger;

public class VisitaCorrente {
	private ArrayList<String> lista_prescrizioni = new ArrayList<String>();
	private ArrayList<TipologiaEsameDTO> lista_esami = new ArrayList<TipologiaEsameDTO>();
	private ArrayList<TipologiaVisitaDTO> lista_visite = new ArrayList<TipologiaVisitaDTO>();
	private ArrayList<VisitaDTO> visitePrenotate = new ArrayList<VisitaDTO>();
	PazienteDTO paziente; 
	public ArrayList<TipologiaVisitaDTO> getLista_visite() {
		return lista_visite;
	}

	private Integer id_medico;
	private int id_prenotazione_visita_corrente;


	public int getId_prenotazione_visita_corrente() {
		return id_prenotazione_visita_corrente;
	}

	public void setId_prenotazione_visita_corrente(int id_prenotazione_visita_corrente) {
		this.id_prenotazione_visita_corrente = id_prenotazione_visita_corrente;
	}

	public PazienteDTO getPaziente() {
		return paziente;
	}

	public void setPaziente(PazienteDTO paziente) {
		this.paziente = paziente;
	}

	public int getId_medico() {
		return id_medico;
	}

	public void setId_medico(int id_medico) {
		this.id_medico = id_medico;
	}

	public ArrayList<String> getLista_prescrizioni() {
		return lista_prescrizioni;
	}

	public ArrayList<TipologiaEsameDTO> getLista_esami() {
		return lista_esami;
	}

	public void aggiungiPrescrizione(String farmaco) {
		lista_prescrizioni.add(farmaco);		
	}

	public void aggiungiEsami(String[] id_esami) {

		for (String id_esame : id_esami) {
			int id = Integer.parseInt(id_esame);
			lista_esami.add(new TipologiaEsameDTO(id));
		}

	}

	public void setLista_visite(ArrayList<TipologiaVisitaDTO> lista_visite) {
		this.lista_visite = lista_visite;
	}

	public ArrayList<VisitaDTO> getVisitePrenotate() {
		return paziente.getVisitePrenotate(id_medico);
	}

	public void setLista_prescrizioni(ArrayList<String> lista_prescrizioni) {
		this.lista_prescrizioni = lista_prescrizioni;
	}

	public void setLista_esami(ArrayList<TipologiaEsameDTO> lista_esami) {
		this.lista_esami = lista_esami;
	}

	public void aggiungiVisite(String[] id_visite) {
		for (String id_visita : id_visite) {
			int id = Integer.parseInt(id_visita);
			lista_esami.add(new TipologiaEsameDTO(id));
		}

	}



	public JsonObject toJson() {
		JsonObject json = new JsonObject();

		JsonArray array_prescrizioni = new JsonArray();
		for (String prescrizione : lista_prescrizioni) {
			array_prescrizioni.add(prescrizione);	
		}
		json.add("lista_prescrizioni", array_prescrizioni);

		JsonArray array_esami = new JsonArray();
		for (TipologiaEsameDTO esame : lista_esami) {
			array_prescrizioni.add(esame.toJson());	
		}
		json.add("lista_esami", array_esami);

		JsonArray array_visite = new JsonArray();
		for (TipologiaVisitaDTO visita : lista_visite) {
			array_prescrizioni.add(visita.toJson());	
		}
		json.add("lista_esami", array_visite);


		Logger.log("JSON visita corrente, relativa alla  prenotazione %d: \n", id_prenotazione_visita_corrente, json.toString());
		return json;


	}

}
