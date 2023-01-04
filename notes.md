
if QtCreator does not find your qt version: run `rm -rf ~/.config/QtProject*`

in the qtcreator options under "kits" in the Qt kit settings that you want to
use, there's two compiler paths for C/C++. select the one with "wrapper" in it.

the following env vars are needed to run the unpatched app:
  - QML2_IMPORT_PATH
  - QT_ADDITIONAL_PACKAGES_PREFIX_PATH
