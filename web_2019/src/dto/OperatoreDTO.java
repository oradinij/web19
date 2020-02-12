package dto;

import java.io.Serializable;
import java.util.ArrayList;

import dao.EsameDAO;
import dao.MedicoDAO;
import dao.OperatoreDAO;
import dao.PazienteDAO;
import dao.PrescrizioneDAO;
import dao.VisitaDAO;
import utils.Logger;
import web_2019.Assets;

public class OperatoreDTO implements Serializable{
	private int id;
	private String email;		
	private String nome;	
	private String cognome;
	private String codice_fiscale;	
	private String sesso;		
	private String data_nascita;		
	private String luogo_nascita;		
	private String foto_path;
	private String provincia;

	ArrayList<VisitaDTO> listaVisiteErogate; 
	ArrayList<EsameDTO> listaEsamiErogati;
	ArrayList<PrescrizioneDTO> listaRicetteErogate;

	public OperatoreDTO(int id_operatore, String codice_fiscale, String email, String luogo_nascita, String provincia, String nome, String sesso,
			String data_nascita, String cognome, String foto_path) {
		this.id =id_operatore;
		this.codice_fiscale = codice_fiscale;
		this.email = email;
		this.luogo_nascita = luogo_nascita;
		this.setProvincia(provincia);
		this.nome = nome;
		this.sesso = sesso;
		this.data_nascita = data_nascita;
		this.cognome = cognome;
		//se non c'e una foto uso un icona di default
		if (foto_path != null && foto_path.length()>0)
			this.foto_path = foto_path;
		else
			this.foto_path = "/web2019/uploadFiles/default_user.png"; 
		
		listaVisiteErogate = new OperatoreDAO().getVisiteSvolte();
		listaEsamiErogati = new OperatoreDAO().getEsamiSvolti();
		listaRicetteErogate = new OperatoreDAO().getRicetteErogate();
		
	}
	
	
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
			new OperatoreDAO().setFoto_path(this.id, foto_path);
			this.foto_path = foto_path;
		}
	}

	
	
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}


	public ArrayList<VisitaDTO> getListaVisiteErogate() {
		return listaVisiteErogate;
	}


	public void setListaVisiteErogate(ArrayList<VisitaDTO> listaVisiteErogate) {
		this.listaVisiteErogate = listaVisiteErogate;
	}


	public ArrayList<EsameDTO> getListaEsamiErogati() {
		return listaEsamiErogati;
	}


	public void setListaEsamiErogati(ArrayList<EsameDTO> listaEsamiErogati) {
		this.listaEsamiErogati = listaEsamiErogati;
	}


	public ArrayList<PrescrizioneDTO> getListaRicetteErogate() {
		return listaRicetteErogate;
	}


	public void setListaRicetteErogate(ArrayList<PrescrizioneDTO> listaRicetteErogate) {
		this.listaRicetteErogate = listaRicetteErogate;
	}


	public void setId(int id) {
		this.id = id;
	}
	
}
