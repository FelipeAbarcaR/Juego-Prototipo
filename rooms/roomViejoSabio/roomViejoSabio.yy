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
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Collisions","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":100,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
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
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"Effect_1","depth":200,"effectEnabled":true,"effectType":"_filter_contrast","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_ContrastIntensity","type":0,"value":"0.95",},
        {"name":"g_ContrastBrightness","type":0,"value":"0.8",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Col2","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":135,"SerialiseWidth":240,"TileCompressedData":[
-60,0,-180,-2147483648,-60,0,-180,-2147483648,-60,0,-180,-2147483648,-60,0,-180,-2147483648,-14,6,-2,0,-28,6,-16,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-26,0,1,6,-16,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-26,0,1,6,-16,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-21,0,1,6,-4,0,1,6,-16,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-21,0,-14,6,-8,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-34,0,1,6,-8,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-34,0,1,6,-8,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-27,0,1,6,-6,0,1,6,-8,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-27,0,-4,6,-3,0,1,6,-8,0,-180,-2147483648,1,6,-12,0,4,6,0,0,6,-17,0,-2,6,-15,0,1,6,-8,0,-180,-2147483648,1,6,-12,0,-4,6,-17,0,-2,6,-15,0,1,6,-8,0,-180,-2147483648,1,6,-50,0,1,6,-8,0,-180,-2147483648,1,6,-50,0,1,6,-8,0,-180,-2147483648,1,6,-50,0,1,6,-8,
0,-180,-2147483648,1,6,-50,0,1,6,-8,0,-180,-2147483648,-17,6,-34,0,1,6,-8,0,-180,-2147483648,-16,0,1,6,-34,0,1,6,-8,0,-180,-2147483648,-16,0,1,6,-34,0,1,6,-8,0,-180,-2147483648,-17,6,-34,0,1,6,-8,0,-180,-2147483648,1,6,-42,0,-9,6,-8,0,-180,-2147483648,1,6,-42,0,1,6,-16,0,-180,-2147483648,1,6,-42,0,1,6,-16,0,-180,-2147483648,1,6,-42,0,1,6,-16,0,-180,-2147483648,1,6,-42,0,1,6,-16,0,-180,-2147483648,1,6,-42,0,1,6,-16,0,-180,-2147483648,-24,6,-8,0,-12,6,-16,0,-180,-2147483648,-60,0,-25140,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tilesCol2","path":"tilesets/tilesCol2/tilesCol2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_deco2","depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-260,-2147483648,1,53,-119,-2147483648,1,62,-122,-2147483648,1,53,-119,-2147483648,1,62,-113,-2147483648,1,3,-119,-2147483648,1,12,-7302,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio_walls","path":"tilesets/ts_int_ViejoSabio_walls/ts_int_ViejoSabio_walls.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_deco","depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-366,-2147483648,1,53,-12,-2147483648,-3,3,-100,-2147483648,10,6,7,8,-2147483648,62,-2147483648,-2147483648,9,10,11,-7,-2147483648,-3,12,-100,-2147483648,3,15,16,17,-4,-2147483648,3,18,19,20,-10,-2147483648,-2,3,-98,-2147483648,3,24,25,26,-12,-2147483648,1,3,-4,-2147483648,-2,12,-98,-2147483648,3,33,34,35,-12,-2147483648,2,21,22,-118,-2147483648,2,30,31,-7181,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio_walls","path":"tilesets/ts_int_ViejoSabio_walls/ts_int_ViejoSabio_walls.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_walls","depth":600,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-30,0,-90,-2147483648,1,19,-6,22,1,0,-14,22,-8,0,-90,-2147483648,22,73,90,91,92,151,151,91,0,90,91,92,150,90,91,92,150,150,90,91,92,151,151,-8,0,-90,-2147483648,22,73,110,111,112,171,171,111,0,110,111,112,170,110,111,112,170,170,110,111,112,171,171,-4,22,-4,0,-90,-2147483648,1,73,-21,0,5,151,90,91,92,79,-3,0,-90,-2147483648,1,73,-21,0,5,171,110,111,112,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-6,0,1,210,-18,0,1,79,
-3,0,-90,-2147483648,1,73,-6,0,1,230,-18,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,2,163,274,-24,0,1,79,-3,0,-90,-2147483648,8,73,90,91,92,151,90,91,92,-18,0,1,79,-3,0,-90,-2147483648,8,73,110,111,112,171,110,111,112,-14,0,-4,130,-4,0,-90,-2147483648,1,73,-21,0,1,79,-7,0,-90,-2147483648,1,73,-21,0,1,79,-7,0,-90,-2147483648,-12,130,-4,0,-6,130,-8,0,-90,-2147483648,-30,0,-6210,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_borders2","depth":700,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-127,-2147483648,1,161,-8032,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_borders1","depth":800,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-30,0,-90,-2147483648,-7,0,1,167,-22,0,-90,-2147483648,-30,0,-90,-2147483648,4,0,118,119,120,-13,0,1,173,-12,0,-90,-2147483648,-30,0,-90,-2147483648,-23,0,2,173,174,-5,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,1,281,-6,257,1,175,-22,0,-90,-2147483648,-30,0,-90,-2147483648,-5,0,3,226,228,226,-22,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-6210,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_borders","depth":900,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-30,0,-90,-2147483648,1,1,-6,166,1,0,-14,166,1,167,-7,0,-90,-2147483648,1,21,-6,0,1,217,-14,0,1,276,-7,0,-90,-2147483648,1,21,-6,0,1,217,-14,0,1,296,-3,164,1,167,-3,0,-90,-2147483648,1,21,-6,0,1,217,-18,0,1,227,-3,0,-90,-2147483648,1,21,-6,0,1,217,-18,0,1,227,-3,0,-90,-2147483648,1,21,-6,0,1,177,-18,0,1,227,-3,0,-90,-2147483648,1,21,-25,0,1,227,-3,0,-90,-2147483648,1,21,-25,0,1,227,-3,0,-90,-2147483648,1,61,-25,0,1,227,-3,0,
-90,-2147483648,1,1,-7,13,-18,0,1,227,-3,0,-90,-2147483648,1,21,-25,0,1,227,-3,0,-90,-2147483648,1,21,-21,0,1,256,-3,257,1,287,-3,0,-90,-2147483648,1,21,-21,0,1,227,-7,0,-90,-2147483648,1,21,-21,0,1,227,-7,0,-90,-2147483648,1,281,-11,282,-4,0,-6,284,1,287,-7,0,-90,-2147483648,-30,0,-6210,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_floor","depth":1000,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-30,0,-90,-2147483648,-30,0,-90,-2147483648,1,0,-6,15,1,0,-14,15,-8,0,-90,-2147483648,1,0,-5,15,2,24,0,-14,15,-8,0,-90,-2147483648,2,0,272,-4,270,3,272,0,272,-7,270,1,272,-5,270,-4,15,-4,0,-90,-2147483648,2,0,292,-4,290,3,292,0,292,-3,290,1,292,-3,290,1,292,-5,290,-4,15,-4,0,-90,-2147483648,4,0,270,270,272,-3,270,8,0,270,270,272,270,270,272,272,-8,270,3,272,270,270,-4,0,-90,-2147483648,4,0,290,290,292,-3,290,8,15,290,290,292,290,290,292,
292,-8,290,3,292,290,290,-4,0,-90,-2147483648,1,0,-4,270,3,272,270,15,-10,270,1,272,-7,270,-4,0,-90,-2147483648,1,0,-6,290,1,15,-18,290,-4,0,-90,-2147483648,-8,0,-3,270,1,272,-5,270,1,272,-8,270,-4,0,-90,-2147483648,1,0,-7,15,-3,290,1,292,-9,290,1,292,-4,290,-4,0,-90,-2147483648,1,0,-7,15,-14,270,-8,0,-90,-2147483648,3,0,270,272,-5,270,-9,290,1,292,-4,290,-8,0,-90,-2147483648,1,0,-9,290,1,292,-11,290,-8,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-6210,
-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Control","depth":1100,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4278190080,"depth":1200,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
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