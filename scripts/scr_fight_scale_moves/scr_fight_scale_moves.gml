
/// @description Aplica un factor de escala a todos los arrays en moves
/// @param moves El array 2D que contiene los arrays a escalar
/// @param scale_factor El factor de escala a aplicar a los valores

function scale_moves(moves, scale_factor) {
    // Crear un nuevo array para almacenar los resultados escalados
    var scaled_moves = [];
    
    // Recorrer cada array en moves
    for (var i = 0; i < array_length(moves); i++) {
        var move = moves[i];
        var scaled_move = [];
        
        // Recorrer cada fila en el array actual
        for (var j = 0; j < array_length(move); j++) {
            var row = move[j];
            var scaled_row = [];
            
            // Recorrer cada valor en la fila, excepto el segundo valor (índice 1)
            for (var k = 0; k < array_length(row); k++) {
                if (k != 1) {
                    scaled_row[k] = row[k] * scale_factor;
                } else {
                    scaled_row[k] = row[k]; // Dejar el segundo valor sin cambios
                }
            }
            
            // Añadir la fila escalada al nuevo array
            array_push(scaled_move, scaled_row);
        }
        
        // Añadir el array escalado al nuevo array de resultados
        array_push(scaled_moves, scaled_move);
    }
    
    // Devolver el nuevo array con los valores escalados
    return scaled_moves;
}