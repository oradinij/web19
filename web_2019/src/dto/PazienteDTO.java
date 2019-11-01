package dto;

import java.util.ArrayList;
import java.util.Date;

import dao.EsameDAO;
import dao.PazienteDAO;
import dao.PrescrizioneDAO;
import dao.VisitaDAO;

public class PazienteDTO {
	private int id;
	private int id_medico;		
	private String email;		
	private String nome;	
	private String cognome;
	private String codice_fiscale;	
	private String sesso;		
	private String data_nascita;		
	private String luogo_nascita;		
	private String foto_path;		
	private ArrayList<EsameDTO>  listaEsami = null;
	private ArrayList<VisitaDTO>  listaVisite = null;
	private ArrayList<PrescrizioneDTO>  listaPrescrizioni = null;
	private String dataUltimaVisita;


	public String getDataUltimaVisita() {
		ArrayList<VisitaDTO>listaVisite = getListaVisite();
		System.out.println("Dimensione lista visite: "+listaVisite.size());
		if(listaVisite.size()>0) {
			VisitaDTO ultimaVisita = listaVisite.get(listaVisite.size()-1);
			return ultimaVisita.getData().toString();
		}
		else return "Nessuna visita disponibile";
	}
	public void setDataUltimaVisita(String dataUltimaVisita) {this.dataUltimaVisita = dataUltimaVisita;}

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

	public int getId_medico() {return id_medico;}

	public void setFoto_path(String foto_path) {
		if (foto_path!= null) {
			new PazienteDAO().setFoto_path(this.id, foto_path);
			this.foto_path = foto_path;
		}
	}

	public PazienteDTO(int id_paziente, int id_medico, String codice_fiscale, String email, String luogo_nascita, String nome, String sesso,
			String data_nascita, String cognome, String foto_path) {
		this.id =id_paziente;
		this.id_medico = id_medico;
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
		return listaPrescrizioni;
	}
	public void setMedico(int id_medico) {
		this.id_medico = id_medico;
		new PazienteDAO().setMedico(getId(), id_medico);

	}
	public void AggiugiPrescrizione(String farmaco) {
		new PrescrizioneDAO().CreaPrescrizione(getId(), getId_medico(), farmaco);

	}
}
