package dto;

import dao.TipologiaEsameDAO;

public class TipologiaEsameDTO {

	private int id_esame;
	private String nome_esame;

	public int getId_esame() {
		return id_esame;
	}
	public void setId_esame(int id_esame) {
		this.id_esame = id_esame;
	}
	public String getNome_esame() {
		return nome_esame;
	}
	public void setNome_esame(String nome_esame) {
		this.nome_esame = nome_esame;
	}

	public TipologiaEsameDTO(int id_esame, String nome_esame) {

		this.id_esame = id_esame;
		this.nome_esame = nome_esame;
	}
	public TipologiaEsameDTO(int id_esame) {
		this.id_esame = id_esame;
		this.nome_esame = new TipologiaEsameDAO().getNameById(id_esame);
	}
	@Override
	public boolean equals(Object obj) {
		if(obj == null)
			return false;
		if (getClass()!= obj.getClass())
			return false;
		TipologiaEsameDTO obj_esame = (TipologiaEsameDTO) obj;
		if(obj_esame.getId_esame() != this.id_esame)
			return false;
		else 
			return true;

	}

}
