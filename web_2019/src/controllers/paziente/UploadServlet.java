package controllers.paziente;

import java.io.File;
import java.io.IOException;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dto.PazienteDTO;
import dto.PazienteDTO;
import utils.Logger;

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB

@WebServlet("/paziente/upload")


public class UploadServlet extends HttpServlet {

	private static final long serialVersionUID = -825683683812919950L;
	private static final String SAVE_DIR = "immagini_pazienti";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PazienteDTO user = (PazienteDTO) request.getSession().getAttribute("user");

		String appPath = request.getServletContext().getRealPath("");
		String savePath = appPath + SAVE_DIR;
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		for (Part part : request.getParts()) {
			Logger.log("part %s: ", part);
			String file_extension = extractFileExtension(part);
			if (file_extension != null){
				String fileName = String.format("%s_%s_%d%s",user.getNome(), user.getCognome(), user.getId(), file_extension);
				part.write(savePath + File.separator + fileName);
				user.setFoto_path(request.getServletContext().getContextPath() +File.separator + SAVE_DIR + File.separator + fileName);
				Logger.log("Caricata immagine %s", fileName);
				break;
			}
			Logger.log("");
		}
		response.sendRedirect(request.getContextPath() + "/paziente/dettagliPaziente.jsp");
	}

	private String extractFileExtension(Part part) {
		String extension = "img.jpg";
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.indexOf(".") != -1) {
				extension = s.substring(s.lastIndexOf("."), s.length()-1);
				Logger.log("Estensione: %s", extension);
				return extension;
			}

		}

		return null;
	}
}