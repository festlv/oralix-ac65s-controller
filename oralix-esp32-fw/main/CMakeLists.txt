set(SRCS
        main.c
        telnet.c
        telnet.h
        driver.c
        driver.h)

idf_component_register(SRCS ${SRCS}
                    INCLUDE_DIRS ".")
