// Generated by gencpp from file hobe_rospy_test/MoveToNodeServiceResponse.msg
// DO NOT EDIT!


#ifndef HOBE_ROSPY_TEST_MESSAGE_MOVETONODESERVICERESPONSE_H
#define HOBE_ROSPY_TEST_MESSAGE_MOVETONODESERVICERESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace hobe_rospy_test
{
template <class ContainerAllocator>
struct MoveToNodeServiceResponse_
{
  typedef MoveToNodeServiceResponse_<ContainerAllocator> Type;

  MoveToNodeServiceResponse_()
    : success(false)
    , status()  {
    }
  MoveToNodeServiceResponse_(const ContainerAllocator& _alloc)
    : success(false)
    , status(_alloc)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _status_type;
  _status_type status;





  typedef boost::shared_ptr< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> const> ConstPtr;

}; // struct MoveToNodeServiceResponse_

typedef ::hobe_rospy_test::MoveToNodeServiceResponse_<std::allocator<void> > MoveToNodeServiceResponse;

typedef boost::shared_ptr< ::hobe_rospy_test::MoveToNodeServiceResponse > MoveToNodeServiceResponsePtr;
typedef boost::shared_ptr< ::hobe_rospy_test::MoveToNodeServiceResponse const> MoveToNodeServiceResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator1> & lhs, const ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator2> & rhs)
{
  return lhs.success == rhs.success &&
    lhs.status == rhs.status;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator1> & lhs, const ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace hobe_rospy_test

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "38b8954d32a849f31d78416b12bff5d1";
  }

  static const char* value(const ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x38b8954d32a849f3ULL;
  static const uint64_t static_value2 = 0x1d78416b12bff5d1ULL;
};

template<class ContainerAllocator>
struct DataType< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hobe_rospy_test/MoveToNodeServiceResponse";
  }

  static const char* value(const ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool success\n"
"string status\n"
"\n"
;
  }

  static const char* value(const ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
      stream.next(m.status);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MoveToNodeServiceResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hobe_rospy_test::MoveToNodeServiceResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
    s << indent << "status: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.status);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HOBE_ROSPY_TEST_MESSAGE_MOVETONODESERVICERESPONSE_H
