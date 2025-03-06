set(CONFIG_ARGS "--host=cray")
string(APPEND CFLAGS " -march=core-avx2")
string(APPEND FFLAGS " -march=core-avx2")
if (COMP_NAME STREQUAL gptl)
  string(APPEND CPPDEFS " -DHAVE_SLASHPROC")
endif()
if (COMP_NAME STREQUAL mpi-serial)
  string(APPEND CFLAGS " -std=c89 ")
endif()	
if (MPILIB STREQUAL mpi-serial AND NOT compile_threaded)
  set(PFUNIT_PATH "$ENV{CESMDATAROOT}/tools/pFUnit/pFUnit4.8.0_derecho_Intel2023.2.1_noMPI_noOpenMP")
endif()
string(APPEND LDFLAGS " -lstdc++ -lkokkoscontainers -lkokkoscore -lkokkossimd ")
set(SCC "icx")
set(SCXX "icpx")
set(SFC "ifort")
