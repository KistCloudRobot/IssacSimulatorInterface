// Auto-generated. Do not edit!

// (in-package hobe_rospy_test.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PalletizerPackingFinish {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.palletizer = null;
      this.node = null;
    }
    else {
      if (initObj.hasOwnProperty('palletizer')) {
        this.palletizer = initObj.palletizer
      }
      else {
        this.palletizer = '';
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
    // Serializes a message object of type PalletizerPackingFinish
    // Serialize message field [palletizer]
    bufferOffset = _serializer.string(obj.palletizer, buffer, bufferOffset);
    // Serialize message field [node]
    bufferOffset = _serializer.string(obj.node, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PalletizerPackingFinish
    let len;
    let data = new PalletizerPackingFinish(null);
    // Deserialize message field [palletizer]
    data.palletizer = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [node]
    data.node = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.palletizer);
    length += _getByteLength(object.node);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'hobe_rospy_test/PalletizerPackingFinish';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '70cfe6a8687ee2fd71c9e786e3742f96';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string palletizer
    string node
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PalletizerPackingFinish(null);
    if (msg.palletizer !== undefined) {
      resolved.palletizer = msg.palletizer;
    }
    else {
      resolved.palletizer = ''
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

module.exports = PalletizerPackingFinish;
