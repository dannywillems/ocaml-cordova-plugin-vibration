val vibrate : int -> bool
[@@js.global "navigator.vibrate"]

val vibrate_pattern : int array -> bool
[@@js.global "navigator.vibrate"]

[@@@js.stop]
val cancel : unit -> unit
[@@@js.start]

[@@@js.implem
  let cancel () = ignore (vibrate 0)
]
