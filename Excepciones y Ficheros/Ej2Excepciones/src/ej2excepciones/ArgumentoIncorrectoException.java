/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ej2excepciones;

/**
 *
 * @author Brian Armas
 */
public class ArgumentoIncorrectoException extends RuntimeException 
{
    private int valor;

    public ArgumentoIncorrectoException(int valor) {
        super("El tamaño del array ("+valor+") no puede ser menor o igual que 0");
        this.valor = valor;
    }

    public int getValor() {
        return valor;
    }
}
