---
title: "Plover clone"
---

Plover development doesn't seem very active. It does work well, but the GUI is
old looking and its implemented in python. One feature I would like is automatic
input selection based on available devices (COM8 -> COM7 -> keyboard). I'll only
begin implementation after learning stenography. It is assumed that plover will
continue to be maintained (they do have a foundation).

# High level set of features

- Json dictionary reading
- serial port reading (get keystrokes from steno machine)
- input manipulation (S-P -> Space)
- I don't care if it has a gui, but it would be a good thing to have to attract
  users
- Should be entirely configurable declaratively using json or toml

## Lower level implementation details

- Need to unravel gemini protocol, though it shouldn't be too bad since I have a
  keyboard that can generate gemini protocol.

  - same for txbolt

- Lookup tree for the strokes needs to be generated from json file. This needs
  to be performant. SHouldn't be too hard since the json must be parsed and read
  into memory anyway.

- tray icon for windows and macOS. I don't really care about this for linux
  though, it can just be a service.

# Packages

## input handling

[inputbot](https://github.com/obv-mikhail/InputBot) for input sending and
listening for keyboard events. The main problem is that it doesn't have MacOS
compatibility though it seems partially implemted. Also, if this thing gets
popular, someone with a mac can just update inputbot. I could even maintain my
own fork.

## Serialport handling

Can use [serialport-rs](https://github.com/serialport/serialport-rs) for
listening for serial ports. This is completely cross-platform, which is awesome.

## tray icon

[tray](https://docs.rs/tray-icon/latest/tray_icon/#:~:text=tray-icon%20lets%20you%20create%20tray%20icons%20for%20desktop%20applications.%20%C2%A7Platforms)
