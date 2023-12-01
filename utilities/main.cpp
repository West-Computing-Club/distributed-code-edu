#include "lib/add_file.h"
#include "lib/create_directories.h"
#include "lib/extension_monitor.h"
#include "lib/remove_file.h"

#include "iostream"
#include <cstring>


int main (int argc, char* argv[])  {

    if (argc < 2) {
        std::cout << "No arguments passed. Please try passing some arguments and try again." << std::endl;
        return -1;
    } 

    if (strcmp(argv[1], "add_file") == 0) {
        std::cout << "Adding a file..." << std::endl;
        add_file(argc, argv);

    }

    else if (strcmp(argv[1], "create_directories") == 0) {
                std::cout << "creating directory" << std::endl;
                return create_directories();


    }

    else if (strcmp(argv[1], "monitor_extension") == 0) {
                std::cout << "Monitoring extensions" << std::endl;

    }

    else if (strcmp(argv[1], "remove_file") == 0) {
                std::cout << "Removing File" << std::endl;

                return remove_file(argc, argv);

    }

    else {
        std::cout << "INVALID. Please put a valid command." << std::endl;
    }



    


}