pkgs:

pkgs.writeScript "bitwarden" ''
  #!/bin/sh

  handle() {
    case $1 in
      windowtitle*)
        # Extract the window ID from the line
        window_id=''${1#*>>}

        # Fetch the list of windows and parse it using jq to find the window by its decimal ID
        window_info=$(hyprctl clients -j | /nix/store/wj603ds3b3gdwsrlx4nzcg4v3ba2298b-jq-1.7.1-bin/bin/jq --arg id "0x$window_id" '.[] | select(.address == ($id))')

        # Extract the title from the window info
        window_title=$(echo "$window_info" | /nix/store/wj603ds3b3gdwsrlx4nzcg4v3ba2298b-jq-1.7.1-bin/bin/jq '.title')

        # Check if the title matches the characteristics of the Bitwarden popup window
        if [[ "$window_title" == *"(Bitwarden Password Manager) - Bitwarden"* ]]; then
        
          # echo $window_id, $window_title
          # hyprctl dispatch togglefloating address:0x$window_id
          # hyprctl dispatch resizewindowpixel exact 20% 40%,address:0x$window_id
          # hyprctl dispatch movewindowpixel exact 40% 30%,address:0x$window_id

          hyprctl --batch "dispatch setfloating address:0x$window_id; dispatch resizewindowpixel exact 20% 40%,address:0x$window_id ; dispatch focuswindow address:0x$window_id; dispatch alterzorder top; dispatch focuswindow address:0x$window_id; dispatch centerwindow; dispatch focuswindow address:0x$window_id; "
        fi
        ;;
    esac
  }

  # Listen to the Hyprland socket for events and process each line with the handle function
  /nix/store/0hzdcndgjriarf6yjr84nn7kbb3rgjah-socat-1.8.0.1/bin/socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
''
