package testdata;

import java.net.MalformedURLException;
import java.net.URL;
import java.security.cert.Certificate;
import java.io.*;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLPeerUnverifiedException;



public class CheckCerts {
    public static void main(String[] args) {
        String https_url = "https://www.google.com/";
        URL url;
  
        try {
            url = new URL(https_url);
            HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
            con.connect();

            Certificate[] certs = con.getServerCertificates();
            System.out.println("Successfully connected");

        } catch (Exception exception) {
            exception.printStackTrace();
        }

    }
}
