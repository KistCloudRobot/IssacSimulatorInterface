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

class LiftServiceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robotName = null;
      this.target_value = null;
      this.order = null;
    }
    else {
      if (initObj.hasOwnProperty('robotName')) {
        this.robotName = initObj.robotName
      }
      else {
        this.robotName = '';
      }
      if (initObj.hasOwnProperty('target_value')) {
        this.target_value = initObj.target_value
      }
      else {
        this.target_value = 0.0;
      }
      if (initObj.hasOwnProperty('order')) {
        this.order = initObj.order
      }
      else {
        this.order = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LiftServiceRequest
    // Serialize message field [robotName]
    bufferOffset = _serializer.string(obj.robotName, buffer, bufferOffset);
    // Serialize message field [target_value]
    bufferOffset = _serializer.float32(obj.target_value, buffer, bufferOffset);
    // Serialize message field [order]
    bufferOffset = _serializer.string(obj.order, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LiftServiceRequest
    let len;
    let data = new LiftServiceRequest(null);
    // Deserialize message field [robotName]
    data.robotName = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [target_value]
    data.target_value = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [order]
    data.order = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.robotName);
    length += _getByteLength(object.order);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hobe_rospy_test/LiftServiceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd6bb648a713d4443a0abf6169f86db5b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string robotName
    float32 target_value
    string order
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LiftServiceRequest(null);
    if (msg.robotName !== undefined) {
      resolved.robotName = msg.robotName;
    }
    else {
      resolved.robotName = ''
    }

    if (msg.target_value !== undefined) {
      resolved.target_value = msg.target_value;
    }
    else {
      resolved.target_value = 0.0
    }

    if (msg.order !== undefined) {
      resolved.order = msg.order;
    }
    else {
      resolved.order = ''
    }

    return resolved;
    }
};

class LiftServiceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LiftServiceResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LiftServiceResponse
    let len;
    let data = new LiftServiceResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hobe_rospy_test/LiftServiceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LiftServiceResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: LiftServiceRequest,
  Response: LiftServiceResponse,
  md5sum() { return '51f32333f2c561d5ba412282aada3d3f'; },
  datatype() { return 'hobe_rospy_test/LiftService'; }
};
