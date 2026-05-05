/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej1excepciones;

import java.io.*;
/**
 *
 * @author Brian Armas
 */
public class Maximo {
    
    public int maximoSinExcepciones() throws FileNotFoundException, IOException
    {
        int valorMax = 0;
        BufferedReader lector = new BufferedReader(new FileReader("numeros.txt")) ;
        String valor = lector.readLine();
        while(valor!=null)
        {
            if(valorMax < Integer.parseInt(valor))
                valorMax = Integer.parseInt(valor);
            valor = lector.readLine();
        }
        return valorMax;
    }
    
    public int maximoConExcepciones()
    {
        int valorMax = 0;
        try
        {
            BufferedReader lector = new BufferedReader(new FileReader("numeros.txt")) ;
            String valor = lector.readLine();
            while(valor!=null)
            {
                if(valorMax < Integer.parseInt(valor))
                    valorMax = Integer.parseInt(valor);
                valor = lector.readLine();
            }
        } catch(IOException e)
        {
            System.out.println(e.getMessage());
        }
        finally{
            return valorMax;
        }
    }
}
