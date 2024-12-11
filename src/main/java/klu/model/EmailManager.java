package klu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailManager {
	@Autowired
	JavaMailSender mail;
	
	public String sendEmail(String fromEmail, String toEmail, String subject, String txt)
	{
		try
		{
			SimpleMailMessage msg = new SimpleMailMessage();
			msg.setFrom(fromEmail);
			msg.setTo(toEmail);
			msg.setSubject(subject);
			msg.setText(txt);
			
			mail.send(msg);
			return "Email sent successfully...";
		}catch (Exception e) 
		{
			return e.getMessage();
		}
	}
}
