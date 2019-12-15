#-------------------------------------------------
#
# Project created by QtCreator 2018-04-11T12:57:49
#
#-------------------------------------------------

QT += core gui multimedia svg

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Mu
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000 # disables all the APIs deprecated before Qt 6.0.0

# OS 5 support is mandatory for the QT port
CONFIG += support_palm_os5

windows{
    RC_ICONS = windows/Mu.ico
    *msvc*{
        QMAKE_CFLAGS += -openmp
        QMAKE_CXXFLAGS += -openmp
        DEFINES += "_Pragma=__pragma" EMU_MULTITHREADED
    }
    *-g++{
        QMAKE_CFLAGS += -fopenmp
        QMAKE_CXXFLAGS += -fopenmp
        QMAKE_LFLAGS += -fopenmp
        DEFINES += EMU_MULTITHREADED EMU_MANAGE_HOST_CPU_PIPELINE
    }
}

macx{
    # QMAKE_CFLAGS += -std=c89 -D__STDBOOL_H -Dinline= -Dbool=char -Dtrue=1 -Dfalse=0 # tests C89 mode
    ICON = macos/Mu.icns
    QMAKE_INFO_PLIST = macos/Info.plist
    DEFINES += EMU_MULTITHREADED EMU_MANAGE_HOST_CPU_PIPELINE
}

linux-g++{
    QMAKE_CFLAGS += -fopenmp
    QMAKE_CXXFLAGS += -fopenmp
    QMAKE_LFLAGS += -fopenmp
    DEFINES += EMU_MULTITHREADED EMU_MANAGE_HOST_CPU_PIPELINE
}

android{
    QMAKE_CFLAGS += -fopenmp
    QMAKE_CXXFLAGS += -fopenmp
    QMAKE_LFLAGS += -fopenmp
    DEFINES += EMU_MULTITHREADED EMU_MANAGE_HOST_CPU_PIPELINE
}


CONFIG(debug, debug|release){
    # debug build, be accurate, fail hard, and add logging
    DEFINES += EMU_DEBUG EMU_CUSTOM_DEBUG_LOG_HANDLER
    macx|linux-g++{
        # also check for any buffer overflows and memory leaks
        # -fsanitize=undefined,leak
        QMAKE_CFLAGS += -fstack-protector-strong -fsanitize=address -Werror=array-bounds
        QMAKE_CXXFLAGS += -fstack-protector-strong -fsanitize=address -Werror=array-bounds
        QMAKE_LFLAGS += -fsanitize=address
    }
}else{
    # release build, go fast
    CONFIG += EMU_NO_SAFETY
}

EMU_NO_SAFETY{
    DEFINES += EMU_NO_SAFETY
}

DEFINES += EMU_SUPPORT_PALM_OS5 # the Qt build will not be supporting anything too slow to run OS 5
CONFIG += c++11

INCLUDEPATH += $$PWD/qt-common/include

SOURCES += \
    ../../src/ads7846.c \
    ../../src/audio/blip_buf.c \
    ../../src/dbvz.c \
    ../../src/emulator.c \
    ../../src/fileLauncher/launcher.c \
    ../../src/flx68000.c \
    ../../src/m5XXBus.c \
    ../../src/m68k/m68kcpu.c \
    ../../src/m68k/m68kdasm.c \
    ../../src/m68k/m68kopac.c \
    ../../src/m68k/m68kopdm.c \
    ../../src/m68k/m68kopnz.c \
    ../../src/m68k/m68kops.c \
    ../../src/pdiUsbD12.c \
    ../../src/pxa260/disasm.c \
    ../../src/pxa260/pxa260.c \
    ../../src/pxa260/pxa260I2c.c \
    ../../src/pxa260/pxa260Memctrl.c \
    ../../src/pxa260/pxa260Ssp.c \
    ../../src/pxa260/pxa260Timing.c \
    ../../src/pxa260/pxa260Udc.c \
    ../../src/pxa260/pxa260_CPU.c \
    ../../src/pxa260/pxa260_DMA.c \
    ../../src/pxa260/pxa260_DSP.c \
    ../../src/pxa260/pxa260_GPIO.c \
    ../../src/pxa260/pxa260_IC.c \
    ../../src/pxa260/pxa260_LCD.c \
    ../../src/pxa260/pxa260_MMU.c \
    ../../src/pxa260/pxa260_PwrClk.c \
    ../../src/pxa260/pxa260_RTC.c \
    ../../src/pxa260/pxa260_TIMR.c \
    ../../src/pxa260/pxa260_UART.c \
    ../../src/pxa260/pxa260_cp15.c \
    ../../src/pxa260/pxa260_icache.c \
    ../../src/pxa260/uArmGlue.c \
    ../../src/sdCard.c \
    ../../src/sed1376.c \
    ../../src/silkscreen.c \
    ../../src/tps65010.c \
    ../../src/tsc2101.c \
    ../../src/w86l488.c \
    debugviewer.cpp \
    emuwrapper.cpp \
    main.cpp \
    mainwindow.cpp \
    statemanager.cpp \
    touchscreen.cpp \
    settingsmanager.cpp

HEADERS += \
    ../../src/ads7846.h \
    ../../src/audio/blip_buf.h \
    ../../src/dbvz.h \
    ../../src/dbvzRegisterAccessors.c.h \
    ../../src/dbvzRegisterNames.c.h \
    ../../src/dbvzTiming.c.h \
    ../../src/emulator.h \
    ../../src/fileLauncher/launcher.h \
    ../../src/flx68000.h \
    ../../src/m5XXBus.h \
    ../../src/m68k/m68k.h \
    ../../src/m68k/m68kconf.h \
    ../../src/m68k/m68kcpu.h \
    ../../src/m68k/m68kexternal.h \
    ../../src/m68k/m68kops.h \
    ../../src/pdiUsbD12.h \
    ../../src/pdiUsbD12CommandNames.c.h \
    ../../src/portability.h \
    ../../src/pxa260/disasm.h \
    ../../src/pxa260/pxa260.h \
    ../../src/pxa260/pxa260Accessors.c.h \
    ../../src/pxa260/pxa260I2c.h \
    ../../src/pxa260/pxa260Memctrl.h \
    ../../src/pxa260/pxa260Ssp.h \
    ../../src/pxa260/pxa260Timing.h \
    ../../src/pxa260/pxa260Udc.h \
    ../../src/pxa260/pxa260_CPU.h \
    ../../src/pxa260/pxa260_DMA.h \
    ../../src/pxa260/pxa260_DSP.h \
    ../../src/pxa260/pxa260_GPIO.h \
    ../../src/pxa260/pxa260_IC.h \
    ../../src/pxa260/pxa260_LCD.h \
    ../../src/pxa260/pxa260_MMU.h \
    ../../src/pxa260/pxa260_PwrClk.h \
    ../../src/pxa260/pxa260_RTC.h \
    ../../src/pxa260/pxa260_TIMR.h \
    ../../src/pxa260/pxa260_UART.h \
    ../../src/pxa260/pxa260_cp15.h \
    ../../src/pxa260/pxa260_icache.h \
    ../../src/pxa260/pxa260_math64.h \
    ../../src/pxa260/pxa260_types.h \
    ../../src/pxa260/uArmGlue.h \
    ../../src/sdCard.h \
    ../../src/sdCardAccessors.c.h \
    ../../src/sdCardCommandNames.c.h \
    ../../src/sdCardCrcTables.c.h \
    ../../src/sed1376.h \
    ../../src/sed1376Accessors.c.h \
    ../../src/sed1376RegisterNames.c.h \
    ../../src/silkscreen.h \
    ../../src/tps65010.h \
    ../../src/tsc2101.h \
    ../../src/tungstenT3Bus.h \
    ../../src/w86l488.h \
    debugviewer.h \
    emuwrapper.h \
    mainwindow.h \
    statemanager.h \
    touchscreen.h \
    settingsmanager.h


FORMS += \
    mainwindow.ui \
    debugviewer.ui \
    statemanager.ui \
    settingsmanager.ui

CONFIG += mobility
MOBILITY = 

DISTFILES += \
    ../../src/fileLauncher/readme.md \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/res/drawable-hdpi/icon.png \
    android/res/drawable-ldpi/icon.png \
    android/res/drawable-mdpi/icon.png \
    images/boot.svg \
    images/addressBook.svg \
    images/calendar.svg \
    images/center.svg \
    images/center.svg \
    images/debugger.svg \
    images/down.svg \
    images/install.svg \
    images/left.svg \
    images/left.svg \
    images/notes.svg \
    images/pause.svg \
    images/play.svg \
    images/power.svg \
    images/right.svg \
    images/right.svg \
    images/screenshot.svg \
    images/settingsManager.svg \
    images/stateManager.svg \
    images/stop.svg \
    images/todo.svg \
    images/up.svg

RESOURCES += \
    mainwindow.qrc

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
