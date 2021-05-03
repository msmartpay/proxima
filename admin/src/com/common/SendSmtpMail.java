package com.common;

import java.security.Security;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.net.ssl.internal.ssl.Provider;
//import java.io.*;
import java.lang.String;
public class SendSmtpMail
{

	public static String mailerId=null;
	public static String mailerPassword=null;

	public static String  sendSSLMessage(String recipients[], String subject,String message1,String from,String id,String password) throws MessagingException
	{
		boolean debug = true;
		try {

			mailerId=id;
			mailerPassword=password;

			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");

			Session session = Session.getDefaultInstance(props,
					new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(mailerId,mailerPassword);
				}
			});

			session.setDebug(debug);

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setContent(message1,"text/html");

			InternetAddress addressTo[] = new InternetAddress[recipients.length];
			for(int i = 0; i < recipients.length; i++)
				addressTo[i] = new InternetAddress(recipients[i]);


			message.setRecipients(javax.mail.Message.RecipientType.TO, addressTo);

			message.setRecipients(Message.RecipientType.TO, addressTo);

			message.setSubject(subject);
			//message.setText(message1);


			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			e.printStackTrace();
		}


		return "MailSuccesfullysend";


	}
	
	public static String  sendSSLMessage(String recipients[], String subject,String message1,String from) throws MessagingException
	{

		boolean debug = true;
		try {
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");

			Session session = Session.getDefaultInstance(props,
					new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("support@softsolutionzone.in","supp@09895");
				}
			});

			session.setDebug(debug);

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("support@softsolutionzone.in"));
			message.setContent(message1,"text/html");

			InternetAddress addressTo[] = new InternetAddress[recipients.length];
			for(int i = 0; i < recipients.length; i++)
				addressTo[i] = new InternetAddress(recipients[i]);


			message.setRecipients(javax.mail.Message.RecipientType.TO, addressTo);

			message.setRecipients(Message.RecipientType.TO, addressTo);

			message.setSubject(subject);
			//message.setText(message1);


			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			e.printStackTrace();
		}


		return "MailSuccesfullysend";


	}
	public static String sendSSLMessageBCC(String recipients[],String ccrecipients[], String bccrecipients[], String subject, String message, String from,String id,String password)
			throws MessagingException
	{
		boolean debug = true;
		String sendStatus = null;
		mailerId=id;
		mailerPassword=password;

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mailerId,mailerPassword);
			}
		});

		session.setDebug(debug);
		Message msg = new MimeMessage(session);
		InternetAddress addressFrom = new InternetAddress(from);
		msg.setFrom(addressFrom);
		InternetAddress addressTo[] = new InternetAddress[recipients.length];
		for(int i = 0; i < recipients.length; i++)
			addressTo[i] = new InternetAddress(recipients[i]);

		InternetAddress addressBCC[] = new InternetAddress[bccrecipients.length];
		for(int i = 0; i < recipients.length; i++)
			addressBCC[i] = new InternetAddress(bccrecipients[i]);

		msg.setRecipients(javax.mail.Message.RecipientType.BCC, addressBCC);
		msg.setRecipients(javax.mail.Message.RecipientType.TO, addressTo);
		msg.setSubject(subject);
		msg.setContent(message, "text/html");
		try
		{
			Transport.send(msg);
			Security.addProvider(new Provider());
			sendStatus = "MailSuccesfullysend";
		}
		catch(Exception e)
		{
			System.out.println((new StringBuilder("Exception in sending mail  ")).append(e).toString());
		}
		return sendStatus;
	}


}