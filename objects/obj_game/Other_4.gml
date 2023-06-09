layer_set_visible("Col",false);
global.gamemode=global.room_data[global.currentroom][index.mode];

// Script to set global.current_room based on room_data

var roomName = room; // Get the current room's name
var arrayLength = array_length(global.room_data); // Get the length of the room_data array

for (var i = 0; i < arrayLength-1; i++) {
    if (global.room_data[i, index.name] == roomName) {
        global.currentroom = i;
        break; // Exit the loop once a match is found
    }
}

