// Generated by gencpp from file hobe_rospy_test/MoveToNodeService.msg
// DO NOT EDIT!


#ifndef HOBE_ROSPY_TEST_MESSAGE_MOVETONODESERVICE_H
#define HOBE_ROSPY_TEST_MESSAGE_MOVETONODESERVICE_H

#include <ros/service_traits.h>


#include <hobe_rospy_test/MoveToNodeServiceRequest.h>
#include <hobe_rospy_test/MoveToNodeServiceResponse.h>


namespace hobe_rospy_test
{

struct MoveToNodeService
{

typedef MoveToNodeServiceRequest Request;
typedef MoveToNodeServiceResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct MoveToNodeService
} // namespace hobe_rospy_test


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::hobe_rospy_test::MoveToNodeService > {
  static const char* value()
  {
    return "a6ad41fdec29b72af81f7f2cff62510b";
  }

  static const char* value(const ::hobe_rospy_test::MoveToNodeService&) { return value(); }
};

template<>
struct DataType< ::hobe_rospy_test::MoveToNodeService > {
  static const char* value()
  {
    return "hobe_rospy_test/MoveToNodeService";
  }

  static const char* value(const ::hobe_rospy_test::MoveToNodeService&) { return value(); }
};


// service_traits::MD5Sum< ::hobe_rospy_test::MoveToNodeServiceRequest> should match
// service_traits::MD5Sum< ::hobe_rospy_test::MoveToNodeService >
template<>
struct MD5Sum< ::hobe_rospy_test::MoveToNodeServiceRequest>
{
  static const char* value()
  {
    return MD5Sum< ::hobe_rospy_test::MoveToNodeService >::value();
  }
  static const char* value(const ::hobe_rospy_test::MoveToNodeServiceRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::hobe_rospy_test::MoveToNodeServiceRequest> should match
// service_traits::DataType< ::hobe_rospy_test::MoveToNodeService >
template<>
struct DataType< ::hobe_rospy_test::MoveToNodeServiceRequest>
{
  static const char* value()
  {
    return DataType< ::hobe_rospy_test::MoveToNodeService >::value();
  }
  static const char* value(const ::hobe_rospy_test::MoveToNodeServiceRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::hobe_rospy_test::MoveToNodeServiceResponse> should match
// service_traits::MD5Sum< ::hobe_rospy_test::MoveToNodeService >
template<>
struct MD5Sum< ::hobe_rospy_test::MoveToNodeServiceResponse>
{
  static const char* value()
  {
    return MD5Sum< ::hobe_rospy_test::MoveToNodeService >::value();
  }
  static const char* value(const ::hobe_rospy_test::MoveToNodeServiceResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::hobe_rospy_test::MoveToNodeServiceResponse> should match
// service_traits::DataType< ::hobe_rospy_test::MoveToNodeService >
template<>
struct DataType< ::hobe_rospy_test::MoveToNodeServiceResponse>
{
  static const char* value()
  {
    return DataType< ::hobe_rospy_test::MoveToNodeService >::value();
  }
  static const char* value(const ::hobe_rospy_test::MoveToNodeServiceResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // HOBE_ROSPY_TEST_MESSAGE_MOVETONODESERVICE_H