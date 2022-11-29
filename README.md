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

### Compilation
- Open the `Simper.pde` in Processing 3.x
- File > Export > (Export for you OS)

### Usage
After putting Simper.exe in your environment you can run it like this
`Simper.exe ./[IMAGE_NAME].simp`

### TODO
- [x] Make standalone executable 
- [ ] Improve performance

