# Let's Draw


## Description

Let's Draw is a bash script to simulate shuffling and drawing a real deck of cards.

This script has an interactive menu for ease of use.

It creates a standard 52 playing card deck of: 

- Four suits: hearts, spades, clubs and diamonds.
- Face values of the cards: Ace, 2-10, Jack, Queen, and King.


## Prerequisites

- A bash shell


## Installation

You can create lets_draw.sh using your preferred text editor (e.g. vim, nano, Sublime Text, Atom, etc).

You can also simplify invoking the script by making it an executable file using the chmod command:

```chmod +x /path/to/lets_draw.sh```


## Usage

```bash
$ ./lets_draw.sh
```

## How It Works

The shuffle randomization is done by picking an element at random from the deck_array and appending it to a new shuffled_array.
Starting with an empty shuffled_array and looping until it contains one of each element (card) from the deck_array.

Since each element is chosen at random, the order of elements in shuffled_array will be random as well.
This simulates an array shuffle while not relying on library-provided "shuffle" operations or the "shuf" command from the linux coreutils.
