#!/bin/bash

##
# "Let's draw" is a bash script to simulate shuffling and drawing a deck of cards.
#
# It requires CoreUtils, as it makes use of "shuf" as called with "gshuf" in the script.
# This can be installed using brew if available, with: "brew install coreutils"
# 
##

reset
set -e
unset deck_array
unset hand_array
unset shuffled_array


# Function to check if item already exists in array
function checkArray
{
 for item in "${shuffled_array[@]}"
 do
 [[ "$item" == "$1" ]] && return 0 # Exists in shuffled_array
 done
 return 1 # Not found
}

function open_deck() {
    clear
    unset deck_array
    unset hand_array
    echo ""
	echo "Opening a new a deck of cards... "
	deck_array=("2♠"  "3♠"  "4♠"  "5♠"  "6♠"  "7♠"  "8♠"  "9♠"  "10♠" "J♠"  "Q♠"  "K♠" "A♠"  "2♥"  "3♥"  "4♥"  "5♥"  "6♥"  "7♥"  "8♥"  "9♥"  "10♥" "J♥"  "Q♥" "K♥"  "A♥"  "2♦"  "3♦"  "4♦"  "5♦"  "6♦"  "7♦"  "8♦"  "9♦"  "10♦" "J♦" "Q♦"  "K♦"  "A♦"  "2♣"  "3♣"  "4♣"  "5♣"  "6♣"  "7♣"  "8♣"  "9♣"  "10♣" "J♣"  "Q♣"  "K♣"  "A♣")
	echo "This deck contains ${#deck_array[@]} cards"
	echo ""
}

function show_deck() {
	clear
    echo ""
	echo "The deck contains ${#deck_array[@]} card(s). "
    echo ""
	echo "${deck_array[@]}"
    echo ""
}

function shuffle() {
	clear
    echo ""
	echo "Shuffling the deck of cards... "
    echo ""
    unset shuffled_array
	while [ "${#shuffled_array[@]}" -ne "${#deck_array[@]}" ]
	do
		rand=$[ $RANDOM % ${#deck_array[@]} ] 
		checkArray "${deck_array[$rand]}" || shuffled_array=(${shuffled_array[@]} "${deck_array[$rand]}")
	done
	deck_array=("${shuffled_array[@]}")
    echo ""
}

function shuffle_hand_deck() {
	clear
    echo ""
	echo "Shuffling your hand back into the deck of cards... "
    echo ""
    unset hand_array
    unset shuffled_array
    deck_array=("2♠"  "3♠"  "4♠"  "5♠"  "6♠"  "7♠"  "8♠"  "9♠"  "10♠" "J♠"  "Q♠"  "K♠" "A♠"  "2♥"  "3♥"  "4♥"  "5♥"  "6♥"  "7♥"  "8♥"  "9♥"  "10♥" "J♥"  "Q♥" "K♥"  "A♥"  "2♦"  "3♦"  "4♦"  "5♦"  "6♦"  "7♦"  "8♦"  "9♦"  "10♦" "J♦" "Q♦"  "K♦"  "A♦"  "2♣"  "3♣"  "4♣"  "5♣"  "6♣"  "7♣"  "8♣"  "9♣"  "10♣" "J♣"  "Q♣"  "K♣"  "A♣")
	while [ "${#shuffled_array[@]}" -ne "${#deck_array[@]}" ]
	do
		rand=$[ $RANDOM % ${#deck_array[@]} ] 
		checkArray "${deck_array[$rand]}" || shuffled_array=(${shuffled_array[@]} "${deck_array[$rand]}")
	done
	deck_array=("${shuffled_array[@]}")
    echo ""
}

function dealOneCard() {
	clear
    echo ""
	if [ -z "${deck_array}" ]
	then 
		echo "There are no cards in the deck to draw."
	else 
		echo "Dealing you 1 card... "
		echo ""
		echo ${deck_array[0]}
		hand_array+=(${deck_array[0]})
		deck_array=("${deck_array[@]:1}")
	fi
	echo ""
}

function show_hand() {
	clear
    echo ""
	echo "Your hand contains ${#hand_array[@]} card(s). "
    echo ""
	echo "${hand_array[@]}"
    echo ""
}


menu(){
echo -ne "
            LETS DRAW
---------------------------------
1) Open a new deck of cards, discarding any existing.
2) Show all the cards in the deck.
3) Shuffle the deck, but keep your existing hand of cards (if any).
4) Shuffle your hand (if you have one) back into the deck.
5) Draw 1 card from the top of the deck.
6) Show me my hand.
0) Exit
'Choose an option:') "
        read a
        case $a in
	        1) open_deck ; menu ;;
	        2) show_deck ; menu ;;
	        3) shuffle ; menu ;;
	        4) shuffle_hand_deck ; menu ;;
	        5) dealOneCard ; menu ;;
	        6) show_hand ; menu ;;
		0) exit 0 ;;
		*) clear ; echo "Invalid menu option selected." ; menu ;;
        esac
}

# Call the menu function
menu
