set(LIBNAME "JSON")
set(POCO_LIBNAME "Poco${LIBNAME}")

# Sources
if (WIN32)
    add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif (WIN32)

file(GLOB SRCS_G "src/*.cpp")
POCO_SOURCES_AUTO( SRCS ${SRCS_G})

# Headers
file(GLOB_RECURSE HDRS_G "include/*.h" )
POCO_HEADERS_AUTO( SRCS ${HDRS_G})
POCO_SOURCES(SRCS pdjson src/pdjson.c)
if(WIN32)
    SET_SOURCE_FILES_PROPERTIES(src/pdjson.c PROPERTIES LANGUAGE CXX)
endif()

# Version Resource
if(MSVC AND NOT POCO_STATIC)
    source_group("Resources" FILES ${PROJECT_SOURCE_DIR}/DLLVersion.rc)
    list(APPEND SRCS ${PROJECT_SOURCE_DIR}/DLLVersion.rc)
endif()

add_library( "${LIBNAME}" ${LIB_MODE} ${SRCS} )
add_library( "${POCO_LIBNAME}" ALIAS "${LIBNAME}")
set_target_properties( "${LIBNAME}"
    PROPERTIES
    VERSION ${SHARED_LIBRARY_VERSION} SOVERSION ${SHARED_LIBRARY_VERSION}
    OUTPUT_NAME ${POCO_LIBNAME}
    DEFINE_SYMBOL JSON_EXPORTS
    )

target_link_libraries( "${LIBNAME}" Foundation)
target_include_directories( "${LIBNAME}"
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src
    )
target_compile_definitions("${LIBNAME}" PUBLIC ${LIB_MODE_DEFINITIONS})
target_link_options("${LIBNAME}" PUBLIC $<$<CXX_COMPILER_ID:MSVC>:/FORCE:MULTIPLE>)

POCO_INSTALL("${LIBNAME}")
POCO_GENERATE_PACKAGE("${LIBNAME}")

if (ENABLE_TESTS)
    add_subdirectory(samples)
    add_subdirectory(testsuite)
endif ()

