cmake_minimum_required(VERSION 3.5)
project(mcpp LANGUAGES C)

# CheckTargetCPU is required to determine target CPU architecture
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake/Modules")

include(CheckIncludeFile)
include(CheckSymbolExists)
include(CheckTargetCPU)
include(CheckTypeSize)

function(mcpp_system_type _name _var)
  string(TOLOWER ${_name} _name)
  if("${_name}" MATCHES "^linux")
    set(${_var} "SYS_LINUX" PARENT_SCOPE)
  elseif("${_name}" MATCHES "^freebsd")
    set(${_var} "SYS_FREEBSD" PARENT_SCOPE)
  elseif("${_name}" MATCHES "^darwin")
    set(${_var} "SYS_MAC" PARENT_SCOPE)
  elseif("${_name}" MATCHES "^cygwin")
    set(${_var} "SYS_CYGWIN" PARENT_SCOPE)
  elseif("${_name}" MATCHES "^mingw")
    set(${_var} "SYS_MINGW" PARENT_SCOPE)
  else()
    set(${_var} "SYS_UNIX" PARENT_SCOPE)
  endif()
endfunction()

macro(check_type_exists _type _var)
  check_type_size(${_type} ${_var} ${ARGN})
  if(${_var})
    set(${_var} 1)
  endif()
endmacro()

set(mcpp_gcc_major_version_define "#undef GCC_MAJOR_VERSION")
set(mcpp_gcc_minor_version_define "#undef GCC_MINOR_VERSION")
if(${CMAKE_C_COMPILER_ID} STREQUAL "GNU")
  set(mcpp_compiler "GNUC")
  if(${CMAKE_C_COMPILER_VERSION} MATCHES "([0-9]+)\.([0-9]+)")
    set(mcpp_gcc_major_version_define "#define GCC_MAJOR_VERSION ${CMAKE_MATCH_1}")
    set(mcpp_gcc_minor_version_define "#define GCC_MINOR_VERSION ${CMAKE_MATCH_2}")
    set(mcpp_host_cmp_name "GCC")
  endif()
elseif(${CMAKE_C_COMPILER_ID} STREQUAL "MSVC")
  set(mcpp_compiler "MSC")
endif()

set(mcpp_host_compiler ${mcpp_compiler})
set(mcpp_ll_form "ll")

mcpp_system_type("${CMAKE_HOST_SYSTEM_NAME}" mcpp_host_system)
mcpp_system_type("${CMAKE_SYSTEM_NAME}" mcpp_system)

check_target_cpu(mcpp_cpu)

check_include_file(stdint.h mcpp_have_stdint_h)
check_include_file(inttypes.h mcpp_have_inttypes_h)

check_type_exists("intmax_t" mcpp_have_intmax_t)
check_type_exists("long long" mcpp_have_long_long)

check_symbol_exists("stpcpy" "string.h" mcpp_have_stpcpy)

add_subdirectory(src)

