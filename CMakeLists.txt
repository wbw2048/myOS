cmake_minimum_required(VERSION 3.16)
project(MyOS C)

set(CMAKE_C_COMPILER i386-elf-gcc)

set(CMAKE_C_FLAGS "-m32 -ffreestanding -O2 -Wall -Wextra")

include_directories(include)

add_executable(MyOS src/kernel/kernel.c src/boot/boot.asm)

set_target_properties(MyOS PROPERTIES LINKER_LANGUAGE C)

target_link_options(MyOS PRIVATE -T ${CMAKE_SOURCE_DIR}/linker.ld -nostartfiles -nodefaultlibs -nostdlib -Wl,--build-id=none -Wl,--nmagic -Wl,-e,start)
