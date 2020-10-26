# Frogger in your browser

If you've never played Frogger, play an online version (picked at random) [here](https://denodell.github.io/frogger/)

You will be writing a simplified version that discretizes time and space, which
makes the collision and movement logic a lot easier to implement. [Here's](https://ocamllabs.github.io/learn-ocaml-workshop/frogger.html) an example of the finished product. Try pressing the keys `i` and `u` to see some
fun tricks!

## js_of_ocaml

This version of Frogger will run in the browser by using **js-of-ocaml** to
transpile OCaml bytecode into Javascript. Fortunately for us, [dune](https://dune.readthedocs.io/en/stable/jsoo.html)
supports this out of the box.

## Install the deps

Clone this repository and run `esy install`

## Writing a game in functional programming style

We have written a simple scaffold that handles graphics, events and interactions with the DOM so you can focus on implementing just the game logic. [game.mli](./lib/game.mli) defines modules and types that you'll need to use, like
the number and kinds of rows in the playing board, and images of characters.

Take a look at [world.mli](./lib/world.mli). This is the interface you will implement by
writing a corresponding [world.ml](./lib/world.ml). The contract between the game and
your code is that you implement the four functions at the bottom of this
**.mli**, and the gale will call those functions with the appropriate events
at the right times.

A `World.t` represents the entire state of the game at a given point in time.
It is up to you to define what goes in the type -- that's why **world.mli**
does not specify what's inside the type (we call this an abstraction).
However, to help you get started, we've specified some function signatures and suggest some _opaque modules_.

### How to make the world

This is the `make` function. You may want to use the `Random` module to make life interesting.

### How to advance the world one timestep

For this first project, we'll say that time advances only in units of 1
second. The `tick` function should implement how the `World.t` is transformed
when time advances.

It takes a `World.t` and returns a new `World.t`. Writing your game in this
functional style will allow us to do some interesting things later on.

### How to respond to player input

Players can press one of the four arrow keys to move their character around.
You specify what to do when they do that by writing a `handle_input`
function.

All this function needs to know is: what the current state of the world is (a
`World.t`), and what button player pressed (a `Key.t`). Its output: the
resulting state of the world (a `World.t`).

### handle_event: dispatch to tick or handle_input

It's nice to be able to say, "The only things that happen in this game are:
time progressing, and the player doing something." Your `handle_event`
function should just `match` on the kind of event and dispatch to the
appropriate handler (one of the two above).

### Write unit tests

During the training write as unit tests as you need to drive your implementation.
Tests should be written in [frogger_test.ml](test/frogger_test.ml) with [alcotest](https://github.com/mirage/alcotest)

### How to draw the world

A list of tuples `(Image.t, Position.t)` tell the game which images to draw where, and in what order: images later in the list will be overlaid on top of earlier ones at the same position.

- That seems awfully complicated! How should I start?
  A reasonable starting point is to just move the frog (well, camel) around the
  game board. Read `world.mli` and follow the suggestions to build this basic game.

- Build the game `esy build`
- Test the game `esy test`
- Run the game `esy start`

> This training is an adaptation of [Janestreet's Learn OCaml Workshop](https://github.com/janestreet/learn-ocaml-workshop/tree/master/03-frogger)
