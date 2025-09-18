// Simula la base de datos JSON en el navegador usando localStorage
const DB_KEY = 'pacientesDB';

// Función para inicializar o cargar la base de datos
const getDB = () => {
    const data = localStorage.getItem(DB_KEY);
    return data ? JSON.parse(data) : [];
};

// Función para guardar los cambios en la base de datos
const saveDB = (db) => {
    localStorage.setItem(DB_KEY, JSON.stringify(db));
};

// --- Operaciones CRUD ---

// CREATE
const crearPaciente = (nuevoPaciente) => {
    const db = getDB();
    db.push(nuevoPaciente);
    saveDB(db);
};

// READ
const leerPacientes = () => {
    return getDB();
};

const leerPacientePorId = (id) => {
    const db = getDB();
    return db.find(paciente => paciente.id === id);
};

// UPDATE
const actualizarPaciente = (id, nuevosDatos) => {
    const db = getDB();
    const index = db.findIndex(paciente => paciente.id === id);
    if (index !== -1) {
        db[index] = { ...db[index], ...nuevosDatos };
        saveDB(db);
        return true;
    }
    return false;
};

// DELETE
const eliminarPaciente = (id) => {
    let db = getDB();
    const newDb = db.filter(paciente => paciente.id !== id);
    if (newDb.length < db.length) {
        saveDB(newDb);
        return true;
    }
    return false;
};

// Ejemplo de uso
const nuevoPaciente = { id: 'TICKET-0005', nombre: 'Juan', doctor: 'Dr. Lopez', casoEspecial: 'no', fechaRegistro: new Date().toLocaleString() };
crearPaciente(nuevoPaciente);
console.log('Pacientes después de agregar:', leerPacientes());

actualizarPaciente('TICKET-0005', { fechaAtencion: new Date().toLocaleString() });
console.log('Paciente actualizado:', leerPacientePorId('TICKET-0005'));