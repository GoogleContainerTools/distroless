package testdata;

import java.nio.charset.Charset;
import java.util.Locale;

public class CheckEncoding {

  public static void main(String[] args) {
    System.out.println("LANG=" + System.getenv("LANG"));
    System.out.println("Locale.getDefault()=" + Locale.getDefault());
    System.out.println("Charset.defaultCharset()=" + Charset.defaultCharset());
    System.out.println("file.encoding=" + System.getProperty("file.encoding"));
    System.out.println("sun.jnu.encoding=" + System.getProperty("sun.jnu.encoding"));
  }
}
