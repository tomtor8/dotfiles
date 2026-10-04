function wifisig --description "Get WiFi signal strength with Ayu Dark colors"
    set -l signal (nmcli -t -f SIGNAL dev wifi list ifname wlo1 | head -n 1)

    if test -n "$signal"
        set_color ffb454 # Ayu Yellow
        echo -n "󰖩 Signal: "
        set_color b8cc52 # Ayu Green
        echo "$signal%"
        set_color normal
    else
        set_color ff3333 # Ayu Red
        echo "󰖪 WiFi disconnected"
        set_color normal
    end
end
