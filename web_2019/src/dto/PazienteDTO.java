package dto;

import java.io.Serializable;
import java.util.ArrayList;

import dao.EsameDAO;
import dao.MedicoDAO;
import dao.PazienteDAO;
import dao.PrescrizioneDAO;
import dao.VisitaDAO;
import utils.Logger;
import web_2019.Assets;

public class PazienteDTO implements Serializable{
	private int id;
	MedicoDTO medico;
	private String email;		
	private String nome;	
	private String cognome;
	private String codice_fiscale;	
	private String sesso;		
	private String data_nascita;		
	private String luogo_nascita;		
	private String foto_path;	

	private ArrayList<EsameDTO>  listaEsami = null;
	private ArrayList<EsameDTO>  lista_esami_da_prenotare = null;
	private ArrayList<EsameDTO>  lista_esami_prenotati = null;
	private ArrayList<EsameDTO>  lista_esami_svolti = null;

	private ArrayList<VisitaDTO>  listaVisite = null;
	private ArrayList<PrescrizioneDTO>  listaPrescrizioni = null;
	private String dataUltimaVisita;


	public PazienteDTO(int id_paziente, int id_medico, String codice_fiscale, String email, String luogo_nascita, String nome, String sesso,
			String data_nascita, String cognome, String foto_path) {
		this.id =id_paziente;
		this.medico = new MedicoDAO().getUserById(id_medico);
		this.codice_fiscale = codice_fiscale;
		this.email = email;
		this.luogo_nascita = luogo_nascita;
		this.nome = nome;
		this.sesso = sesso;
		this.data_nascita = data_nascita;
		this.cognome = cognome;
		//se non c'e una foto uso un icona di default
		if (foto_path != null && foto_path.length()>0)
			this.foto_path = foto_path;
		else
			this.foto_path = "/web2019/uploadFiles/default_user.png"; 
	}
	public String getDataUltimaVisita() {
		ArrayList<VisitaDTO>listaVisite = getListaVisite();
		if(listaVisite.size()>0) {
			VisitaDTO ultimaVisita = listaVisite.get(listaVisite.size()-1);
			return ultimaVisita.getData().toString();
		}
		else return "Nessuna visita disponibile"; 
	}
	public void setDataUltimaVisita(String dataUltimaVisita) {this.dataUltimaVisita = dataUltimaVisita;}

	public MedicoDTO getMedico() {return medico;}
	public void setMedico(MedicoDTO medico) {this.medico = medico;}


	public String getCodice_fiscale() {return codice_fiscale;}
	public void setCodice_fiscale(String codice_fiscale) {this.codice_fiscale = codice_fiscale;}

	public String getEmail() {return email;}
	public void setEmail(String email) {this.email = email;}

	public String getLuogo_nascita() {return luogo_nascita;}
	public void setLuogo_nascita(String luogo_nascita) {this.luogo_nascita = luogo_nascita;}

	public String getNome() {return nome;}
	public void setNome(String nome) {this.nome = nome;}

	public String getSesso() {return sesso;}
	public void setSesso(String sesso) {this.sesso = sesso;}

	public String getData_nascita() {return data_nascita;}
	public void setData_nascita(String data_nascita) {this.data_nascita = data_nascita;}

	public String getCognome() {return cognome;}
	public void setCognome(String cognome) {this.cognome = cognome;}

	public int getId() {return id;}	

	public String getFoto_path() {return this.foto_path;}

	public void setFoto_path(String foto_path) {
		if (foto_path!= null) {
			new PazienteDAO().setFoto_path(this.id, foto_path);
			this.foto_path = foto_path;
		}
	}
	public int getId_medico() {return this.getMedico().getId_medico();}



	public ArrayList<EsameDTO>  getListaEsami()
	{
		listaEsami = new EsameDAO().getListaEsamiByUserId(this.id);
		return listaEsami;
	}

	public ArrayList<VisitaDTO>  getListaVisite()
	{
		listaVisite = new VisitaDAO().getListaVisiteByUserId(this.id);
		return listaVisite;
	}

	public ArrayList<PrescrizioneDTO>  getListaPrescrizioni()
	{
		listaPrescrizioni = new PrescrizioneDAO().getListaPrescrizioniByUserId(this.id);
		if(listaPrescrizioni!= null)
			Logger.log("dim lista %d per id %d", listaPrescrizioni.size(), this.id);
		else
			Logger.log("lista NULL");
		return listaPrescrizioni;

	}
	/**
	 * Aggiorna il medico nell'oggetto corrente e nel database
	 * @param id_medico
	 */
	public void setMedico(int id_medico) {
		this.medico = new MedicoDAO().getUserById(id_medico);
		new PazienteDAO().setMedico(getId(), id_medico);

	}
	public PrescrizioneDTO aggiugiPrescrizioneFarmaco(String farmaco, int id_medico, String timestamp, int id_riferimento) {
		return new PrescrizioneDAO().creaPrescrizione(getId(), id_medico, farmaco, timestamp, id_riferimento);

	}

	public void aggiungiPrenotazioneEsame(int id_esame, int id_medico, String data, int id_riferimento) {
		new EsameDAO().creaPrenotazioneEsame(id_esame, this.getId(), data, id_medico, id_riferimento);
	}
	public void aggiungiPrenotazioneVisita(int id_visita, String data_ora, int id_medico, int id_riferimento) {
		int stato = Assets.DA_PRENOTARE;
		if(id_medico == getId_medico())
			stato = Assets.PRENOTAZIONE_EFFETTUATA;
		new VisitaDAO().creaPrenotazioneVisita(id_visita, this.getId(), id_medico, data_ora, stato, id_riferimento);//stato = 1 vuol dire prenotata

	}
	/**
	 * cerca nella lista visite relative al paziente quelle non ancora svolte, ma prenotate (stato = 1), relative al medico id_medico
	 */
	public ArrayList<VisitaDTO> getVisitePrenotate(int id_medico){
		ArrayList<VisitaDTO> visite_prenotate = new ArrayList<VisitaDTO>();
		for (VisitaDTO visita : listaVisite) {
			if(visita.getId_medico() == id_medico && visita.getStato() == Assets.PRENOTAZIONE_EFFETTUATA)
				visite_prenotate.add(visita);
		}
		return visite_prenotate;

	}
	/**
	 * cerca nella lista visite relative al paziente quelle da prenotare
	 */
	public ArrayList<VisitaDTO> getLista_visite_da_prenotare(){
		ArrayList<VisitaDTO> visite_da_prenotare = new ArrayList<VisitaDTO>();
		for (VisitaDTO visita : getListaVisite()) {
			if(visita.getStato() == Assets.DA_PRENOTARE)
				visite_da_prenotare.add(visita);
		}
		return visite_da_prenotare;

	}
	/**
	 * cerca nella lista visite relative al paziente quelle svolte
	 */
	public ArrayList<VisitaDTO> getLista_visite_svolte(){
		ArrayList<VisitaDTO> visite_svolte = new ArrayList<VisitaDTO>();
		for (VisitaDTO visita : getListaVisite()) {
			if(visita.getStato() == Assets.PRENOTAZIONE_SVOLTA)
				visite_svolte.add(visita);
		}
		return visite_svolte;

	}
	/**
	 * cerca nella lista visite relative al paziente quelle prenotate
	 */
	public ArrayList<VisitaDTO> getLista_visite_prenotate(){
		ArrayList<VisitaDTO> visite_prenotate = new ArrayList<VisitaDTO>();
		for (VisitaDTO visita : getListaVisite()) {
			if(visita.getStato() == Assets.PRENOTAZIONE_EFFETTUATA)
				visite_prenotate.add(visita);
		}
		return visite_prenotate;

	}





	/**
	 * cerca nella lista esami relative al paziente quelle prenotate
	 */
	public ArrayList<EsameDTO> getLista_esami_prenotati(){
		ArrayList<EsameDTO> esami_da_prenotare = new ArrayList<EsameDTO>();
		for (EsameDTO esame : getListaEsami()) {
			if(esame.getStato() == Assets.PRENOTAZIONE_EFFETTUATA)
				esami_da_prenotare.add(esame);
		}
		return esami_da_prenotare;

	}
	/**
	 * cerca nella lista esami quelli prenotati
	 */
	public ArrayList<EsameDTO> getLista_esami_da_prenotare(){
		ArrayList<EsameDTO> esami_prenotati = new ArrayList<EsameDTO>();
		for (EsameDTO esame : getListaEsami()) {
			if(esame.getStato() == Assets.DA_PRENOTARE)
				esami_prenotati.add(esame);
		}
		return esami_prenotati;

	}
	/**
	 * cerca nella lista esami relative al paziente quelli svolti
	 */
	public ArrayList<EsameDTO> getLista_esami_svolti(){
		ArrayList<EsameDTO> esami_svolti = new ArrayList<EsameDTO>();
		for (EsameDTO esame : getListaEsami()) {
			if(esame.getStato() == Assets.DA_PRENOTARE)
				esami_svolti.add(esame);
		}
		return esami_svolti;

	}

	/**
	 * cerca nella lista ricette relative al paziente quelle prenotate
	 */
	public ArrayList<PrescrizioneDTO> getLista_prescrizioni_erogate(){
		ArrayList<PrescrizioneDTO> prescrizioni_erogate = new ArrayList<>();
		for (PrescrizioneDTO prescrizione : getListaPrescrizioni()) {
			if(prescrizione.getStato() == Assets.FARMACO_EROGATO)
				prescrizioni_erogate.add(prescrizione);
		}
		return prescrizioni_erogate;
	}

	/**
	 * cerca nella lista ricette relative al paziente quelle prenotate
	 */
	public ArrayList<PrescrizioneDTO> getLista_prescrizioni_da_erogare(){
		ArrayList<PrescrizioneDTO> prescrizioni_da_erogare = new ArrayList<>();
		for (PrescrizioneDTO prescrizione : getListaPrescrizioni()) {
			if(prescrizione.getStato() == Assets.FARMACO_DA_EROGARE)
				prescrizioni_da_erogare.add(prescrizione);
		}
		return prescrizioni_da_erogare;
	}


	/**
	 * per le visite del medico di base lasiare referto = null, aggiorna la visita nel relativo DTO e nel database
	 * @param id
	 * @param referto
	 */
	public void completaVisita(int id, String referto) {
		new VisitaDAO().aggiornaStato(id, Assets.PRENOTAZIONE_SVOLTA);//stato visita = 2 = svolta, referto = null
		if(referto != null)
			new VisitaDAO().aggiornaReferto(id, referto);
		for (VisitaDTO visitaDTO : listaVisite) {
			if(visitaDTO.getId_prenotazione() == id);
			{
				visitaDTO.setStato(Assets.PRENOTAZIONE_EFFETTUATA);
				visitaDTO.setReferto(referto);
			}
		}

	}
}
