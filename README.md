# Simper
A very simple image format and viewer

### Format
```
 0x00 - Height
 0x04 - Width
 0x08 - pixel 1 R
 0x09 - pixel 1 G
 0x0a - pixel 1 B
 0x0b - pixel 2 R
 0x0c - pixel 2 G
 0x0d - pixel 2 B
 .
 .
 .
 0xZZ - pixel N B
```
*Height and Width are to be stored in big-endian byteorder*

### Usage (For Python)
- Install requirements using `pip install -r requirements.txt`
- Run file using `Simper.py ./[IMAGE_NAME].simp`

### Compilation (For Processing)
- Open the `Simper.pde` in Processing 3.x
- File > Export > (Export for you OS)

### Usage (For Processing)
After putting Simper.exe in your environment you can run it like this
`Simper.exe ./[IMAGE_NAME].simp`

### TODO
- [x] Make standalone executable 
- [ ] Improve performance

