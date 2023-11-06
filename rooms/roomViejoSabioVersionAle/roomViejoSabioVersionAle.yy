{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "roomViejoSabioVersionAle",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_1F84E163_1","path":"rooms/roomViejoSabioVersionAle/roomViejoSabioVersionAle.yy",},
    {"name":"inst_3DF4D06_2","path":"rooms/roomViejoSabioVersionAle/roomViejoSabioVersionAle.yy",},
    {"name":"inst_5FF14723_2","path":"rooms/roomViejoSabioVersionAle/roomViejoSabioVersionAle.yy",},
    {"name":"inst_174223BD_2","path":"rooms/roomViejoSabioVersionAle/roomViejoSabioVersionAle.yy",},
    {"name":"inst_52D8B190_2","path":"rooms/roomViejoSabioVersionAle/roomViejoSabioVersionAle.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Collisions","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMREffectLayer","resourceVersion":"1.0","name":"Effect_1","depth":100,"effectEnabled":true,"effectType":"_filter_contrast","gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[
        {"name":"g_ContrastIntensity","type":0,"value":"0.95",},
        {"name":"g_ContrastBrightness","type":0,"value":"0.85",},
      ],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":200,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5FF14723_2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"oCameraManager","path":"objects/oCameraManager/oCameraManager.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":-32.0,"y":64.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_1F84E163_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_questie","path":"objects/obj_questie/obj_questie.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"prnt_entity","path":"objects/prnt_entity/prnt_entity.yy",},"propertyId":{"name":"EntityActivateScript","path":"objects/prnt_entity/prnt_entity.yy",},"value":"startDialogue",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"prnt_entity","path":"objects/prnt_entity/prnt_entity.yy",},"propertyId":{"name":"EntityActivateArgs","path":"objects/prnt_entity/prnt_entity.yy",},"value":"[array_first(global.dialogue_order[$ \"obj_questie\"])]",},
          ],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":224.0,"y":96.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3DF4D06_2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_room_exit","path":"objects/obj_room_exit/obj_room_exit.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_room_exit","path":"objects/obj_room_exit/obj_room_exit.yy",},"propertyId":{"name":"RoomName","path":"objects/obj_room_exit/obj_room_exit.yy",},"value":"\"roomMapaInicial\"",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_room_exit","path":"objects/obj_room_exit/obj_room_exit.yy",},"propertyId":{"name":"RoomTargetX","path":"objects/obj_room_exit/obj_room_exit.yy",},"value":"1368",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_room_exit","path":"objects/obj_room_exit/obj_room_exit.yy",},"propertyId":{"name":"RoomTargetY","path":"objects/obj_room_exit/obj_room_exit.yy",},"value":"1506",},
          ],"rotation":0.0,"scaleX":2.0,"scaleY":1.0,"x":224.0,"y":256.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_174223BD_2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"depth_sorter","path":"objects/depth_sorter/depth_sorter.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":-32.0,"y":80.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_52D8B190_2","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"o_player","path":"objects/o_player/o_player.yy",},"properties":[],"rotation":0.0,"scaleX":1.0,"scaleY":1.0,"x":224.0,"y":192.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Col2","depth":300,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":135,"SerialiseWidth":240,"TileCompressedData":[
-60,0,-180,-2147483648,-60,0,-180,-2147483648,-60,0,-180,-2147483648,-60,0,-180,-2147483648,-44,6,-16,0,-180,-2147483648,-2,6,-11,0,3,4,6,6,-27,0,1,6,-16,0,-180,-2147483648,-2,6,-11,0,3,4,6,6,-27,0,1,6,-16,0,-180,-2147483648,-2,6,-11,0,3,4,6,6,-27,0,1,6,-16,0,-180,-2147483648,-2,6,-11,0,3,4,6,6,-22,0,-14,6,-8,0,-180,-2147483648,-2,6,-11,0,3,4,6,6,-35,0,1,6,-8,0,-180,-2147483648,-2,6,-11,0,3,4,6,6,-35,0,1,6,-8,0,-180,-2147483648,-2,6,-11,0,3,4,6,6,-35,0,1,6,-8,0,-180,-2147483648,-2,6,-11,0,3,4,6,6,-28,0,-6,6,2,0,6,-8,0,-180,-2147483648,-2,6,-11,0,3,4,6,6,-35,0,1,6,-8,0,-180,-2147483648,-2,6,-11,0,3,4,6,6,-35,0,1,6,-8,0,-180,-2147483648,-2,6,-11,0,3,4,6,6,-35,0,1,6,-8,0,-180,-2147483648,-2,6,-11,0,3,4,6,6,-35,0,1,6,-8,0,-180,-2147483648,-2,6,-12,0,-2,6,-35,0,1,6,-8,0,-180,-2147483648,-2,6,-49,0,1,6,-8,0,-180,
-2147483648,-2,6,-15,4,-34,0,1,6,-8,0,-180,-2147483648,1,0,-15,6,1,4,-34,0,1,6,-8,0,-180,-2147483648,-16,6,1,4,-34,0,1,6,-8,0,-180,-2147483648,-16,6,1,4,-34,0,1,6,-8,0,-180,-2147483648,-2,6,-14,0,1,4,-26,0,-9,6,-8,0,-180,-2147483648,-2,6,-41,0,1,6,-16,0,-180,-2147483648,-2,6,-41,0,1,6,-16,0,-180,-2147483648,-2,6,-41,0,1,6,-16,0,-180,-2147483648,-2,6,-41,0,1,6,-16,0,-180,-2147483648,-2,6,-41,0,1,6,-16,0,-180,-2147483648,-24,6,-8,0,-12,6,-16,0,-180,-2147483648,-60,0,-25140,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tilesCol2","path":"tilesets/tilesCol2/tilesCol2.yy",},"userdefinedDepth":false,"visible":false,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_deco2","depth":400,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-260,-2147483648,1,53,-118,-2147483648,4,3,62,3,4,-116,-2147483648,4,12,13,12,13,-119,-2147483648,-3,3,1,4,-111,-2147483648,2,3,4,-3,-2147483648,-3,12,1,13,-111,-2147483648,2,12,13,-7301,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio_walls","path":"tilesets/ts_int_ViejoSabio_walls/ts_int_ViejoSabio_walls.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_deco","depth":500,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-366,-2147483648,1,53,-10,-2147483648,-3,2,3,3,4,4,-98,-2147483648,11,5,6,7,8,0,62,-2147483648,-2147483648,9,10,11,-5,-2147483648,-3,11,3,12,13,13,-98,-2147483648,11,14,15,16,17,0,0,-2147483648,-2147483648,18,19,20,-4,-2147483648,-2,0,-103,-2147483648,4,23,24,25,26,-12,-2147483648,-2,0,-102,-2147483648,4,32,33,34,35,-11,-2147483648,3,0,21,22,-118,-2147483648,2,30,31,-602,-2147483648,1,53,-119,-2147483648,1,62,-6458,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio_walls","path":"tilesets/ts_int_ViejoSabio_walls/ts_int_ViejoSabio_walls.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_walls","depth":600,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-30,0,-90,-2147483648,-30,0,-90,-2147483648,22,0,90,91,92,151,151,90,0,90,91,151,210,212,90,91,92,150,150,210,210,150,150,-8,0,-90,-2147483648,22,0,110,111,112,171,171,110,0,110,111,171,230,232,110,111,112,170,170,230,230,170,170,-8,0,-90,-2147483648,-22,0,4,210,151,90,91,-4,0,-90,-2147483648,-7,0,1,208,-14,0,4,230,171,110,111,-4,0,-90,-2147483648,-7,0,1,226,-22,0,-90,-2147483648,-7,0,1,210,-22,0,-90,-2147483648,-7,0,1,230,-22,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,
8,0,90,91,92,90,90,91,92,-22,0,-90,-2147483648,8,0,110,111,112,110,110,111,112,-22,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,-6210,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_borders_2","depth":700,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-127,-2147483648,1,305,-599,-2147483648,1,177,-479,-2147483648,1,175,-6952,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_borders_1","depth":800,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-30,0,-90,-2147483648,-7,0,1,1,-22,0,-90,-2147483648,1,73,-6,0,1,217,-22,0,-90,-2147483648,1,73,-6,0,1,217,-22,0,-90,-2147483648,1,73,-6,0,1,217,-22,0,-90,-2147483648,1,73,-6,0,1,217,-22,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-25,0,1,79,-3,0,-90,-2147483648,1,73,-29,0,-90,-2147483648,-30,0,-90,-2147483648,1,281,-7,257,-22,0,-90,-2147483648,-26,0,1,79,-3,0,-90,-2147483648,-30,0,-90,-2147483648,1,73,-29,0,-90,-2147483648,1,73,-29,0,-90,-2147483648,-30,0,-90,-2147483648,-30,0,
-6210,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_borders","depth":900,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-30,0,-90,-2147483648,1,1,-6,2,1,1,-14,4,1,7,-7,0,-90,-2147483648,1,21,-21,0,1,27,-7,0,-90,-2147483648,1,21,-6,0,1,32,-14,0,1,296,-3,6,1,7,-3,0,-90,-2147483648,1,61,-6,0,1,32,-18,0,1,107,-3,0,-90,-2147483648,1,61,-6,0,1,32,-18,0,1,107,-3,0,-90,-2147483648,1,61,-6,0,1,32,-18,0,1,107,-3,0,-90,-2147483648,1,61,-25,0,1,107,-3,0,-90,-2147483648,1,21,-25,0,1,107,-3,0,-90,-2147483648,1,61,-25,0,1,107,-3,0,-90,-2147483648,1,1,
-7,164,-18,0,1,107,-3,0,-90,-2147483648,1,61,-25,0,1,107,-3,0,-90,-2147483648,1,61,-21,0,5,256,257,257,126,127,-3,0,-90,-2147483648,1,61,-21,0,1,107,-7,0,-90,-2147483648,1,61,-21,0,1,107,-7,0,-90,-2147483648,2,121,122,-10,124,-4,0,-4,124,-2,126,1,127,-7,0,-90,-2147483648,-30,0,-6210,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_floor","depth":1000,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":68,"SerialiseWidth":120,"TileCompressedData":[
-481,-2147483648,1,272,-5,270,2,-2147483648,272,-7,270,1,272,-3,270,2,272,270,-99,-2147483648,8,292,290,290,292,290,290,-2147483648,292,-3,290,1,292,-3,290,-2,292,-2,290,2,292,290,-99,-2147483648,2,270,272,-4,270,8,-2147483648,270,270,272,270,270,272,272,-3,270,8,272,270,270,272,270,272,270,270,-95,-2147483648,2,290,292,-4,290,8,-2147483648,290,290,292,290,290,292,292,-3,290,8,292,290,290,292,290,292,290,290,-95,-2147483648,-4,270,3,272,270,-2147483648,-4,270,1,272,-3,270,1,272,-3,270,1,272,-5,270,-95,-2147483648,
5,290,292,290,290,292,-6,290,1,292,-3,290,1,292,-3,290,6,292,290,290,292,290,290,-102,-2147483648,2,270,272,-3,270,4,272,270,270,272,-4,270,5,272,270,270,272,270,-102,-2147483648,2,290,292,-3,290,4,292,290,290,292,-4,290,5,292,290,290,292,290,-102,-2147483648,1,272,-3,270,1,272,-4,270,1,272,-3,270,1,272,-99,-2147483648,8,270,272,270,270,272,270,270,292,-3,290,1,292,-4,290,1,292,-3,290,1,292,-99,-2147483648,5,290,292,290,290,292,-13,290,3,292,290,290,-6458,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"ts_int_ViejoSabio2","path":"tilesets/ts_int_ViejoSabio2/ts_int_ViejoSabio2.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
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