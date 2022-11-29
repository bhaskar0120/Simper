# Simper
A very simple image format and viewer

### Format
```
 0x00 - Height
 0x04 - Width
 0x08 - pixel 1
 0x0c - pixel 2
 .
 .
 .
 0x0ZZ - pixel N
```
*Height and Width are to be stored in big-endian byteorder*

### TODO
- [ ] Make standalone executable 
- [ ] Improve performance
