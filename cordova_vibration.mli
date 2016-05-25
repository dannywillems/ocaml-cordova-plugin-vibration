(* -------------------------------------------------------------------------- *)
class vibration : Ojs.t ->
  object
    inherit Ojs.obj
    method vibrate            : int       -> bool
    method vibrate_pattern    : int array -> bool
    [@@js.call "vibrate"]
    method cancel             : unit      -> unit
    [@@js.call "cancel"]
  end
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
val t : unit -> vibration
[@@js.get "navigator"]
(* -------------------------------------------------------------------------- *)
