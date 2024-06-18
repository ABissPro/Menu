TARGET = ru.template.Menu

CONFIG += \
    auroraapp

PKGCONFIG += \

SOURCES += \
    src/main.cpp \

HEADERS += \

DISTFILES += \
    TreeData \
    qml/pages/BreedSelectionDialog.qml \
    qml/pages/DiametInputDialog.qml \
    qml/pages/HeightInputDialog.qml \
    qml/pages/TreeButton.qml \
    rpm/ru.template.Menu.spec \

AURORAAPP_ICONS = 86x86 108x108 128x128 172x172

CONFIG += auroraapp_i18n

TRANSLATIONS += \
    translations/ru.template.Menu.ts \
    translations/ru.template.Menu-ru.ts \

RESOURCES += \
    qml/resorces.qrc
