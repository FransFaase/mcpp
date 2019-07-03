set(headers
    internal.H
    system.H
    mcpp_lib.h
    mcpp_out.h)

set(sources
    directive.c
    eval.c
    expand.c
    main.c
    mbchar.c
    preproc.c
    support.c
    system.c)

set(config_header ${CMAKE_CURRENT_BINARY_DIR}/config.h)
configure_file(config.h.in.cmake ${config_header} @ONLY)

add_library(mcpp ${sources} ${headers} ${config_header})
target_include_directories(
  mcpp PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>)

