// Feather disable all
/// @desc    Returns whether the player is a ghost
/// @param   [playerIndex=0]

function input_player_ghost_get(_player_index = 0)
{
    __INPUT_GLOBAL_STATIC_LOCAL  //Set static _global
    __INPUT_VERIFY_PLAYER_INDEX
    
    return _global.__players[_player_index].__ghost;
}
