package web_2019;

import java.util.ArrayList;

import dao.TipologiaVisitaDAO;
import dto.PazienteDTO;
import dto.TipologiaEsameDTO;
import dto.TipologiaVisitaDTO;
import dto.VisitaDTO;

public class VisitaCorrente {
	private ArrayList<String> lista_prescrizioni = new ArrayList<String>();
	private ArrayList<TipologiaEsameDTO> lista_esami = new ArrayList<TipologiaEsameDTO>();
	private ArrayList<VisitaDTO> visitePrenotate = new ArrayList<VisitaDTO>();
	PazienteDTO paziente; 
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

	public ArrayList<VisitaDTO> getVisitePrenotate() {
		return paziente.getVisitePrenotate(id_medico);
	}

}
