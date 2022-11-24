// Auto-generated. Do not edit!

// (in-package hobe_rospy_test.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class PalletServiceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.action = null;
      this.palletizer = null;
      this.robot = null;
      this.node = null;
    }
    else {
      if (initObj.hasOwnProperty('action')) {
        this.action = initObj.action
      }
      else {
        this.action = '';
      }
      if (initObj.hasOwnProperty('palletizer')) {
        this.palletizer = initObj.palletizer
      }
      else {
        this.palletizer = '';
      }
      if (initObj.hasOwnProperty('robot')) {
        this.robot = initObj.robot
      }
      else {
        this.robot = '';
      }
      if (initObj.hasOwnProperty('node')) {
        this.node = initObj.node
      }
      else {
        this.node = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PalletServiceRequest
    // Serialize message field [action]
    bufferOffset = _serializer.string(obj.action, buffer, bufferOffset);
    // Serialize message field [palletizer]
    bufferOffset = _serializer.string(obj.palletizer, buffer, bufferOffset);
    // Serialize message field [robot]
    bufferOffset = _serializer.string(obj.robot, buffer, bufferOffset);
    // Serialize message field [node]
    bufferOffset = _serializer.string(obj.node, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PalletServiceRequest
    let len;
    let data = new PalletServiceRequest(null);
    // Deserialize message field [action]
    data.action = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [palletizer]
    data.palletizer = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [robot]
    data.robot = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [node]
    data.node = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.action);
    length += _getByteLength(object.palletizer);
    length += _getByteLength(object.robot);
    length += _getByteLength(object.node);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hobe_rospy_test/PalletServiceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bb149d902942e5a0c72cd969c7f98933';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string action
    string palletizer
    string robot
    string node
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PalletServiceRequest(null);
    if (msg.action !== undefined) {
      resolved.action = msg.action;
    }
    else {
      resolved.action = ''
    }

    if (msg.palletizer !== undefined) {
      resolved.palletizer = msg.palletizer;
    }
    else {
      resolved.palletizer = ''
    }

    if (msg.robot !== undefined) {
      resolved.robot = msg.robot;
    }
    else {
      resolved.robot = ''
    }

    if (msg.node !== undefined) {
      resolved.node = msg.node;
    }
    else {
      resolved.node = ''
    }

    return resolved;
    }
};

class PalletServiceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PalletServiceResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PalletServiceResponse
    let len;
    let data = new PalletServiceResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hobe_rospy_test/PalletServiceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb13ac1f1354ccecb7941ee8fa2192e8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool result
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PalletServiceResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = false
    }

    return resolved;
    }
};

module.exports = {
  Request: PalletServiceRequest,
  Response: PalletServiceResponse,
  md5sum() { return '1b1aad6e6b75c669e52bd93dbc857957'; },
  datatype() { return 'hobe_rospy_test/PalletService'; }
};
