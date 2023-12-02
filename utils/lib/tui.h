// This is a fragment of an old TUI library.
// Use with caution.
// - ObjectOops

#ifndef TUI_H
#define TUI_H

namespace tin {
    extern bool isInit ;
    // Note: Assumes that the terminal state is with canonical and echo mode enabled. So it resets to those settings once done.
    bool init();
    bool uninit() ;
    // Checks if data is available in the input buffer. Does not block the calling thread.
    bool kbhit() ;
    // Gets a character as soon as one is available. Blocks the calling thread.
    // To be used in conjunction with kbhit.
    char getch() ;
}

#endif
