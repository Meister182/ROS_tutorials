// Generated by gencpp from file myRosPackage/AddTwoIntsCopyResponse.msg
// DO NOT EDIT!


#ifndef MYROSPACKAGE_MESSAGE_ADDTWOINTSCOPYRESPONSE_H
#define MYROSPACKAGE_MESSAGE_ADDTWOINTSCOPYRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace myRosPackage
{
template <class ContainerAllocator>
struct AddTwoIntsCopyResponse_
{
  typedef AddTwoIntsCopyResponse_<ContainerAllocator> Type;

  AddTwoIntsCopyResponse_()
    : sum(0)  {
    }
  AddTwoIntsCopyResponse_(const ContainerAllocator& _alloc)
    : sum(0)  {
  (void)_alloc;
    }



   typedef int64_t _sum_type;
  _sum_type sum;





  typedef boost::shared_ptr< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> const> ConstPtr;

}; // struct AddTwoIntsCopyResponse_

typedef ::myRosPackage::AddTwoIntsCopyResponse_<std::allocator<void> > AddTwoIntsCopyResponse;

typedef boost::shared_ptr< ::myRosPackage::AddTwoIntsCopyResponse > AddTwoIntsCopyResponsePtr;
typedef boost::shared_ptr< ::myRosPackage::AddTwoIntsCopyResponse const> AddTwoIntsCopyResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace myRosPackage

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'myRosPackage': ['/home/alex/Desktop/ROS_tutorials/src/myRosPackage/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b88405221c77b1878a3cbbfff53428d7";
  }

  static const char* value(const ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb88405221c77b187ULL;
  static const uint64_t static_value2 = 0x8a3cbbfff53428d7ULL;
};

template<class ContainerAllocator>
struct DataType< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "myRosPackage/AddTwoIntsCopyResponse";
  }

  static const char* value(const ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 sum\n\
\n\
";
  }

  static const char* value(const ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.sum);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AddTwoIntsCopyResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::myRosPackage::AddTwoIntsCopyResponse_<ContainerAllocator>& v)
  {
    s << indent << "sum: ";
    Printer<int64_t>::stream(s, indent + "  ", v.sum);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MYROSPACKAGE_MESSAGE_ADDTWOINTSCOPYRESPONSE_H