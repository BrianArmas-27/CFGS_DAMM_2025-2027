/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej2excepciones;

import java.io.*;
/**
 *
 * @author Brian Armas
 */
public class GestorArrays
{
    private int[] numeros;
    private int elem;
    private String nombre;
    private BufferedReader fichero;
    private PrintWriter ficheroSalida;

    public GestorArrays(String nombre, int maxElem) throws IOException
    {
        this.nombre = nombre;
        if(maxElem > 0)
            numeros = new int[maxElem];
        else
            throw new ArgumentoIncorrectoException(maxElem);
        fichero = new BufferedReader(new FileReader(nombre));
        
    }
    
    public void cargarArray() throws IOException
    {
        String numero = fichero.readLine();
        int i = 0;
        while(numero!=null)
        {
            numeros[i] = Integer.parseInt(numero);
            numero = fichero.readLine();
            i++;
        }
        fichero.close();
    }
    
    public void duplicarArray()
    {
        for(int i = 0; i<numeros.length; i++)
        {
            numeros[i] *= 2;
        }
    }
    
    public void volcarArray() throws IOException
    {
        ficheroSalida = new PrintWriter(new BufferedWriter(new FileWriter(nombre)));
        for(int i = 0; i<numeros.length; i++)
        {
            ficheroSalida.print(numeros[i]);
        }
        ficheroSalida.close();
    }
}
