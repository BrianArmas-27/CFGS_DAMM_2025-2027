/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practicaexcepcionficheros2;

import java.util.Scanner;
import java.io.*;

/**
 *
 * @author elbri
 */
public class GestorTeatro {
    private static final int MAX_ENTRADAS = 5;
    private static final int VENTA_ENTRADAS = 1;
    private static final int MOSTRAR_TEATRO = 2;
    private static final int SALIR = 3;
    private static final String NOMBRE_FIC = "teatro.txt";
    private Teatro teatro;
    private Scanner teclado;

    public GestorTeatro(Teatro teatro) throws IOException
    {
        this.teatro = teatro;
        teclado = new Scanner(System.in);
        teatro.leerVendidos(NOMBRE_FIC);
    }
    
    private int menu() {
        System.out.println("\n--- MENÚ TEATRO ---");
        System.out.println(VENTA_ENTRADAS + ". Vender entradas");
        System.out.println(MOSTRAR_TEATRO + ". Mostrar situación teatro");
        System.out.println(SALIR + ". Salir");
        System.out.print("Elija una opción: ");
        return teclado.nextInt();
    }

    public void venderEntradas() throws IOException {
        int opcion;
        do {
            opcion = menu();
            switch (opcion) {
                case VENTA_ENTRADAS: vender(); break;
                case MOSTRAR_TEATRO: mostrar(); break;
                case SALIR: salir(); break;
                default: System.out.println("Opción no válida.");
            }
        } while (opcion != SALIR);
    }

    private void vender() {
        System.out.print("¿Cuántas entradas desea (máximo " + MAX_ENTRADAS + ")?: ");
        int num = teclado.nextInt();

        if (numeroCorrecto(num)) {
            if (teatro.venderEntradas(num)) {
                System.out.println("Venta realizada con éxito.");
            } else {
                System.out.println("No se ha podido realizar la venta (no hay plazas suficientes juntas).");
            }
        } else {
            System.out.println("Número de entradas incorrecto.");
        }
    }

    private boolean numeroCorrecto(int n) {
        return n > 0 && n <= MAX_ENTRADAS;
    }

    private void mostrar() {
        teatro.mostrarTeatro();
    }

    private void salir() throws IOException {
        System.out.println("Guardando datos y saliendo...");
        teatro.guardarVendidos(NOMBRE_FIC);
    }
}
