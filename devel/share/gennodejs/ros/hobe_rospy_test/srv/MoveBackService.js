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

class MoveBackServiceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robotName = null;
      this.node_num = null;
    }
    else {
      if (initObj.hasOwnProperty('robotName')) {
        this.robotName = initObj.robotName
      }
      else {
        this.robotName = '';
      }
      if (initObj.hasOwnProperty('node_num')) {
        this.node_num = initObj.node_num
      }
      else {
        this.node_num = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveBackServiceRequest
    // Serialize message field [robotName]
    bufferOffset = _serializer.string(obj.robotName, buffer, bufferOffset);
    // Serialize message field [node_num]
    bufferOffset = _serializer.string(obj.node_num, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveBackServiceRequest
    let len;
    let data = new MoveBackServiceRequest(null);
    // Deserialize message field [robotName]
    data.robotName = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [node_num]
    data.node_num = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.robotName);
    length += _getByteLength(object.node_num);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hobe_rospy_test/MoveBackServiceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fcba4a221d250c2bc8b7b6802b446de3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string robotName
    string node_num
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveBackServiceRequest(null);
    if (msg.robotName !== undefined) {
      resolved.robotName = msg.robotName;
    }
    else {
      resolved.robotName = ''
    }

    if (msg.node_num !== undefined) {
      resolved.node_num = msg.node_num;
    }
    else {
      resolved.node_num = ''
    }

    return resolved;
    }
};

class MoveBackServiceResponse {
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
    // Serializes a message object of type MoveBackServiceResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveBackServiceResponse
    let len;
    let data = new MoveBackServiceResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hobe_rospy_test/MoveBackServiceResponse';
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
    const resolved = new MoveBackServiceResponse(null);
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
  Request: MoveBackServiceRequest,
  Response: MoveBackServiceResponse,
  md5sum() { return 'e7b883f3f3085a2a026775cc770f647f'; },
  datatype() { return 'hobe_rospy_test/MoveBackService'; }
};
