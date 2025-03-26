set(CONFIG_ARGS "--host=cray")
string(APPEND CFLAGS " -qopt-report -march=core-avx2")
string(APPEND FFLAGS " -qopt-report -march=core-avx2")
if (COMP_NAME STREQUAL gptl)
  string(APPEND CPPDEFS " -DHAVE_SLASHPROC")
endif()
if (COMP_NAME STREQUAL mpi-serial)
  string(APPEND CFLAGS " -std=c89 ")
endif()	
if (MPILIB STREQUAL mpi-serial AND NOT compile_threaded)
  set(PFUNIT_PATH "$ENV{CESMDATAROOT}/tools/pFUnit/pFUnit4.8.0_derecho_Intel2023.2.1_noMPI_noOpenMP")
endif()
set(SCC icx)
set(SCXX icpx)
set(SFC ifort)

if (USE_KOKKOS)
  set(EKAT_MACH_FILES_PATH ${SRC_ROOT}/libraries/ekat/cmake/machine-files)
  include (${EKAT_MACH_FILES_PATH}/kokkos/amd-zen3.cmake)
  include (${EKAT_MACH_FILES_PATH}/kokkos/openmp.cmake)
  include (${EKAT_MACH_FILES_PATH}/mpi/other.cmake)
  set(CMAKE_CXX_FLAGS "-DTHRUST_IGNORE_CUB_VERSION_CHECK" CACHE STRING "" FORCE)
endif()