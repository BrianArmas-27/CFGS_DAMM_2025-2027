//Variables
const form = document.getElementById("form");
const list = document.getElementById("lista-juegos");
let juegos = JSON.parse(localStorage.getItem('juegos')) || [];

//La magia
cargarJuegos();

form.addEventListener('submit', function(event) {
    event.preventDefault();

    const inNombre = document.getElementById("nombre").value;
    const inGenero = document.getElementById("genero").value;
    const inPlataforma = document.querySelector("input[name='plataforma']:checked").value;

    juegos.push({id:Date.now(), nombre: inNombre, genero: inGenero, plataforma: inPlataforma});
    localStorage.setItem('juegos',JSON.stringify(juegos));

    form.reset();

    addJuego(juegos[juegos.length-1]);
})

function cargarJuegos()
{
    list.innerHTML = '';
    juegos.forEach(juego => {
        addJuego(juego);
    })
}

function addJuego(juego)
{
    const dItem = `
    <li class="ficha-juego" id="${juego.id}">
        <span onclick="deleteJuego(${juego.id})">K</span>
        <div class="alineado-item">
            <span>Titulo</span>
            <span>${juego.nombre}</span>
        </div>
        <div class="alineado-item">
            <span>Genero</span>
            <span>${juego.genero}</span>
        </div>
        <div class="alineado-item">
            <span>Plataforma</span>
            <span>${juego.plataforma}</span>
        </div>
    </li>
    `
    list.innerHTML += dItem;
}
function deleteJuego(id)
{
    const listaAux = [];
    juegos.forEach(juego => {
        if (juego.id !== id)
        {
            listaAux.push(juego);
        }
    })
    juegos = listaAux;
    localStorage.setItem('juegos',JSON.stringify(juegos));
    cargarJuegos();
}