package dto;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.ArrayList;

import dao.MedicoDAO;
import dao.PrescrizioneDAO;
import dao.VisitaDAO;

public class MedicoDTO implements Serializable{
	private int id_medico;
	private ArrayList<PazienteDTO> listaPazienti = null;

	private String email;
	private int idSpecializzazione;
	private String nome;
	private String cognome;
	String telefono_studio;
	String telefono_cellulare;
	String struttura;
	String immagine;
	String provincia;

	public MedicoDTO(String email, int id, int idSpecializzazione, String nome, String cognome, String provincia, String telefono_studio, String telefono_cellulare, String immagine, String struttura) {
		this.email = email;
		this.id_medico = id;
		this.idSpecializzazione =idSpecializzazione;
		this.nome = nome;
		this.cognome = cognome;
		this.telefono_studio =telefono_studio;
		this.telefono_cellulare=telefono_cellulare;
		this.struttura=struttura;
		this.immagine = immagine;
		this.provincia = provincia;
	}
	
	
	
	public String getProvincia() {
		return provincia;
	}
	
	public String getNome() {
		return nome;
	}
	public String getCognome() {
		return cognome;
	}
	
	public String getEmail() {return email;}
	
	
	public int getId_medico() {return id_medico;}
	
	
	
	public String getTelefono_studio() {
		return telefono_studio;
	}


	public String getTelefono_cellulare() {
		return telefono_cellulare;
	}


	public String getStruttura() {
		return struttura;
	}


	public String getImmagine() {
		return immagine;
	}


	
	public ArrayList<PazienteDTO> getListaPazienti() {
		if(listaPazienti == null)
			this.listaPazienti = new MedicoDAO().getListaPazienti(id_medico, idSpecializzazione);
		return listaPazienti;
	}


	public PazienteDTO getPazienteById(int id_paziente) {
		for(PazienteDTO paziente : this.listaPazienti) {
			if(paziente.getId()== id_paziente)
				return paziente;
		}
		return null;		
	}
	
	public int getIdSpecializzazione() {
		return this.idSpecializzazione;
	}



}
