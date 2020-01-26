package web_2019;

public class Message {

	public static final int SUCCESS = 0;
	public static final int INFO = 1;
	public static final int DANGER = 2;
	public static final int WARNING =3;

	private String testo;
	private Integer tipo;
	private String tipoStr;

	public Message(String testo, Integer tipo) {

		this.testo = testo;
		this.tipo = tipo;
	}


	public String getTesto() {
		return testo;
	}
	
	public Integer getTipo() {
		return tipo;
	}

	public String getTipoStr() {
		switch (this.tipo) {
		case SUCCESS:
			tipoStr= "success";
		case DANGER:
			tipoStr = "danger";
		case WARNING:
			tipoStr = "warning";		

		default:
			tipoStr = "info";
		}
		return tipoStr;
	}




}
