CXXFLAGS := $(shell llvm-config --cxxflags)
LLVMLDFLAGS := $(shell llvm-config --ldflags --libs)
DDD := $(shell echo $(LLVMLDFLAGS))
SOURCES = tutorial1.cpp \
    tutorial2.cpp \
    tutorial3.cpp \
    tutorial4.cpp \
    tutorial6.cpp 
OBJECTS = $(SOURCES:.cpp=.o)
EXES = $(OBJECTS:.o=)
CLANGLIBS = -lclangParse \
    -lclangSema \
    -lclangAnalysis \
    -lclangAST \
	-lclangFrontend \
	-lclangLex \
	-lclangBasic \
	-lLLVMSupport \

all: $(OBJECTS) $(EXES)

%: %.o
	$(CXX) -o $@ $< $(CLANGLIBS) $(LLVMLDFLAGS)

clean:
	-rm -f $(EXES) $(OBJECTS) *~
