/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ex.gestionplataformacursos.bab;

import java.util.HashSet;

/**
 *
 * @author Brian Armas
 */
public class Estudiante
{
    private String email;
    private int edad;
    private HashSet<String> cursos;

    /**
     * Constructos. Inicializa cursos y da valor a email y a edad
     * @param email
     * @param edad 
     */
    public Estudiante(String email, int edad) 
    {
        this.email = email;
        this.edad = edad;
        this.cursos = new HashSet<>();
    }
    
    /**
     * Añade un curso a un estudiante si no está matriculado en el anteriormente
     * @param curso
     * @return 
     */
    public boolean anadirCurso(String curso)
    {
        boolean salida=cursos.contains(curso);
        if(!salida)
            cursos.add(curso);
        return !salida;    
    }

    /**
     * Accesor a email
     * @return 
     */
    public String getEmail()
    {
        return email;
    }

    /**
     * Accesor a cursos
     * @return 
     */
    public HashSet<String> getCursos() 
    {
        return cursos;
    }

    /**
     * toString(). Hecho con StringBuilder.
     * @return 
     */
    @Override
    public String toString() 
    {
        StringBuilder salida = new StringBuilder();
        salida.append("Email de alumno: ").append(email).append("\n");
        salida.append("Edad de alumno: ").append(edad).append("\n");
        salida.append("Cursos:\n");
        for(String c:cursos)
        {
            salida.append(c).append("\n");
        }
        System.out.println("");
        return salida.toString();
    }
    
    
}
