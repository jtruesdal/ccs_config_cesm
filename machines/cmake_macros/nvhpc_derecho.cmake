if (COMP_NAME STREQUAL mpi-serial)
   string(APPEND CFLAGS " -std=c89 ")
   string(APPEND CXXFLAGS " -std=c89 ")
endif()
if (NOT DEBUG)
  string(APPEND FFLAGS " -tp=zen3")
  string(APPEND CXXFLAGS " -tp=zen3")
endif()

if (USE_KOKKOS)
  set(EKAT_MACH_FILES_PATH ${SRC_ROOT}/libraries/ekat/cmake/machine-files)
  include (${EKAT_MACH_FILES_PATH}/kokkos/amd-zen3.cmake)
  include (${EKAT_MACH_FILES_PATH}/kokkos/openmp.cmake)
  include (${EKAT_MACH_FILES_PATH}/mpi/other.cmake)
  set(EKAT_MPI_EXTRA_ARGS "${EKAT_MPI_EXTRA_ARGS} --gpus-per-task=1" CACHE STRING "" FORCE)
  set(CMAKE_CXX_FLAGS "-DTHRUST_IGNORE_CUB_VERSION_CHECK" CACHE STRING "" FORCE)
endif()