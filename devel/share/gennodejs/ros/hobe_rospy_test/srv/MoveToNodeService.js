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

class MoveToNodeServiceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robotName = null;
      this.node = null;
      this.action = null;
      this.velocity = null;
    }
    else {
      if (initObj.hasOwnProperty('robotName')) {
        this.robotName = initObj.robotName
      }
      else {
        this.robotName = '';
      }
      if (initObj.hasOwnProperty('node')) {
        this.node = initObj.node
      }
      else {
        this.node = 0;
      }
      if (initObj.hasOwnProperty('action')) {
        this.action = initObj.action
      }
      else {
        this.action = '';
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveToNodeServiceRequest
    // Serialize message field [robotName]
    bufferOffset = _serializer.string(obj.robotName, buffer, bufferOffset);
    // Serialize message field [node]
    bufferOffset = _serializer.int32(obj.node, buffer, bufferOffset);
    // Serialize message field [action]
    bufferOffset = _serializer.string(obj.action, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = _serializer.float64(obj.velocity, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveToNodeServiceRequest
    let len;
    let data = new MoveToNodeServiceRequest(null);
    // Deserialize message field [robotName]
    data.robotName = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [node]
    data.node = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [action]
    data.action = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.robotName);
    length += _getByteLength(object.action);
    return length + 20;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hobe_rospy_test/MoveToNodeServiceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cca4758befd7ca6ef4b50d45776bde44';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string robotName
    int32 node
    string action
    float64 velocity
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveToNodeServiceRequest(null);
    if (msg.robotName !== undefined) {
      resolved.robotName = msg.robotName;
    }
    else {
      resolved.robotName = ''
    }

    if (msg.node !== undefined) {
      resolved.node = msg.node;
    }
    else {
      resolved.node = 0
    }

    if (msg.action !== undefined) {
      resolved.action = msg.action;
    }
    else {
      resolved.action = ''
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = msg.velocity;
    }
    else {
      resolved.velocity = 0.0
    }

    return resolved;
    }
};

class MoveToNodeServiceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveToNodeServiceResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.string(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveToNodeServiceResponse
    let len;
    let data = new MoveToNodeServiceResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.status);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hobe_rospy_test/MoveToNodeServiceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '38b8954d32a849f31d78416b12bff5d1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string status
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveToNodeServiceResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: MoveToNodeServiceRequest,
  Response: MoveToNodeServiceResponse,
  md5sum() { return 'a6ad41fdec29b72af81f7f2cff62510b'; },
  datatype() { return 'hobe_rospy_test/MoveToNodeService'; }
};
