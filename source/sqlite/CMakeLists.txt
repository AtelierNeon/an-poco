CMAKE_MINIMUM_REQUIRED (VERSION 3.1.0...3.15.0)

PROJECT (sqlite LANGUAGES C VERSION "3.29.0")

## Separate version number into 4 parts
string (REGEX MATCHALL "[0-9]+" _my_ver_LIST "${PROJECT_VERSION}")
list (LENGTH _my_ver_LIST _my_list_len)
list (GET _my_ver_LIST 0 SQLITE_VER_MAJOR)
list (GET _my_ver_LIST 1 SQLITE_VER_MINOR)
list (GET _my_ver_LIST 2 SQLITE_VER_PATCH)
if (_my_list_len EQUAL 4)
    list (GET _my_ver_LIST 3 SQLITE_VER_PATCHLEVEL)
endif ()

message (STATUS "sqlite version ${PROJECT_VERSION}")

option (SQLITE_WITH_SHARED_LIBRARIES "Build shared version of the SQLite libraries." OFF)
option (SQLITE_WITHOUT_APPS "Build SQLite without apps." OFF)

if (WIN32)
	set (CMAKE_SHARED_LIBRARY_PREFIX "lib")
	set (CMAKE_STATIC_LIBRARY_PREFIX "lib")
endif()

add_definitions (
    -DSQLITE_THREADSAFE=1
    -DSQLITE_DISABLE_LFS
    -DSQLITE_OMIT_UTF16
    -DSQLITE_OMIT_PROGRESS_CALLBACK
    -DSQLITE_OMIT_COMPLETE
    -DSQLITE_OMIT_TCL_VARIABLE
    -DSQLITE_OMIT_DEPRECATED)

## Component - sqlite
set (SQLITE_LIB_NAME
    sqlite)
set (SQLITE_LIB_SRCS
    sqlite3.c)
if (WIN32)
    include (Windows-MyDllVersion)
    generate_product_dll_version (SQLITE_LIB_VERSION_FILES
        NAME "SQLite - a public domain zero-configuration, transactional SQL database engine"
        VERSION_MAJOR ${SQLITE_VER_MAJOR}
        VERSION_MINOR ${SQLITE_VER_MINOR}
        VERSION_PATCH ${SQLITE_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "libsqlite3.dll")
    set (SQLITE_LIB_SRCS
        ${SQLITE_LIB_SRCS} ${SQLITE_LIB_VERSION_FILES})
endif ()
set (SQLITE_LIB_SHARED_TYPE STATIC)
if (SQLITE_WITH_SHARED_LIBRARIES)
    set (SQLITE_LIB_SHARED_TYPE SHARED)
endif ()
add_library (${SQLITE_LIB_NAME} ${SQLITE_LIB_SHARED_TYPE}
    ${SQLITE_LIB_SRCS})
set_target_properties (${SQLITE_LIB_NAME} PROPERTIES
    OUTPUT_NAME sqlite3)
if (WIN32)
    set_target_properties (${SQLITE_LIB_NAME} PROPERTIES
        COMPILE_FLAGS "-DSQLITE_API=__declspec(dllexport)")
endif ()
install (TARGETS ${SQLITE_LIB_NAME}
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib)

## Component - sqlite_shell
set (SQLITE_SHELL_NAME
    sqlite_shell)
set (SQLITE_SHELL_SRCS
    shell.c)
if (WIN32)
    include (Windows-MyExeVersion)
    generate_product_exe_version (SQLITE_SHELL_VERSION_FILES
        NAME "sqlite3 - A command line interface for SQLite"
        BUNDLE "SQLite"
        ICON "${PROJECT_SOURCE_DIR}/sqlite.ico"
        VERSION_MAJOR ${SQLITE_VER_MAJOR}
        VERSION_MINOR ${SQLITE_VER_MINOR}
        VERSION_PATCH ${SQLITE_VER_PATCH}
        VERSION_REVISION ${MY_REVISION}
        ORIGINAL_FILENAME "sqlite3.exe")
    set (SQLITE_SHELL_SRCS
        ${SQLITE_SHELL_SRCS} ${SQLITE_SHELL_VERSION_FILES})
endif ()
if (NOT SQLITE_WITHOUT_APPS)
    add_executable (${SQLITE_SHELL_NAME}
        ${SQLITE_SHELL_SRCS})
    set_target_properties (${SQLITE_SHELL_NAME} PROPERTIES
        OUTPUT_NAME sqlite3)
    target_link_libraries (${SQLITE_SHELL_NAME}
        ${SQLITE_LIB_NAME})
    install (TARGETS ${SQLITE_SHELL_NAME}
        RUNTIME DESTINATION bin
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)
endif ()
