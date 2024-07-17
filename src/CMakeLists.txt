add_executable (cruz-web "CMakeProject1.cpp" "CMakeProject1.h")

set_target_properties(cruz-web PROPERTIES
    CXX_STANDARD 20
    CXX_STANDARD_REQUIRED ON
    CXX_EXTENSIONS OFF
    COMPILE_WARNING_AS_ERROR ON
)

if (MSVC)
    target_compile_options(cruz-web PRIVATE /W4)
else()
    target_compile_options(cruz-web PRIVATE -Wall -Wextra -pedantic)
endif()
