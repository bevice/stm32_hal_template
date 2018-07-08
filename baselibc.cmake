INCLUDE_DIRECTORIES(
        ${BASELIBC_DIR}/include
        ${BASELIBC_DIR}/src/templates
)

file(GLOB BASELIBC_C_FILES ${BASELIBC_DIR}/src/*.c)
file(GLOB BASELIBC_H_FILES ${BASELIBC_DIR}/include/*.h)

