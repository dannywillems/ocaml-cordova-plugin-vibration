# ocaml-cordova-plugin-vibration

[![LGPL-v3 licensed](https://img.shields.io/badge/license-LGPLv3-blue.svg)](https://raw.githubusercontent.com/dannywillems/ocaml-cordova-plugin-vibration/master/LICENSE)
[![Build Status](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-vibration.svg?branch=master)](https://travis-ci.org/dannywillems/ocaml-cordova-plugin-vibration)

Binding to
[cordova-plugin-vibration](https://github.com/apache/cordova-plugin-vibration)

[Example application](https://github.com/dannywillems/ocaml-cordova-plugin-vibration-example).

## What does cordova-plugin-vibration do ?

```
This plugin aligns with the W3C vibration specification
http://www.w3.org/TR/vibration/

This plugin provides a way to vibrate the device.
```
Source: [cordova-plugin-vibration](https://github.com/apache/cordova-plugin-vibration)

## How to install and compile your project by using this plugin ?

Don't forget to switch to a compiler **>= 4.03.0**.
```Shell
opam switch 4.03.0
```

You can use opam by pinning the repository with
```Shell
opam pin add cordova-plugin-vibration https://github.com/dannywillems/ocaml-cordova-plugin-vibration.git
```

and to compile your project, use
```Shell
ocamlfind ocamlc -c -o [output_file] -package gen_js_api -package cordova-plugin-vibration [...] -linkpkg [other arguments]
```

Don't forget to install the cordova plugin vibration with
```Shell
cordova plugin add https://github.com/apache/cordova-plugin-vibration
```

## How to use ?

To vibrate the device for x millisecondes, use
```OCaml
Cordova_vibration.vibrate x
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

Cordova_vibration.vibrate_pattern [|1;1;3;1;5|]
```

If you want to play Imperial March or Mario Bross Theme, see [this
repository](https://github.com/dannywillems/ocaml-cordova-plugin-vibration-example).
