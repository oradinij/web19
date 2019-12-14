package web_2019;

import java.util.ArrayList;

import dto.PazienteDTO;
import dto.TipologiaEsameDTO;

public class VisitaCorrente {
	private ArrayList<String> lista_prescrizioni = new ArrayList<String>();
	private ArrayList<TipologiaEsameDTO> lista_esami = new ArrayList<TipologiaEsameDTO>();
	PazienteDTO paziente;

	public PazienteDTO getPaziente() {
		return paziente;
	}

	public void setPaziente(PazienteDTO paziente) {
		this.paziente = paziente;
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

}
