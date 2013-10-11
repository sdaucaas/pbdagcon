THIRDPARTY := ../../../../../ThirdParty
BOOST := $(THIRDPARTY)/boost/boost_1_47_0
BOOST_THREAD_ARCH := $(BOOST)/stage/linux_gcc/lib/libboost_thread.a
BOOST_OPTS_ARCH := $(BOOST)/stage/linux_gcc/lib/libboost_program_options.a
LOG4CPP := $(THIRDPARTY)/log4cpp/log4cpp-1.0
BLASR_COMMON := ../../../../lib/cpp/alignment
BLASR_ARCH := ../../../../lib/cpp/alignment/libblasr.a
CXX_OPTS := -I $(BLASR_COMMON) -I $(LOG4CPP)/include -I $(BOOST) -std=c++0x -Wall -Wuninitialized -Wno-div-by-zero -fpermissive -pedantic -c -fmessage-length=0 -MMD -MP

SRCS := $(wildcard *.cpp)
OBJS := $(SRCS:.cpp=.o)

all : CXXFLAGS = -O3

all: pbdagcon 

debug : CXXFLAGS = -g -fno-inline

debug: pbdagcon

pbdagcon: $(OBJS) $(BLASR_ARCH) $(LOG4CPP)/src/.libs/liblog4cpp.a $(BOOST_THREAD_ARCH) $(BOOST_OPTS_ARCH)
	$(CXX) -o $@ $^ -lpthread

%.o: %.cpp | $(LOG4CPP)/include/log4cpp/config.h
	$(CXX) $(CXXFLAGS) $(CXX_OPTS) -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"

$(LOG4CPP)/src/.libs/liblog4cpp.a:
	$(MAKE) -C $(LOG4CPP)/src

$(LOG4CPP)/include/log4cpp/config.h:
	# Touch these files to avoid using aclocal, autoconf and automake
	# (perforce may mess up the timestamps so the files look out of date)
	# The pregenerated versions of configure, Makefile.in and acinclude.m4
	# should be fine.
	touch $(LOG4CPP)/aclocal.m4;
	touch $(LOG4CPP)/Makefile.in;
	touch $(LOG4CPP)/configure;
	cd $(LOG4CPP) && (if [ -f Makefile ]; then $(MAKE) distclean; fi) && ./configure

clean:
	rm -f *.d
	rm -f *.o
	rm -f pbdagcon

.PHONY: all clean