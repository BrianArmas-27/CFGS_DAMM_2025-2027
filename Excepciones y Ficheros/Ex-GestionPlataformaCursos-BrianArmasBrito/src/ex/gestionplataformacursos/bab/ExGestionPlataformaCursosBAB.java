/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ex.gestionplataformacursos.bab;

import java.util.HashSet;

/**
 *
 * @author Brian Armas
 */
public class ExGestionPlataformaCursosBAB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) 
    {
        //Plataforma
        Plataforma elRincon = new Plataforma();
        //Estudiantes
        Estudiante est1 = new Estudiante("mario@gmail.com",18);
        Estudiante est2 = new Estudiante("pepe@hotmail.com",19);
        Estudiante est3 = new Estudiante("sergio@outlook.es",18);
        Estudiante est4 = new Estudiante("maria@proton.me",20);
        Estudiante est5 = new Estudiante("cualigendi@gmail.com",37);
        //Registrar estudiantes en la plataforma
        System.out.println(" Registrando estudiantes");
        System.out.println(elRincon.registrarEstudiante(est1));
        System.out.println(elRincon.registrarEstudiante(est2));
        System.out.println(elRincon.registrarEstudiante(est3));
        System.out.println(elRincon.registrarEstudiante(est4));
        System.out.println(elRincon.registrarEstudiante(est5));
        //Matriculacion en distintos cursos
        System.out.println("\n Matriculando estudiantes");
        System.out.println(elRincon.matricularEnCurso("mario@gmail.com", "DAM"));
        System.out.println(elRincon.matricularEnCurso("pepe@hotmail.com", "DAW"));
        System.out.println(elRincon.matricularEnCurso("sergio@outlook.es", "DAW"));
        System.out.println(elRincon.matricularEnCurso("maria@proton.me", "SSF"));
        System.out.println(elRincon.matricularEnCurso("cualigendi@gmail.com", "Bellas Artes"));
        //Asignar notas
        System.out.println("\n Asignando notas a estudiantes");
        elRincon.asignarNota("mario@gmail.com", 9);
        elRincon.asignarNota("pepe@hotmail.com", 7);
        elRincon.asignarNota("sergio@outlook.es", 8);
        elRincon.asignarNota("maria@proton.me", 6);
        elRincon.asignarNota("cualigendi@gmail.com", 3);
        //Mostrar notas
        System.out.println("\n Notas de estudiantes matriculados");
        elRincon.mostrarNotas();
        //Mostrar cursos
        System.out.println("\n Cursos disponibles: ");
        HashSet<String> cursos = elRincon.obtenerTodosLosCursos();
        for(String c:cursos)
            System.out.println(c);
        //Pruebas adicionales (no salen en el examen B)
        System.out.println("\nPRUEBAS ADICIONALES\n");
        //Mostrar estudiantes
        System.out.println("\n Estudiantes for:each");
        elRincon.mostrarEstudiantesForEach();
        System.out.println("\n Estudiantes Iterator");
        elRincon.mostrarEstudiantesIterator();
        //Registrar estudiantes con email copiado
        Estudiante copiaEst1 = new Estudiante("mario@gmail.com",9);
        System.out.println("\n Anadiendo un estudiante copia");
        System.out.println(elRincon.registrarEstudiante(copiaEst1));
        //Ejecutar erróneamente los métodos
        System.out.println("\n Ejecutando metodos de forma erronea");
        System.out.println(elRincon.matricularEnCurso("iafoahsosaji", "Metro"));
        elRincon.asignarNota("uauauauaua", 9999);
    }
    
}
