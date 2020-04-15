const db = require('../connection');

module.exports = {
    find,
    findById,
    findSteps
}

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes').where({ id }).first();
}

function findSteps(id) {
    return db('schemes').join('steps', 'schemes.id', 'steps.scheme_id').select('steps.id', 'schemes.scheme_name', 'steps.step_number', 'steps.instructions').where('schemes.id', "=", id).orderBy('steps.step_number');
}


// add(scheme):
//     Expects a scheme object.
//     Inserts scheme into the database.
//     Resolves to the newly inserted scheme, including id.
// update(changes, id):
//     Expects a changes object and an id.
//     Updates the scheme with the given id.
//     Resolves to the newly updated scheme object.
// remove(id):
//     Removes the scheme object with the provided id.
//     Resolves to the removed scheme
//     Resolves to null on an invalid id.
//     (Hint: Only worry about removing the scheme. The database is configured to automatically remove all associated steps.)
