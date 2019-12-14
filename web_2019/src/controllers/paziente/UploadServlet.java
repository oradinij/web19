package controllers.paziente;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dto.PazienteDTO;

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
maxFileSize=1024*1024*10,      // 10MB
maxRequestSize=1024*1024*50)   // 50MB

@WebServlet("/paziente/upload")


public class UploadServlet extends HttpServlet {

	private static final long serialVersionUID = -825683683812919950L;
	private static final String SAVE_DIR = "uploadFiles";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PazienteDTO user = (PazienteDTO) request.getSession().getAttribute("user");

		String appPath = request.getServletContext().getRealPath("");
		String savePath = appPath + SAVE_DIR;
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}

		for (Part part : request.getParts()) {
			
			String fileName = extractFileName(part);
			fileName = new File(fileName).getName();
			if(fileName.length() > 0) {
				part.write(savePath + File.separator + fileName);
				user.setFoto_path(request.getServletContext().getContextPath() +File.separator + SAVE_DIR + File.separator + fileName);
			}
		}
		
		response.sendRedirect(request.getContextPath() + "/paziente/dettagliPaziente.jsp");
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length()-1);
			}
		}
		return "";
	}
}