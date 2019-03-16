# this file settings some environment variables for program and user, see [1]
# [1] https://wiki.archlinux.org/index.php/environment_variables


# override some locale settings for GUI to display and use zh_TW
# (Global configulation should : LANG=en_US.UTF-8)
export LANGUAGE=zh_TW:en_US
export LC_MESSAGES=zh_TW.UTF-8
export LC_CTYPE=zh_TW.UTF-8


# environment variable and default program settings
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/palemoon
export VISUAL=/usr/bin/vim


# input method module support for fcitx, see [1]
# [1] https://wiki.archlinux.org/index.php/Fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
