include_directories(${Qt6Widgets_INCLUDE_DIRS} ${QtQml_INCLUDE_DIRS})
add_definitions(${Qt6Widgets_DEFINITIONS} ${QtQml_DEFINITIONS} ${${Qt6Quick_DEFINITIONS}})

qt_add_resources(QT_RESOURCES qml.qrc)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${Q6Widgets_EXECUTABLE_COMPILE_FLAGS}")
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(PROJECT "lumen")

project(${PROJECT})

if(NOT DEFINED HEADERS)
    file(GLOB HEADERS ${CMAKE_CURRENT_SOURCE_DIR}/*.h)
endif()

if(NOT DEFINED SOURCES)
    file(GLOB SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
endif()

source_group("Header Files" FILES ${HEADERS})
source_group("Source Files" FILES ${SOURCES})

add_executable(${PROJECT} ${HEADERS} ${SOURCES} ${QT_RESOURCES})

target_link_libraries(${PROJECT}
    Qt6::Widgets
    Qt6::Qml
    Qt6::Quick)

install(TARGETS ${PROJECT}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})

