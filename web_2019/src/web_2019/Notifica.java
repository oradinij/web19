package web_2019;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class Notifica {

	public static final int SUCCESS = 0;
	public static final int INFO = 1;
	public static final int DANGER = 2;
	public static final int WARNING =3;

	private String testo;
	private Integer tipo;
	private String tipoStr;

	public Notifica(String testo, Integer tipo) {

		this.testo = testo;
		this.tipo = tipo;
		this.tipoStr = getTipoStr();
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

}