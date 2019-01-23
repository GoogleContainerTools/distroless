package testdata;

import java.io.IOException;
import java.net.URL;
import javax.net.ssl.HttpsURLConnection;

public class CheckCerts {

  public static void main(String[] args) throws IOException {
    URL url = new URL("https://www.google.com/");
    HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
    conn.connect();
    conn.getServerCertificates(); // succeeds if peer verified

    System.out.println("Successfully connected: " + conn.getResponseCode());
  }
}
