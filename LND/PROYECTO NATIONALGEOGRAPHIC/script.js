//Variables
const botonCargarNoticias = document.getElementById("noticiasController");
const botonCargarPublicacion = document.getElementById("publicacionController");
const noticiasHTML = document.getElementById("noticiasVarias").innerHTML;
const listaNoticias = document.getElementById("noticiasVarias");
const publicacionHTML = document.getElementById("publicarNoticias").innerHTML;
const formPublicacion = document.getElementById("publicarNoticias");
let isNoticiasShown = true;
let isPublicacionShown = true;

//Enseñar noticias por pantalla
botonCargarNoticias.addEventListener('click', () => {
    isNoticiasShown=!isNoticiasShown;
    if(isNoticiasShown) {
        listaNoticias.innerHTML = noticiasHTML;      
        botonCargarNoticias.innerHTML=`Ocultar Noticias`;
    } else {
        listaNoticias.innerHTML = ``;
        botonCargarNoticias.innerHTML=`Mostrar Noticias`;
    }
})

//Enseñar formulario de publicacion por pantalla
botonCargarPublicacion.addEventListener('click', () => {
    isPublicacionShown=!isPublicacionShown;
    if(isPublicacionShown) {
        formPublicacion.innerHTML = publicacionHTML;      
    } else {
        formPublicacion.innerHTML = ``;
    }
})