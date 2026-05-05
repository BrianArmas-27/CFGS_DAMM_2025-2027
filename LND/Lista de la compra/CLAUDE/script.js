//Variables globales
const itemInput = document.getElementById('newItemInput');
const list = document.getElementById('itemsList');   
const addBtn = document.getElementById('addItemBtn');
//Funciones

//Añade el item generado por el usuario y los botones
function addItem() {
    const item = itemInput.value;
    if (item !== '') {
        const listItem = document.createElement('li');
        const spanMan = document.createElement('span');
        spanMan.textContent = item;
        listItem.appendChild(spanMan);
        list.appendChild(listItem);
        createButtons(listItem, spanMan);
        saveItem({ text: item, completed: false });
    }
    itemInput.value = '';
    itemInput.focus();
}
//Crea los botones para cada item
function createButtons(father,child)
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
    completeBtn.addEventListener('click', () => completedItem(child));
    deleteBtn.addEventListener('click', () => deleteItem(father));
}
//El item se "completa"
function completedItem(item) {
    item.classList.add('completed');
    updateItem(item, true);
}

function updateItem(item, completed) {
    const savedItems = JSON.parse(localStorage.getItem('items'));
    const updatedItems = savedItems.map(i => {
        if (i.text === item.textContent) {
            return { text: i.text, completed };
        }
        return i;
    });
    localStorage.setItem('items', JSON.stringify(updatedItems));
}
//El item desaparece
function deleteItem(item) {
    list.removeChild(item);
    deleteItemFromStorage(item.firstChild.textContent);
}
//El item desaparece definitivamente
function deleteItemFromStorage(text) {
    const savedItems = JSON.parse(localStorage.getItem('items'));
    const updatedItems = savedItems.filter(i => i.text !== text);
    localStorage.setItem('items', JSON.stringify(updatedItems));
}
//Cargar los elementos guardados en localStorage
function loadItems() {
    const savedItems = JSON.parse(localStorage.getItem('items'));
    if (savedItems) {
        savedItems.forEach(item => {
            const listItem = document.createElement('li');
            const spanMan = document.createElement('span');
            spanMan.textContent = item.text;
            listItem.appendChild(spanMan);
            list.appendChild(listItem);
            createButtons(listItem, spanMan);
            if (item.completed) {
                spanMan.classList.add('completed');
            }
        });
    }
}
//Guardar los elementos en localStorage
function saveItem(item) {
    const savedItems = JSON.parse(localStorage.getItem('items')) || [];
    savedItems.push(item);
    localStorage.setItem('items', JSON.stringify(savedItems));
}
//Añadiendo el funcionamiento
addBtn.addEventListener('click', addItem);

window.addEventListener('load', loadItems);