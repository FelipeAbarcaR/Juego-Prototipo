{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "roomViejoSabio",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_1F84E163","path":"rooms/roomViejoSabio/roomViejoSabio.yy",},
    {"name":"inst_3DF4D06","path":"rooms/roomViejoSabio/roomViejoSabio.yy",},
    {"name":"inst_174223BD","path":"rooms/roomViejoSabio/roomViejoSabio.yy",},
    {"name":"inst_52D8B190","path":"rooms/roomViejoSabio/roomViejoSabio.yy",},
    {"name":"inst_5D8639F5","path":"rooms/roomViejoSabio/roomViejoSabio.yy",},
    {"name":"inst_71765E47","path":"rooms/roomViejoSabio/roomViejoSabio.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_1","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-852,-2147483648,-4,662,-116,-2147483648,-4,662,-116,-2147483648,-4,662,-116,-2147483648,-4,662,-6944,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_MapaInicial","path":"tilesets/ts_MapaInicial/ts_MapaInicial.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Collisions","depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":200,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1F84E163","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_questie","path":"objects/obj_questie/obj_questie.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"prnt_entity","path":"objects/prnt_entity/prnt_entity.yy",},"propertyId":{"name":"EntityActivateScript","path":"objects/prnt_entity/prnt_entity.yy",},"value":"startDialogue",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"prnt_entity","path":"objects/prnt_entity/prnt_entity.yy",},"propertyId":{"name":"EntityActivateArgs","path":"objects/prnt_entity/prnt_entity.yy",},"value":"[array_first(global.dialogue_order[$ \"obj_questie\"])]",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":224.0,"y":96.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3DF4D06","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_room_exit","path":"objects/obj_room_exit/obj_room_exit.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_room_exit","path":"objects/obj_room_exit/obj_room_exit.yy",},"propertyId":{"name":"RoomName","path":"objects/obj_room_exit/obj_room_exit.yy",},"value":"\"roomMapaInicialAle\"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_room_exit","path":"objects/obj_room_exit/obj_room_exit.yy",},"propertyId":{"name":"RoomTargetX","path":"objects/obj_room_exit/obj_room_exit.yy",},"value":"1368",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_room_exit","path":"objects/obj_room_exit/obj_room_exit.yy",},"propertyId":{"name":"RoomTargetY","path":"objects/obj_room_exit/obj_room_exit.yy",},"value":"1506",},
          ],"rotation":0.0,"scaleX":2.0,"scaleY":1.0,"x":224.0,"y":256.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_174223BD","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"depth_sorter","path":"objects/depth_sorter/depth_sorter.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":-32.0,"y":80.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_52D8B190","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"o_player","path":"objects/o_player/o_player.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":224.0,"y":192.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Col2","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":135,"SerialiseWidth":240,"TileCompressedData":[
-60,0,-180,-2147483648,-60,0,-180,-2147483648,-60,0,-180,-2147483648,-60,0,-180,-2147483648,-14,6,-2,0,-28,6,-16,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-26,0,1,6,-16,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-26,0,1,6,-16,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-26,0,1,6,-16,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-26,0,-9,6,-8,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-34,0,1,6,-8,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-34,0,1,6,-8,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-34,0,1,6,-8,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-34,0,1,6,-8,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-34,0,1,6,-8,0,-180,-2147483648,1,6,-12,0,-4,6,-34,0,1,6,-8,0,-180,-2147483648,1,6,-50,0,1,6,-8,0,-180,-2147483648,1,6,-50,0,1,6,-8,0,-180,-2147483648,1,6,-50,0,1,6,-8,0,-180,-2147483648,1,6,-50,0,1,6,-8,0,-180,-2147483648,-17,6,-34,0,1,6,-8,
0,-180,-2147483648,-16,0,1,6,-34,0,1,6,-8,0,-180,-2147483648,-16,0,1,6,-34,0,1,6,-8,0,-180,-2147483648,-17,6,-34,0,1,6,-8,0,-180,-2147483648,1,6,-42,0,-9,6,-8,0,-180,-2147483648,1,6,-42,0,1,6,-16,0,-180,-2147483648,1,6,-42,0,1,6,-16,0,-180,-2147483648,1,6,-42,0,1,6,-16,0,-180,-2147483648,1,6,-42,0,1,6,-16,0,-180,-2147483648,1,6,-42,0,1,6,-16,0,-180,-2147483648,-24,6,-8,0,-12,6,-16,0,-180,-2147483648,-60,0,-25140,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tilesCol2","path":"tilesets/tilesCol2/tilesCol2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_walls","depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-30,0,-90,-2147483648,-30,0,-90,-2147483648,13,0,100,101,102,154,155,156,0,154,100,101,102,154,-3,155,6,210,155,102,155,155,156,-8,0,-90,-2147483648,13,0,118,119,120,172,173,174,0,172,118,119,120,172,-3,173,6,228,173,120,173,173,174,-8,0,-90,-2147483648,-22,0,4,154,155,156,155,-4,0,-90,-2147483648,-7,0,1,208,-14,0,4,172,173,174,173,-4,0,-90,-2147483648,-7,0,1,226,-22,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,8,0,100,101,102,210,208,210,
208,-22,0,-90,-2147483648,8,0,118,119,120,228,226,228,226,-22,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-6210,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_borders_1","depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-30,0,-90,-2147483648,1,19,-6,22,1,0,-14,22,-8,0,-90,-2147483648,1,73,-29,0,-90,-2147483648,1,73,-21,0,-4,22,-4,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,3,163,274,274,-4,166,1,274,-18,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,
-21,0,-4,130,-4,0,-90,-2147483648,1,73,-21,0,1,79,-7,0,-90,-2147483648,1,73,-21,0,1,79,-7,0,-90,-2147483648,-12,130,-4,0,-6,130,-8,0,-90,-2147483648,-30,0,-6210,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_borders","depth":600,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-30,0,-90,-2147483648,-7,22,1,0,-14,22,1,32,-7,0,-90,-2147483648,1,73,-21,0,1,50,-7,0,-90,-2147483648,1,73,-21,0,-4,22,1,32,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,3,66,22,22,-4,130,1,22,-18,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,
-3,0,-90,-2147483648,1,73,-21,0,-4,130,1,68,-3,0,-90,-2147483648,1,73,-21,0,1,79,-7,0,-90,-2147483648,1,73,-21,0,1,79,-7,0,-90,-2147483648,1,66,-11,130,-4,0,-6,130,-8,0,-90,-2147483648,-30,0,-6210,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_floor","depth":700,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-30,0,-90,-2147483648,-30,0,-90,-2147483648,1,0,-6,15,1,0,-14,15,-8,0,-90,-2147483648,1,0,-5,15,2,24,0,-14,15,-8,0,-90,-2147483648,1,0,-6,15,1,0,-18,15,-4,0,-90,-2147483648,1,0,-5,15,2,24,0,-18,15,-4,0,-90,-2147483648,1,0,-6,15,1,0,-18,15,-4,0,-90,-2147483648,1,0,-5,15,1,24,-19,15,-4,0,-90,-2147483648,1,0,-25,15,-4,0,-90,-2147483648,1,0,-25,15,-4,0,-90,-2147483648,-8,0,-18,15,-4,0,-90,-2147483648,1,0,-25,15,-4,0,-90,-2147483648,1,0,-21,15,-8,0,
-90,-2147483648,1,0,-21,15,-8,0,-90,-2147483648,1,0,-11,15,-4,0,-6,15,-8,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-6210,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio_walls","path":"tilesets/ts_int_ViejoSabio_walls/ts_int_ViejoSabio_walls.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Control","depth":800,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5D8639F5","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_game","path":"objects/obj_game/obj_game.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":-32.0,"y":144.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_71765E47","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_beat","path":"objects/obj_beat/obj_beat.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":-32.0,"y":176.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":900,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "0",
    "path": "folders/Rooms/0.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 1080,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 1920,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":270,"hspeed":-1,"hview":0,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":480,"wview":0,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":768,"hspeed":-1,"hview":768,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1366,"wview":1366,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": false,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}