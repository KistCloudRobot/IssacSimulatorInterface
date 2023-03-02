
"use strict";

let Mass = require('./Mass.js');
let QueryServiceRequest = require('./QueryServiceRequest.js');
let MonitorServiceRequest = require('./MonitorServiceRequest.js');
let QueryServiceResponse = require('./QueryServiceResponse.js');
let ServiceResult = require('./ServiceResult.js');
let Monitor = require('./Monitor.js');
let TempTest = require('./TempTest.js');
let MainServiceRequest = require('./MainServiceRequest.js');
let MonitorServiceResponse = require('./MonitorServiceResponse.js');
let PalletizerPackingFinish = require('./PalletizerPackingFinish.js');
let Gripper = require('./Gripper.js');

module.exports = {
  Mass: Mass,
  QueryServiceRequest: QueryServiceRequest,
  MonitorServiceRequest: MonitorServiceRequest,
  QueryServiceResponse: QueryServiceResponse,
  ServiceResult: ServiceResult,
  Monitor: Monitor,
  TempTest: TempTest,
  MainServiceRequest: MainServiceRequest,
  MonitorServiceResponse: MonitorServiceResponse,
  PalletizerPackingFinish: PalletizerPackingFinish,
  Gripper: Gripper,
};
