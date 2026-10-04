function mousebat --description "Get MX Master 3S battery level with Ayu Dark colors"
    # Extract the percentage
    set -l percentage (upower --dump | sed -n '/mouse/,/percentage/p' | grep percentage | awk '{print $2}')

    if test -n "$percentage"
        # Define Ayu Dark colors
        set -l orange ffb454
        set -l green b8cc52

        # Print with a nice icon and color
        set_color $orange
        echo -n "󰍽 Mouse: "
        set_color $green
        echo "$percentage"
        set_color normal
    else
        set_color ff3333 # Ayu Red
        echo "󰍽 Mouse not found or disconnected."
        set_color normal
    end
end
