# ocaml-cordova-plugin-vibration

* gen_js_api (master branch): [![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-vibration.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-vibration)

Binding to
[cordova-plugin-vibration](https://github.com/apache/cordova-plugin-vibration)

[Example application](https://github.com/dannywillems/ocaml-cordova-plugin-vibration-example).

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
let t = Cordova_vibration.t () in
t#vibrate x
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

t#vibrate_pattern [|1;1;3;1;5|]
```

If you want to play Imperial March or Mario Bross Theme, see [this
repository](https://github.com/dannywillems/ocaml-cordova-plugin-vibration-example).

## ! BE CAREFUL !

The plugin creates a new object called *navigator.vibration*, but the object is
available when the *deviceready* event is handled.

We provide a function *Cordova_vibration.t* of type *unit -> Cordova_vibration* which creates the
binding to the *navigator.vibration* object. You must call it when the deviceready
event is handled, eg

```OCaml
let on_device_ready _ =
  let v = Cordova_vibration.t () in
  (* Some code *)

let _ =
  Dom.addEventListener Dom_html.document (Dom.Event.make "deviceready")
  (Dom_html.handler on_device_ready) Js._false
```
