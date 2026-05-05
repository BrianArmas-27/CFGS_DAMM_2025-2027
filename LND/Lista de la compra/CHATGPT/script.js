//Variables globales
const itemInput = document.getElementById('newItemInput');
const list = document.getElementById('itemsList');   
const addBtn = document.getElementById('addItemBtn');

let items = JSON.parse(localStorage.getItem('items')) || []; // NUEVO

//Funciones

//Guardar en localStorage
function saveItems(){ // NUEVO
    localStorage.setItem('items', JSON.stringify(items));
}

//Añade el item generado por el usuario y los botones
function addItem()
{
    const item=itemInput.value;
    if(item!='')
    {
        items.push({text:item, completed:false}); // NUEVO
        saveItems(); // NUEVO
        renderList(); // NUEVO
    }
    itemInput.value='';
    itemInput.focus();
}

//Crea los botones para cada item
function createButtons(father,child,index) // MODIFICADO
{
    //Inicializando botones
    const completeBtn = document.createElement('button');
    completeBtn.classList.add('completeBtn');
    completeBtn.textContent = '✔';
    father.appendChild(completeBtn);

    const deleteBtn = document.createElement('button');
    deleteBtn.classList.add('deleteBtn');
    deleteBtn.textContent = '⌫';
    father.appendChild(deleteBtn);

    //Dándoles un listener
    completeBtn.addEventListener('click', () => completedItem(index)); // MODIFICADO
    deleteBtn.addEventListener('click', () => deleteItem(index)); // MODIFICADO
}

//El item se tacha
function completedItem(index) // MODIFICADO
{
    items[index].completed = true; // NUEVO
    saveItems(); // NUEVO
    renderList(); // NUEVO
}

//El item desaparece
function deleteItem(index) // MODIFICADO
{
    items.splice(index,1); // NUEVO
    saveItems(); // NUEVO
    renderList(); // NUEVO
}

//Renderizar la lista
function renderList(){ // NUEVO
    list.innerHTML = '';

    items.forEach((item,index)=>{
        const listItem = document.createElement('li');

        const spanMan = document.createElement('span');
        spanMan.textContent = item.text;

        if(item.completed){
            spanMan.classList.add('completed');
        }

        listItem.appendChild(spanMan);
        list.appendChild(listItem);

        createButtons(listItem,spanMan,index);
    });
}

//Añadiendo el funcionamiento
addBtn.addEventListener('click', addItem);

//Cargar lista al iniciar
renderList(); // NUEVO