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
		switch (tipo) {
		case SUCCESS:
			tipoStr= "success";
			break;
		case DANGER:
			tipoStr = "danger";
			break;
		case WARNING:
			tipoStr = "warning";
			break;
		default:
			tipoStr = "info";
		}
		return tipoStr;
	}

@Override
public boolean equals(Object obj) {
	if(!this.getClass().equals(obj.getClass()))
		return false;
	else {
		if (((Message) obj).getTesto()==this.getTesto() && ((Message)obj).getTipo() == this.getTipo())	return true;
		else return false;
	}
}


}
