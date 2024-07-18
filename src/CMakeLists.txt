include(Macros)

add_executable (cruz-web "CMakeProject1.cpp" "CMakeProject1.h")

# Setup compiler options
set_target_properties(cruz-web PROPERTIES
    CXX_STANDARD 20
    CXX_STANDARD_REQUIRED ON
    CXX_EXTENSIONS OFF
    COMPILE_WARNING_AS_ERROR ON
)

# Choosing Appropriate warning flags
if (MSVC)
    target_compile_options(cruz-web PRIVATE /W4)
else()
    target_compile_options(cruz-web PRIVATE -Wall -Wextra -pedantic)
endif()

# Appropiate extension for emscripten build
if (EMSCRIPTEN)
    target_link_options(cruz-web PRIVATE
        -sUSE_WEBGPU
        -sASYNCIFY
    )

    set_target_properties(cruz-web PROPERTIES SUFFIX ".html")
else()
    find_package(Dawn REQUIRED)
    target_link_libraries(cruz-web PRIVATE dawn::webgpu_dawn)
    copy_target_dlls(cruz-web)
endif()
