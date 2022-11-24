// Generated by gencpp from file hobe_rospy_test/MoveToNodeServiceRequest.msg
// DO NOT EDIT!


#ifndef HOBE_ROSPY_TEST_MESSAGE_MOVETONODESERVICEREQUEST_H
#define HOBE_ROSPY_TEST_MESSAGE_MOVETONODESERVICEREQUEST_H


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
struct MoveToNodeServiceRequest_
{
  typedef MoveToNodeServiceRequest_<ContainerAllocator> Type;

  MoveToNodeServiceRequest_()
    : robotName()
    , node(0)
    , action()
    , velocity(0.0)  {
    }
  MoveToNodeServiceRequest_(const ContainerAllocator& _alloc)
    : robotName(_alloc)
    , node(0)
    , action(_alloc)
    , velocity(0.0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _robotName_type;
  _robotName_type robotName;

   typedef int32_t _node_type;
  _node_type node;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _action_type;
  _action_type action;

   typedef double _velocity_type;
  _velocity_type velocity;





  typedef boost::shared_ptr< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> const> ConstPtr;

}; // struct MoveToNodeServiceRequest_

typedef ::hobe_rospy_test::MoveToNodeServiceRequest_<std::allocator<void> > MoveToNodeServiceRequest;

typedef boost::shared_ptr< ::hobe_rospy_test::MoveToNodeServiceRequest > MoveToNodeServiceRequestPtr;
typedef boost::shared_ptr< ::hobe_rospy_test::MoveToNodeServiceRequest const> MoveToNodeServiceRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator1> & lhs, const ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator2> & rhs)
{
  return lhs.robotName == rhs.robotName &&
    lhs.node == rhs.node &&
    lhs.action == rhs.action &&
    lhs.velocity == rhs.velocity;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator1> & lhs, const ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace hobe_rospy_test

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cca4758befd7ca6ef4b50d45776bde44";
  }

  static const char* value(const ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcca4758befd7ca6eULL;
  static const uint64_t static_value2 = 0xf4b50d45776bde44ULL;
};

template<class ContainerAllocator>
struct DataType< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "hobe_rospy_test/MoveToNodeServiceRequest";
  }

  static const char* value(const ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string robotName\n"
"int32 node\n"
"string action\n"
"float64 velocity\n"
;
  }

  static const char* value(const ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.robotName);
      stream.next(m.node);
      stream.next(m.action);
      stream.next(m.velocity);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MoveToNodeServiceRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::hobe_rospy_test::MoveToNodeServiceRequest_<ContainerAllocator>& v)
  {
    s << indent << "robotName: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.robotName);
    s << indent << "node: ";
    Printer<int32_t>::stream(s, indent + "  ", v.node);
    s << indent << "action: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.action);
    s << indent << "velocity: ";
    Printer<double>::stream(s, indent + "  ", v.velocity);
  }
};

} // namespace message_operations
} // namespace ros

#endif // HOBE_ROSPY_TEST_MESSAGE_MOVETONODESERVICEREQUEST_H
