/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practicaexcepcionficheros2;
import java.io.*;
import java.util.Scanner;
/**
 *
 * @author elbri
 */
public class Teatro 
{
    public final int FILAS = 10;
    public final int ASIENTOS = 10;
    private boolean[][] teatro;

    public Teatro() 
    {
        this.teatro= new boolean[FILAS][ASIENTOS];
        inicializar();
    }
    
    public void inicializar()
    {
        for(int i=0;i<FILAS;i++)
        {
            for(int j=0;j<ASIENTOS;j++)
            {
                teatro[i][j] = false;
            }
        }
    }
    
    public void mostrarTeatro()
    {
        System.out.println(toString());
    }
    
    @Override
    public String toString()
    {
        StringBuffer salida = new StringBuffer();
        for(int i=0;i<FILAS;i++)
        {
            for(int j=0;j<ASIENTOS;j++)
            {
                if (teatro[i][j])
                {
                    salida.append("XX");
                }
                else
                {
                    salida.append("__");
                }
                salida.append(" ");
            }
            salida.append("\n");
        }
        return salida.toString();
    }
    
    public void guardarVendidos(String nomFic) throws IOException
    {
        try(PrintWriter salida = new PrintWriter(new BufferedWriter(new FileWriter(nomFic))))
        {
            for(int i=0;i<FILAS;i++)
            {
                for(int j=0;j<ASIENTOS;j++)
                {
                    String newLine = " ";
                    if(teatro[i][j])
                    {
                        newLine = i+":"+j;
                    }
                    salida.println(newLine);
                }
            }
        }
    }
    
    public void leerVendidos(String nomFic) throws IOException {
    File f = new File(nomFic);
    if (!f.exists()) return;
    Scanner sc = new Scanner(f);
    while (sc.hasNextLine()) {
        String linea = sc.nextLine().trim();
        if (!linea.isEmpty()) { 
            actualizarTeatro(procesarLinea(linea), 1);
        }
    }
}
    
    private Posicion procesarLinea(String linea)
    {
        String[] pos = linea.split(":");
        int fila = Integer.parseInt(pos[0]);
        int asiento = Integer.parseInt(pos[1]);
        return new Posicion(fila, asiento);
    }
    
    public void actualizarTeatro(Posicion pos, int entradas)
    {
        if(entradas >= 1)
            for(int i=0;i<entradas;i++)
                teatro[pos.getFila()][pos.getAsiento()+i] = true;
        else
            teatro[pos.getFila()][pos.getAsiento()] = false;
    }
    
    public boolean venderEntradas(int numEntradas)
    {
        Posicion posEncontrada = hayPlazasSeguidas(numEntradas);
        if (numEntradas < 1 || posEncontrada == null) {
            return false;
        }
        actualizarTeatro(posEncontrada, numEntradas);
        return true;
    }
    
    public Posicion hayPlazasSeguidas(int numEntradas)
    {
        for (int i = 0; i < FILAS; i++) {
            for (int j = 0; j <= ASIENTOS - numEntradas; j++) {
                int plazasLibres = 0;
                for (int k = 0; k < numEntradas; k++) {
                    if (!teatro[i][j + k]) {
                        plazasLibres++;
                    } else {
                        break;
                    }
                }
                if (plazasLibres == numEntradas) {
                    return new Posicion(i, j);
                }
            }
        }
        return null;
    }
}
