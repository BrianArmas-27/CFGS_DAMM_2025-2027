/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej1exc;
import java.io.*;
/**
 *
 * @author Brian Armas
 */
public class Maximo {

    public Maximo(){}
    
    public int maximoSinExcepciones() throws FileNotFoundException, IOException
    {
        BufferedReader entrada = new BufferedReader(new FileReader("numeros.txt"));
        String linea = entrada.readLine();
        int maximo = Integer.MIN_VALUE;
        boolean check = false;
        while(linea!=null)
        {
            int numeroActual = Integer.parseInt(linea.trim());
            if (numeroActual > maximo) {
                maximo = numeroActual;
            }
            check = true;
            linea = entrada.readLine();
        }
        entrada.close();

        if (!check) {
            throw new IOException("El fichero está vacío.");
        }
        return maximo;
    }
       
}
