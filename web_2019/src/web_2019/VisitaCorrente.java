package web_2019;

import java.util.ArrayList;

public class VisitaCorrente {
	private ArrayList<String> lista_prescrizioni = new ArrayList<String>();
	private ArrayList<Integer> lista_esami = new ArrayList<Integer>();
	
	public ArrayList<String> getLista_prescrizioni() {
		return lista_prescrizioni;
	}

	public ArrayList<Integer> getLista_esami() {
		return lista_esami;
	}
	
	public void aggiungiPrescrizione(String farmaco) {
		lista_prescrizioni.add(farmaco);		
	}
	
	public void aggiungiEsame(String[] id_esami) {
		
		for (String id_esame : id_esami) {
			int id = Integer.parseInt(id_esame);
			lista_esami.add(id);
			
		}		
	}

}

public VisitaCorrente() {
}