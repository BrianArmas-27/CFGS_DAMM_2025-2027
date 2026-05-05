/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package practicaexcepcionficheros2;
import java.io.*;
/**
 *
 * @author elbri
 */
public class AppGestionTeatro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        GestorTeatro gt = new GestorTeatro(new Teatro());
        gt.venderEntradas();
    }
    
}
