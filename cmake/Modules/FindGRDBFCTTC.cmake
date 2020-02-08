# Copyright (C) 2011-2019 (see AUTHORS file for a list of contributors)
#
# This file is part of GNSS-SDR.
#
# SPDX-License-Identifier: GPL-3.0-or-later

########################################################################
# Find  GR-DBFCTTC Module
########################################################################

#
# Provides the following imported target:
# Gnuradio::dbfcttc
#

set(PKG_CONFIG_USE_CMAKE_PREFIX_PATH TRUE)
include(FindPkgConfig)
pkg_check_modules(PC_GR_DBFCTTC gr-dbfcttc)

find_path(
    GR_DBFCTTC_INCLUDE_DIRS
    NAMES dbfcttc/api.h
    HINTS ${PC_GR_DBFCTTC_INCLUDEDIR}
    PATHS /usr/include
          /usr/local/include
          /opt/local/include
          ${CMAKE_INSTALL_PREFIX}/include
          ${GRDBFCTTC_ROOT}/include
          $ENV{GRDBFCTTC_ROOT}/include
          $ENV{GR_DBFCTTC_DIR}/include
)

find_library(
    GR_DBFCTTC_LIBRARIES
    NAMES gnuradio-dbfcttc
    HINTS ${PC_GR_DBFCTTC_LIBDIR}
    PATHS /usr/lib
          /usr/lib64
          /usr/local/lib
          /usr/local/lib64
          /opt/local/lib
          ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          ${GRDBFCTTC_ROOT}/lib
          $ENV{GRDBFCTTC_ROOT}/lib
          ${GRDBFCTTC_ROOT}/lib64
          $ENV{GRDBFCTTC_ROOT}/lib64
          $ENV{GR_DBFCTTC_DIR}/lib
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GRDBFCTTC DEFAULT_MSG GR_DBFCTTC_LIBRARIES GR_DBFCTTC_INCLUDE_DIRS)

if(GRDBFCTTC_FOUND AND NOT TARGET Gnuradio::dbfcttc)
    add_library(Gnuradio::dbfcttc SHARED IMPORTED)
    set_target_properties(Gnuradio::dbfcttc PROPERTIES
        IMPORTED_LINK_INTERFACE_LANGUAGES "CXX"
        IMPORTED_LOCATION "${GR_DBFCTTC_LIBRARIES}"
        INTERFACE_INCLUDE_DIRECTORIES "${GR_DBFCTTC_INCLUDE_DIRS}"
        INTERFACE_LINK_LIBRARIES "${GR_DBFCTTC_LIBRARIES}"
    )
endif()

mark_as_advanced(GR_DBFCTTC_LIBRARIES GR_DBFCTTC_INCLUDE_DIRS)
