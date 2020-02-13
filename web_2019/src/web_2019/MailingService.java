package web_2019;

import java.io.ByteArrayOutputStream;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.InternetHeaders;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource; 

public class MailingService { 
	private static final String SMTP_HOST_NAME = "smtp.gmail.com";
	private static final int SMTP_HOST_PORT = 465;
	private static final String SMTP_AUTH_USER = "apssweb19@gmail.com";
	private static final String SMTP_AUTH_PWD  =  "web2019apss"; 

	public static void sendTo(String to, String subject, String text, ByteArrayOutputStream attachment, String filename) throws Exception {

		Properties props = new Properties();

		props.put("mail.transport.protocol", "smtps");
		props.put("mail.smtps.host", SMTP_HOST_NAME);
		props.put("mail.smtps.auth", "true");
		// props.put("mail.smtps.quitwait", "false");

		Session mailSession = Session.getDefaultInstance(props);
		//mailSession.setDebug(true);
		Transport transport = mailSession.getTransport();

		MimeMessage message = new MimeMessage(mailSession);
		message.setSubject(subject);
		message.setRecipient(Message.RecipientType.TO, InternetAddress.parse(to)[0]);
		
		InternetHeaders headers = new InternetHeaders();
		headers.addHeader("Content-type", "text/html; charset=UTF-8");
	
		MimeBodyPart body = new MimeBodyPart(headers, text.getBytes("UTF-8"));
		Multipart multipartNoAtt = new MimeMultipart();
		multipartNoAtt.addBodyPart(body);
		message.setContent(multipartNoAtt);
		

		if(attachment!=null) {
			BodyPart messageBodyPart = new MimeBodyPart();
			Multipart multipart = new MimeMultipart();
			messageBodyPart = new MimeBodyPart();
			DataSource dataSource = new ByteArrayDataSource(attachment.toByteArray(),  "application/pdf");

			messageBodyPart.setDataHandler(new DataHandler(dataSource));
			messageBodyPart.setFileName(filename);
			multipart.addBodyPart(messageBodyPart);

			message.setContent(multipart);

		}
		transport.connect
		(SMTP_HOST_NAME, SMTP_HOST_PORT, SMTP_AUTH_USER, SMTP_AUTH_PWD);


		transport.sendMessage(message, message.getRecipients(Message.RecipientType.TO));
		transport.close();

	} 
}
