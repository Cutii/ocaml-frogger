open Game

(* When you start the exercise, the compiler will complain that bindings,
 * are unused. You can remove this attribute once you get going. *)
[@@@warning "-32-33-37"]

module Frog = struct
  type t =
    { position : Position.t
    ; direction : Direction.t
    }

  let make ~position ~direction = { position; direction }
end

module Non_frog = struct
  module Kind = struct
    type t =
      | Car
      | Log
  end

  type t =
    { kind : Kind.t
    ; position : Position.t
    ; speed : int
          (** In units of grid-points/tick. Positive values indicate rightward motion,
    negative values leftward motion. *)
    }

  let make nf = nf
end

type t =
  { frog : Frog.t
  ; non_frog : Non_frog.t list
  ; state : Game_state.t
  }

(** a utility function to initialize the position of the frod, you may change the 
  * initial postion latter *)
let init_frog () =
  let initial_postion = Position.make ~x:0 ~y:0
  and initial_direction = Direction.Up in
  Frog.make ~position:initial_postion ~direction:initial_direction


let make () = { frog = init_frog (); non_frog = []; state = Game_state.Playing }

let tick (_ : t) =
  failwith
    "This function will end up getting called every timestep, which happens to \
     be set to 1 second for this game in the scaffold (so you can easily see \
     what's going on). For the first step (just moving the frog/camel around), \
     you can just return [world] here. Later you'll want do interesting things \
     like move all the cars and logs, detect collisions and figure out if the \
     player has died or won. "


let handle_input (_ : t) (_ : Key.t) =
  failwith
    "This function will end up getting called whenever the player presses one \
     of the four arrow keys. What should the new state of the world be? Create \
     and return it based on the current state of the world (the [world] \
     argument), and the key that was pressed ([key]). Use either [World.make] \
     or the record update syntax:\n\
     { world with frog = Frog.make ... }\n"


let draw (_ : t) =
  failwith
    "Return a list with a single item: a tuple consisting of one of the \
     choices in [Images.t] in [game.mli]; and the current position of the \
     [Frog]."


let handle_event (_ : t) (_ : Event.t) =
  failwith
    "This function should probably be just 3 lines long: [match event with ...]"


let finished (_ : t) =
  failwith "This can probably just return [false] in the beginning."
