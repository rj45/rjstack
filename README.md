# rjstack

An FPGA stack machine CPU.

## Youtube Playlist

[![FPGA Stack Machine CPU From Scratch](https://img.youtube.com/vi/NAP9flycUJw/maxresdefault.jpg)](https://www.youtube.com/watch?v=NAP9flycUJw&list=PLilenfQGj6CHO25aw7tUb6xoVvwgGQfA9&index=1)

## Requirements

- [customasm](https://github.com/hlorenzi/customasm)
- [digital](https://github.com/hneemann/Digital)

## Assembling the microcode

```sh
customasm -f logisim8 microcode/microcode.asm -o dig/microcode.hex
```

## Assembling programs

```sh
customasm -f logisim16 programs/cpudef.asm -o dig/program.hex
```

## License

[MIT](./LICENSE)
