/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej3excepciones;

import java.io.*;
import java.util.Scanner;

/**
 *
 * @author Brian Armas
 */
public class SumadorEnterosScanner
{
    private Scanner sc;

    public SumadorEnterosScanner(String nombre) throws IOException
    {
        sc = new Scanner(new File(nombre));
    }
    
    public int sumar()
    {
        int suma = 0;
        int numero = sc.nextInt();
        while(sc.hasNextInt())
        {
            suma += numero;
            numero = sc.nextInt();
        }
        sc.close();
        return suma;
    }
}
