# libasm

## Info

The aim of this project is to get familiar with assembly language by reconding a few libc functions for MACOS x86_64 assembly.

- Status: finished
- Result: 100%
- Observations: for macho64 nasm

*developed by: [izenynn](https://github.com/izenynn)*

## List of functions

| <!-- -->    | <!-- -->     |
| ----------- | ------------ |
| `ft_strlen` | man 3 strlen |
| `ft_strcpy` | man 3 strcpy |
| `ft_strcmp` | man 3 strcmp |
| `ft_write`  | man 2 write  |
| `ft_read`   | man 2 read   |
| `ft_strdup` | man 3 strdup |

## Usage

Compile the package:
```bash
make
```

To test the results, issue:
```bash
make check
```

To use it just copy and compile with the `libasm.a`, e.g.:
```
gcc main.c  -lasm -L.
```

##

[![forthebadge](https://forthebadge.com/images/badges/made-with-crayons.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/makes-people-smile.svg)](https://forthebadge.com)
