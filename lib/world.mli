open Game

type t

val make : unit -> t

val tick : t -> t

val handle_input : t -> Key.t -> t

val handle_event : t -> Event.t -> t

val draw : t -> Display_list.t

val finished : t -> bool
