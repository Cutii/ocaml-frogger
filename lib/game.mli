(** The grid system:
    0. The positions of all objects are snapped onto a coarse grid.
    1. The frog  is 1x1
    2. Every car is 1x1
    3. Every log is 1x1
*)

(** The playable area of the screen will be referred to as the [board]. *)
module Board : sig
  (** Every row of the game board is one of these three kinds. *)
  module Row : sig
    type t =
      | Safe_strip
      | Road
      | River
  end

  val num_cols : int

  val rows : Row.t list
  (** The first and last rows are guaranteed to be [Safe_strip]s. *)
end

(** This is a position in the grid system of the game, not in screen pixels. *)
module Position : sig
  type t =
    { x : int
    ; y : int
    }

  val make : x:int -> y:int -> t
end

module Direction : sig
  type t =
    | Up
    | Down
    | Left
    | Right
end

(** All these images are 1x1. *)
module Image : sig
  type t =
    | Frog_up
    | Frog_down
    | Frog_left
    | Frog_right
    | Car1_left
    | Car1_right
    | Car2_left
    | Car2_right
    | Car3_left
    | Car3_right
    | Log1
    | Log2
    | Log3
    | Confetti
    | Skull_and_crossbones
end

module Display_list : sig
  (** The [Display_command] [(image, pos)] represents a command to draw [image]
        with its leftmost grid point at [pos].
    *)
  module Display_command : sig
    type nonrec t = Image.t * Position.t
  end

  type t = Display_command.t list
end

module Key : sig
  type t =
    | Arrow_up
    | Arrow_down
    | Arrow_left
    | Arrow_right
end

module Event : sig
  type t =
    | Tick
    | Keypress of Key.t
end

module Game_state : sig
  type t =
    | Playing
    | Won
    | Dead
end
