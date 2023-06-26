//
// Created by Wu Feiyang on 2023/2/1.
//

#ifndef EXPLORER_SHELL_H
#define EXPLORER_SHELL_H
#include "ch.hpp"
#include "hal.h"

class Shell{

public:

    static bool start(tprio_t prio);

    using CommandCallback = bool (*)(BaseSequentialStream *chp, int argc, char *argv[]);

    struct Command{
        const char *name;
        const char *arguments;
        CommandCallback callback;
        void *callbackArg;
    };

    static void addCommands(const Command *commandList);

    using FeedbackCallbackFunction = void (*)(void *);
};
#endif //EXPLORER_SHELL_H
