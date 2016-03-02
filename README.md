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
Vibration.navigator##(vibrate x)
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
Vibration.navigator##(vibrate_pattern int_array)
```
**new%js uses ppx ! Don't forget to compile with -package js_of_ocaml.ppx !**

If you want to play Imperial March or Mario Bross Theme, see [this
repository](https://github.com/dannywillems/ocaml-cordova-plugin-vibration-example).
