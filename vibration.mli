class type navigator =
  object
    method vibrate : int -> bool Js.t Js.meth
    method vibrateWithPattern : int Js.js_array Js.t -> int -> unit Js.meth
    method cancelVibration : unit -> unit Js.meth
  end

val navigator : navigator Js.t
