set(LIBNAME "Zip")
set(POCO_LIBNAME "Poco${LIBNAME}")

# Sources
file(GLOB SRCS_G "src/*.cpp")
POCO_SOURCES_AUTO( SRCS ${SRCS_G})

# Headers
file(GLOB_RECURSE HDRS_G "include/*.h" )
POCO_HEADERS_AUTO( SRCS ${HDRS_G})

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
    DEFINE_SYMBOL Zip_EXPORTS
    )

target_link_libraries( "${LIBNAME}" Util XML Foundation)
target_include_directories( "${LIBNAME}"
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:include>
    PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/src
    )
if(POCO_UNBUNDLED)
    if(POCO_WITH_SHARED_ZLIB)
        set(ZLIB_USE_STATIC_LIBS OFF)
    else()
        set(ZLIB_USE_STATIC_LIBS ON)
    endif()
    find_package(SiblingZLIB)
    if(ZLIB_FOUND)
        target_include_directories( "${LIBNAME}"
            PRIVATE ${ZLIB_INCLUDE_DIRS} )
    endif()
endif()
target_compile_definitions("${LIBNAME}" PUBLIC ${LIB_MODE_DEFINITIONS})

POCO_INSTALL("${LIBNAME}")
POCO_GENERATE_PACKAGE("${LIBNAME}")

if (ENABLE_TESTS)
    add_subdirectory(samples)
    add_subdirectory(testsuite)
endif ()

