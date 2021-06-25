cxx = g++
cflags = -O2 -Wall --std=c++17

sources = $(wildcard *.cpp)

.PHONY : build clean rebuild

build : main
clean :
	rm -f main *.o *.d
rebuild : | clean build

main : $(sources:%.cpp=%.o)
	$(cxx) $(cflags) $(lflags) $(libs) -o $@ $^

%.o %.d : %.cpp
	$(cxx) $(cflags) $(includes) -MMD -c $<
include $(wildcard *.d)
