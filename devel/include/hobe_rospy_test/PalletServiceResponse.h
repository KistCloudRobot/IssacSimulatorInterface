// Generated by gencpp from file hobe_rospy_test/PalletServiceResponse.msg
// DO NOT EDIT!


#ifndef HOBE_ROSPY_TEST_MESSAGE_PALLETSERVICERESPONSE_H
#define HOBE_ROSPY_TEST_MESSAGE_PALLETSERVICERESPONSE_H


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
struct PalletServiceResponse_
{
  typedef PalletServiceResponse_<ContainerAllocator> Type;

  PalletServiceResponse_()
    : result(false)  {
    }
  PalletServiceResponse_(const ContainerAllocator& _alloc)
    : result(false)  {
  (void)_alloc;
    }



   typedef uint8_t _result_type;
  _result_type result;





  typedef boost::shared_ptr< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> const> ConstPtr;

}; // struct PalletServiceResponse_

typedef ::hobe_rospy_test::PalletServiceResponse_<std::allocator<void> > PalletServiceResponse;

typedef boost::shared_ptr< ::hobe_rospy_test::PalletServiceResponse > PalletServiceResponsePtr;
typedef boost::shared_ptr< ::hobe_rospy_test::PalletServiceResponse const> PalletServiceResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator1> & lhs, const ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator2> & rhs)
{
  return lhs.result == rhs.result;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator1> & lhs, const ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace hobe_rospy_test

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "eb13ac1f1354ccecb7941ee8fa2192e8";
  }

  static const char* value(const ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xeb13ac1f1354ccecULL;
  static const uint64_t static_value2 = 0xb7941ee8fa2192e8ULL;
};

template<class ContainerAllocator>
struct DataType< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hobe_rospy_test/PalletServiceResponse";
  }

  static const char* value(const ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool result\n"
"\n"
;
  }

  static const char* value(const ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PalletServiceResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hobe_rospy_test::PalletServiceResponse_<ContainerAllocator>& v)
  {
    s << indent << "result: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.result);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HOBE_ROSPY_TEST_MESSAGE_PALLETSERVICERESPONSE_H