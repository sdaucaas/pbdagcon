# Defines some variables specific to the PBI build env using relative paths
BASEDIR = ../../../../..
THIRDPARTY = $(BASEDIR)/ThirdParty
PREBUILT = $(BASEDIR)/smrtanalysis/prebuilt.out
BOOST = $(THIRDPARTY)/boost/boost_1_47_0
LOG4CPP = $(PREBUILT)/log4cpp/log4cpp-1.1/$(OS_STRING2)
GTEST ?= $(THIRDPARTY)/gtest-1.3.0
PBILIB = ../..
ALIGN = $(PBILIB)/alignment
PBDATA = $(PBILIB)/pbdata
INCDIRS = -I $(PBDATA) -I $(ALIGN) #-I $(BOOST) -I $(LOG4CPP)/include
LIBDIRS = -L $(PBDATA) -L $(ALIGN) #-L $(BOOST)/stage/linux_gcc/lib -L $(LOG4CPP)/lib
