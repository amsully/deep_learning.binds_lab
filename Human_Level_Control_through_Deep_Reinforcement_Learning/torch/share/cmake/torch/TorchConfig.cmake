# This (ugly) setup assumes:
#  CMAKE_PREFIX_PATH = LUA_BINDIR
#  CMAKE_INSTALL_PREFIX = PREFIX

# Define Torch basic subpaths
SET(Torch_INSTALL_PREFIX "/home/ubuntu/binds_lab/Human_Level_Control_through_Deep_Reinforcement_Learning/torch")

SET(Torch_INSTALL_BIN_SUBDIR "bin")
SET(Torch_INSTALL_MAN_SUBDIR "share/man")
SET(Torch_INSTALL_LIB_SUBDIR "lib")
SET(Torch_INSTALL_SHARE_SUBDIR "share")
SET(Torch_INSTALL_INCLUDE_SUBDIR "include")
SET(Torch_INSTALL_CMAKE_SUBDIR "share/cmake/torch")
SET(Torch_INSTALL_LUA_PATH_SUBDIR "lib/luarocks/rocks/torch/scm-1/lua")
SET(Torch_INSTALL_LUA_CPATH_SUBDIR "lib/luarocks/rocks/torch/scm-1/lib")
SET(Torch_INSTALL_CMAKE_RIDBUS "../../..")

FILE(RELATIVE_PATH Torch_INSTALL_LUA_PATH_SUBDIR "${Torch_INSTALL_PREFIX}" "${CMAKE_INSTALL_PREFIX}/lua")
FILE(RELATIVE_PATH Torch_INSTALL_LUA_CPATH_SUBDIR "${Torch_INSTALL_PREFIX}" "${CMAKE_INSTALL_PREFIX}/lib")

SET(CMAKE_MODULE_PATH "${Torch_INSTALL_PREFIX}/${Torch_INSTALL_CMAKE_SUBDIR}" "${CMAKE_MODULE_PATH}")
SET(CMAKE_INSTALL_PREFIX "${Torch_INSTALL_PREFIX}") # override

INCLUDE(TorchPathsInit)
INCLUDE(TorchPackage)
INCLUDE(TorchWrap)

# Define Torch basic targets
INCLUDE(TorchExports)

INCLUDE_DIRECTORIES("${Torch_INSTALL_INCLUDE}")
INCLUDE_DIRECTORIES("${Torch_INSTALL_INCLUDE}/TH")
LINK_DIRECTORIES("${Torch_INSTALL_LIB}")

MESSAGE(STATUS "Found Torch7 in ${Torch_INSTALL_PREFIX}")
