package testdata;

import java.awt.GraphicsEnvironment;
import java.awt.Font;

public class CheckLibharfbuzz {
    public static void main(String[] args) {
        GraphicsEnvironment env = GraphicsEnvironment.getLocalGraphicsEnvironment();
        Font [] fonts = env.getAllFonts();
        if ( fonts.length > 0 ) {
            System.out.println(fonts.length + " fonts available");
        }
    }
}
