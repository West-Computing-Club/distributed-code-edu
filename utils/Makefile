# Compiler
CXX = g++

# Compiler flags
CXXFLAGS = -std=c++17

# Source files
SRCS = lib/tui.cpp lib/parse_list.cpp lib/create_directories.cpp lib/add_file.cpp lib/remove_file.cpp lib/page_writer.cpp main.cpp  



# Object files
all: openvscodeserver.app clean

OBJS = $(SRCS:.cpp=.o)
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@
# Rule to build object files from source files



# Rule to build the executable
openvscodeserver.app: $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@

# Rule to build object files from source files

.PHONY: clean
clean:
	rm -f $(OBJS) 


