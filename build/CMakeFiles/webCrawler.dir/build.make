# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/Cellar/cmake/3.25.1/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/Cellar/cmake/3.25.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/aqi/Documents/GitHub/webCrawler

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/aqi/Documents/GitHub/webCrawler/build

# Include any dependencies generated for this target.
include CMakeFiles/webCrawler.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/webCrawler.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/webCrawler.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/webCrawler.dir/flags.make

CMakeFiles/webCrawler.dir/main.cpp.o: CMakeFiles/webCrawler.dir/flags.make
CMakeFiles/webCrawler.dir/main.cpp.o: /Users/aqi/Documents/GitHub/webCrawler/main.cpp
CMakeFiles/webCrawler.dir/main.cpp.o: CMakeFiles/webCrawler.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/aqi/Documents/GitHub/webCrawler/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/webCrawler.dir/main.cpp.o"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/webCrawler.dir/main.cpp.o -MF CMakeFiles/webCrawler.dir/main.cpp.o.d -o CMakeFiles/webCrawler.dir/main.cpp.o -c /Users/aqi/Documents/GitHub/webCrawler/main.cpp

CMakeFiles/webCrawler.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/webCrawler.dir/main.cpp.i"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/aqi/Documents/GitHub/webCrawler/main.cpp > CMakeFiles/webCrawler.dir/main.cpp.i

CMakeFiles/webCrawler.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/webCrawler.dir/main.cpp.s"
	/Library/Developer/CommandLineTools/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/aqi/Documents/GitHub/webCrawler/main.cpp -o CMakeFiles/webCrawler.dir/main.cpp.s

# Object files for target webCrawler
webCrawler_OBJECTS = \
"CMakeFiles/webCrawler.dir/main.cpp.o"

# External object files for target webCrawler
webCrawler_EXTERNAL_OBJECTS =

webCrawler: CMakeFiles/webCrawler.dir/main.cpp.o
webCrawler: CMakeFiles/webCrawler.dir/build.make
webCrawler: _deps/cpr-build/cpr/libcpr.1.9.0.dylib
webCrawler: _deps/curl-build/lib/libcurl-d.dylib
webCrawler: /Library/Developer/CommandLineTools/SDKs/MacOSX13.0.sdk/usr/lib/libz.tbd
webCrawler: /opt/homebrew/Cellar/gumbo-parser/0.10.1/lib/libgumbo.dylib
webCrawler: CMakeFiles/webCrawler.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/aqi/Documents/GitHub/webCrawler/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable webCrawler"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/webCrawler.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/webCrawler.dir/build: webCrawler
.PHONY : CMakeFiles/webCrawler.dir/build

CMakeFiles/webCrawler.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/webCrawler.dir/cmake_clean.cmake
.PHONY : CMakeFiles/webCrawler.dir/clean

CMakeFiles/webCrawler.dir/depend:
	cd /Users/aqi/Documents/GitHub/webCrawler/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/aqi/Documents/GitHub/webCrawler /Users/aqi/Documents/GitHub/webCrawler /Users/aqi/Documents/GitHub/webCrawler/build /Users/aqi/Documents/GitHub/webCrawler/build /Users/aqi/Documents/GitHub/webCrawler/build/CMakeFiles/webCrawler.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/webCrawler.dir/depend

