//Variables globales
const itemInput = document.getElementById('newItemInput');
const list = document.getElementById('itemsList');   
const addBtn = document.getElementById('addItemBtn');

// --- NUEVO: Cargar datos al iniciar la aplicación ---
document.addEventListener('DOMContentLoaded', loadTasks);

//Funciones

// MODIFICADO: Ahora puede recibir texto y estado (para la carga inicial)
function addItem(text = null, isCompleted = false) {
    const item = text || itemInput.value; // Usa el texto pasado o el del input

    if(item != '') {
        const listItem = document.createElement('li');
        const spanMan = document.createElement('span');
        spanMan.textContent = item;
        
        // Si al cargar ya estaba completado, le ponemos la clase
        if (isCompleted) spanMan.classList.add('completed');
        
        listItem.appendChild(spanMan);
        list.appendChild(listItem);
        
        createButtons(listItem, spanMan);
        
        // NUEVO: Guardar cada vez que añadimos
        saveTasks();
    }
    itemInput.value = '';
    itemInput.focus();
}

function createButtons(father, child) {
    const completeBtn = document.createElement('button');
    completeBtn.classList.add('completeBtn');
    completeBtn.textContent = '✔';
    father.appendChild(completeBtn);

    const deleteBtn = document.createElement('button');
    deleteBtn.classList.add('deleteBtn');
    deleteBtn.textContent = '⌫';
    father.appendChild(deleteBtn);

    completeBtn.addEventListener('click', () => completedItem(child));
    deleteBtn.addEventListener('click', () => deleteItem(father));
}

function completedItem(item) {
    item.classList.toggle('completed'); // MODIFICADO: toggle es mejor para marcar/desmarcar
    saveTasks(); // NUEVO: Guardar estado tachado
}

function deleteItem(item) {
    list.removeChild(item);
    saveTasks(); // NUEVO: Guardar tras eliminar
}

// --- NUEVO: Función para guardar en LocalStorage ---
function saveTasks() {
    const tasks = [];
    // Recorremos todos los elementos de la lista actual
    list.querySelectorAll('li').forEach(li => {
        tasks.push({
            text: li.querySelector('span').textContent,
            completed: li.querySelector('span').classList.contains('completed')
        });
    });
    // Convertimos el array a un String JSON y guardamos
    localStorage.setItem('myTasks', JSON.stringify(tasks));
}

// --- NUEVO: Función para cargar los datos almacenados ---
function loadTasks() {
    const savedTasks = JSON.parse(localStorage.getItem('myTasks')) || [];
    savedTasks.forEach(task => {
        addItem(task.text, task.completed);
    });
}

//Añadiendo el funcionamiento
addBtn.addEventListener('click', () => addItem());