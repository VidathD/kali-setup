#!/bin/zsh

function main {
    # Move files to $HOME
    function home_setup {
        #mv $HOME/.zshrc $HOME/.zshrc.bak
        cp ./files/home/* $HOME/ -r
        #source ~/.zshrc
    }

    # Setup apt with point-release repo
    function repo_setup {
        sudo mv /etc/apt/sources.list /etc/apt/sources.list.bak
        sudo cp ./files/etc/aptsources.list /etc/apt/sources.list
        sudo apt update
    }

    # Setup MOTD message
    function motd_setup {
        cp ./files/etc/update-motd.d /etc/update-motd
        sudo apt install landscape-common unattended-upgrades
    }

    # Install programs

    # General tools
    function general_tools {
        sudo apt install exa neofetch asciinema htop kali-tweaks
    }

    # Rev and BinEx
    function rev_binex_tools {
        sudo apt install patchelf gdb checksec
        cargo install pwninit
    }

    # Steg
    function steg_tools {
        pip3 install flare-floss --user
        sudo apt install foremost binwalk
    }

    # Network
    function network_tools {
        sudo apt install nmap stunnel proxychains4
    }

    # Meme
    function meme_tools {
        sudo apt install nyancat cmatrix cowsay lolcat nyancat-server fortune
        mkdir $HOME/bin
        # echo "curl parrot.live" > $HOME/bin/parrot
    }

    # Tool Menu
    function tool_manu {
        tool_selections=(
            "1. General tools (exa, neofetch, asciinema, htop, kali-tweaks)"
            "2. Rev and BinEx tools (patchelf, gdb, checksec, pwninit)"
            "3. Steg tools (floss, foremost, binwalk)"
            "4. Network tools (nmap)"
            "5. Meme tools (nyancat[-server], cmatrix, cowsay, lolcat, fortune, terminal-parrot"
            "*. All of the above"
        )
        echo "Which tools do you want to install? Provide a space seperated list of corresponding number."
        echo "    $tool_selections[1]"
        echo "    $tool_selections[2]"
        echo "    $tool_selections[3]"
        echo "    $tool_selections[4]"
        echo "    $tool_selections[5]"
        echo "    $tool_selections[6]"
        declare -a tool_options
        read "tool_options[1]" "tool_options[2]" "tool_options[3]" "tool_options[4]" "tool_options[5]" "tool_options[6]"
    }

    # Menu
    function main_menu {
        main_selections=(
            "1. Move files to $HOME"
            "2. Setup apt with point-release repo"
            "3. Install tools"
            "*. All of the above"
        )
        echo "What do you want to do? Provide space seperated list of corresponding number."
        echo "    $main_selections[1]"
        echo "    $main_selections[2]"
        echo "    $main_selections[3]"
        echo "    $main_selections[4]"
        declare -a main_options
        read "main_options[1]" "main_options[2]" "main_options[3]" "main_options[4]"
        echo "$main_options"
        #for index in "${!options[@]}"; do echo "$index"; done
    #    declare -a selected_options
    #    for i in "${!options[@]}"
    #        do
    #            echo "$i"
    #       case "$i" in
    #            0)				;;
    #            1)  echo "1 was selected"   ;;
    #            2)  echo "2 was selected"   ;;
    #            3)  echo "3 was selected"   ;;
    #            *)  echo "Invalid input"    ;;
    #            1   selected_options+=(selections[0])
    #            2   selected_options+=(selections[1])
    #            3   selected_options+=(selections[2])
    #        esac
    }

    main_menu
}

main