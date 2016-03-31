# ocaml-cordova-plugin-vibration

Binding to
[cordova-plugin-vibration](https://github.com/apache/cordova-plugin-vibration)

## What does cordova-plugin-vibration do ?

[cordova-plugin-vibration](https://github.com/apache/cordova-plugin-vibration)
```
This plugin aligns with the W3C vibration specification
http://www.w3.org/TR/vibration/

This plugin provides a way to vibrate the device.
```

## How to use ?

To vibrate the device for x millisecondes, use
```OCaml
Vibration.vibration##(vibrate x)
```

and to use a pattern (see [the official documentation](https://github.com/apache/cordova-plugin-vibration))
```OCaml
(*
 * Vibrate 1 second
 * Wait for 1 second
 * Vibrate 3 seconds
 * Wait for 1 second
 * Vibrate 5 seconds
*)

let int_array : int Js.array Js.t = new%js Js.array_length 4 in
Js.array_set int_array 0 1000;
Js.array_set int_array 1 1000;
Js.array_set int_array 2 3000;
Js.array_set int_array 3 1000;
Js.array_set int_array 4 5000;
Vibration.vibration##(vibrate_pattern int_array)
```
**new%js uses ppx ! Don't forget to compile with -package js_of_ocaml.ppx !**

If you want to play Imperial March or Mario Bross Theme, see [this
repository](https://github.com/dannywillems/ocaml-cordova-plugin-vibration-example).

## ! BE CAREFUL !

The plugin creates a new object called *navigator.vibration*, but the object is
available when the *deviceready* event is handled.

We don't provide a *navigator.vibration* variable in this plugin (as said in the official
documentation on js_of_ocaml). If we did, *navigator.vibration* will be set to **undefined**
because the *navigator.vibration* object doesn't exist when we create the variable.

Instead, we provide a function *vibration* of type *unit -> vibration Js.t* which creates the
binding to the *navigator.vibration* object. You must call it when the deviceready
event is handled, eg

```OCaml
let on_device_ready _ =
  let v = Vibration.vibration () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
