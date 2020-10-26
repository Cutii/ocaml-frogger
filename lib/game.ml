module Position = struct
  type t =
    { x : int
    ; y : int
    }

  let make ~x ~y = { x; y }
end

module Direction = struct
  type t =
    | Up
    | Down
    | Left
    | Right
end

module Image = struct
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

module Display_list = struct
  module Display_command = struct
    type nonrec t = Image.t * Position.t
  end

  type t = Display_command.t list
end

module Key = struct
  type t =
    | Arrow_up
    | Arrow_down
    | Arrow_left
    | Arrow_right
end

module Event = struct
  type t =
    | Tick
    | Keypress of Key.t
end

module Game_state = struct
  type t =
    | Playing
    | Won
    | Dead
end

module Board = struct
  (** Every row of the game board is one of these three kinds. *)
  module Row = struct
    type t =
      | Safe_strip
      | Road
      | River
  end

  let num_cols = 10

  (** The first and last rows are guaranteed to be [Safe_strip]s. *)
  let rows =
    let open Row in
    [ Safe_strip
    ; River
    ; River
    ; River
    ; River
    ; River
    ; Safe_strip
    ; Road
    ; Road
    ; Road
    ; Road
    ; Safe_strip
    ]
    |> List.rev
end
