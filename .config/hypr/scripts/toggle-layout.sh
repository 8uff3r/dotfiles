 #!/usr/bin/env bash

CURRENT_LAYOUT=$(hyprctl getoption general:layout | awk 'NR=1{print $2}')
if [[ $CURRENT_LAYOUT == dwindle ]];then
  hyprctl keyword general:layout master
elif [[ $CURRENT_LAYOUT == master ]];then
  hyprctl keyword general:layout dwindle
fi
