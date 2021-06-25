package in.co.sunrays.project4.utility;

import java.util.HashMap;

public class EmailBuilder {
	public static String getUserRegistrationMessage(HashMap<String, String> map) {
        StringBuilder msg = new StringBuilder();

        msg.append("<HTML><BODY>");
        msg.append("Registration is successful for Asteroid");
        msg.append("<H1>Hi! Greetings from Asteroid Systems!</H1>");
        msg.append("<P>Congratulations for registering on Asteroid! You can now access your asteroid account online - anywhere, anytime and enjoy the flexibility to check the Marksheet Details.</P>");
        msg.append("<P>Log in today at <a href='https://mail.google.com/mail/u/0/#inbox'>http://asteroid.systems.com</a> with your following credentials:</P>");
        msg.append("<P><B>Login Id : " + map.get("login") + "<BR>"
                + " Password : " + map.get("password") + "</B></p>");

        msg.append("<P> As a security measure, we recommended that you change your password after you first log in.</p>");
        msg.append("<p>For any assistance, please feel free to call us at +91 98273 60504 or 0731-4249244 helpline numbers.</p>");
        msg.append("<p>You may also write to us at hrd@asteroid.co.in.</p>");
        msg.append("<p>We assure you the best service at all times and look forward to a warm and long-standing association with you.</p>");
        msg.append("</BODY></HTML>");

        return msg.toString();
    }

	public static String getForgetPasswordMessage(HashMap<String,String> map)
	{
		 StringBuilder msg = new StringBuilder();

	        msg.append("<HTML><BODY>");
	        msg.append("<H1>Your password is reccovered !! " + map.get("firstName")
	                + " " + map.get("lastName") + "</H1>");
	        
	        msg.append("<P><B>To access account user Login Id : "
	                + map.get("login") + "<BR>" + " Password : "
	                + map.get("password") + "</B></p>");
	        msg.append("</BODY></HTML>");

	        return msg.toString();
	    
	}
	public static String getChangePasswordMessage(HashMap<String, String> map) {
        StringBuilder msg = new StringBuilder();

        msg.append("<HTML><BODY>");
        msg.append("<H1>Your Password has been changed Successfully !! "
                + map.get("firstName") + " " + map.get("lastName") + "</H1>");
        
        msg.append("<P><B>To access account user Login Id : "
                + map.get("login") + "<BR>" + " Password : "
                + map.get("password") + "</B></p>");
        msg.append("</BODY></HTML>");

        return msg.toString();
    }
}
