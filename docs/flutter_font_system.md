# Font breaking issue analysis

```plantuml
@startuml
start
if (used custom font?) then (no[1])
    :Use system default font;
else (yes[2])
endif
if (glyph missing?) then (yes[4])
    :Use system fallback font;
    if (fallback font feature missing or glyph missing?) then (yes[5])
        #pink :font break;
        kill
        else (no[6])
        #palegreen :render;
        kill
    endif
else (no[3])
    #palegreen :render;
    kill
endif
@enduml
```

Problems:
1. Using fontconfig breaks route [1] > [3] for English language on Galaxy Watch.

    This is probably a bug. On Galxy Watch, fontconfig matches English text to Malayan font, which can't express Latin characters.

2. Not using fontconfig breaks route [2] > [4] > [5] for any language.

    This is due to unimplemented method; `SkFontMgr_Custom.onMatchFamilyStyleCharacter`.

Solving either one will fix the font breaking error:

1. Configure the fontconfig configuration file in `/etc/fonts` so that the system matches correct language font for English text. 

    This solution may only be feasible if Tizen user can modify files in that directory. Furthermore, it also requires understanding the tedius fontconfig configuration system to make the necessary changes.

2. Implement `SkFontMgr_Custom.onMatchFamilyStyleCharacter`.

    This solution will make changes to the skia code which is hard to maintain afterwards. Furthermore, implementing the function is not so simple.

Note that all other platforms(except Linux) have their own implementation of `SkFontMgr_Custom.onMatchFamilyStyleCharacter` in skia.