{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "obj_sign",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"prnt_entity","path":"objects/prnt_entity/prnt_entity.yy",},"propertyId":{"name":"EntityActivateScript","path":"objects/prnt_entity/prnt_entity.yy",},"value":"startDialogue",},
    {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"prnt_entity","path":"objects/prnt_entity/prnt_entity.yy",},"propertyId":{"name":"EntityCollision","path":"objects/prnt_entity/prnt_entity.yy",},"value":"True",},
  ],
  "parent": {
    "name": "M0",
    "path": "folders/Objects/Entity/Enviroment/M0.yy",
  },
  "parentObjectId": {
    "name": "prnt_entity",
    "path": "objects/prnt_entity/prnt_entity.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"Signindex","filters":[],"listItems":[
        "\"house\"",
        "\"danger\"",
        "\"monster\"",
      ],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"\"house\"","varType":6,},
  ],
  "solid": false,
  "spriteId": {
    "name": "spr_sign",
    "path": "sprites/spr_sign/spr_sign.yy",
  },
  "spriteMaskId": null,
  "visible": true,
}