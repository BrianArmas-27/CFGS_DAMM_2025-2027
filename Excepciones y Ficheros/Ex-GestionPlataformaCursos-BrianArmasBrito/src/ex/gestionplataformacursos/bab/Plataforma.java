/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ex.gestionplataformacursos.bab;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

/**
 *
 * @author Brian Armas
 */
public class Plataforma 
{
    private ArrayList<Estudiante> estudiantes;
    private HashMap<String,Integer> calificaciones;

    /**
     * Constructor. Solo inicializa estudiantes y calificaciones
     */
    public Plataforma() 
    {
        estudiantes = new ArrayList<>();
        calificaciones = new HashMap<>();
    }
    
    /**
     * Registra un estudiante a la plataforma usando buscarEstudiante(). Si el estudiante no existe, se añade.
     * @param e
     * @return 
     */
    public boolean registrarEstudiante(Estudiante e)
    {
        boolean anadido=!buscarEstudiante(e.getEmail());
        if(anadido)
        {
            estudiantes.add(e);
            System.out.println("Estudiante con email "+e.getEmail()+ " anadido correctamente");
        }
        else
            System.out.println("Error: el estudiante ya existe");
        return anadido;
    }
    
    /**
     * Matricula a un estudiante según su email en un curso. No usa buscarEstudiante() porque necesitamos al alumno.
     * @param email
     * @param curso
     * @return 
     */
    public boolean matricularEnCurso(String email, String curso)
    {
        boolean existe=false;
        Estudiante matricular=null;
        for(Estudiante es:estudiantes)
        {
            if(es.getEmail().equals(email))
            {
                existe=true;
                matricular=es;
            }
        }
        if(existe)
        {
            matricular.anadirCurso(curso);
            System.out.println("Estudiante con email "+email+" matriculado en curso "+curso+" correctamente");
        }
        else
            System.out.println("Error: estudiante no encontrado");
        return existe;
    }
    
    /**
     * Muestra los estudiantes por pantalla usando for each
     */
    public void mostrarEstudiantesForEach()
    {
        for(Estudiante e:estudiantes)
            System.out.println(e);
    }
    
    /**
     * Muestra los estudiantes por pantalla usando iterator
     */
    public void mostrarEstudiantesIterator()
    {
        Iterator<Estudiante> it = estudiantes.iterator();
        while(it.hasNext())
        {
            System.out.println(it.next());
        }
    }
    
    /**
     * Pone una nota final a un estudiante usando buscarEstudiante()
     * @param email
     * @param nota 
     */
    public void asignarNota(String email, int nota)
    {
        boolean existe = buscarEstudiante(email);
        if(existe)
        {
            calificaciones.put(email, nota);
            System.out.println("Notas anadidas correctamente a email "+email);
        }
        else
            System.out.println("Error: estudiante no encontrado");
    }
    /**
     * Muestra los emails y las notas de todos los estudiantes registrados
     */
    public void mostrarNotas()
    {
        int i=1;
        for(String e:calificaciones.keySet())
        {
            System.out.println("Estudiante "+i);
            System.out.println("Email: "+e);
            System.out.println("Nota: "+calificaciones.get(e));
            i++;
        }
    }
    /**
     * Devuelve un HashSet que tiene todos los cursos a los que se han matriculado todos los estudiantes registrados
     * @return 
     */
    public HashSet<String> obtenerTodosLosCursos()
    {
        HashSet<String> salida = new HashSet<>();
        HashSet<String> cursosAlmacen = new HashSet<>();
        for(Estudiante e:estudiantes)
        {
            cursosAlmacen = e.getCursos();
            for(String c:cursosAlmacen)
                salida.add(c);
        }
        return salida;
    }
    
    /**
     * Método adicional para no rehacer código. Devuelve true si el estudiante está registrado en la plataforma
     * @param email
     * @return 
     */
    public boolean buscarEstudiante(String email)
    {
        boolean existe=false;
        for(Estudiante es:estudiantes)
        {
            if(es.getEmail().equals(email))
                existe=true;
        }
        return existe;
    }
}
