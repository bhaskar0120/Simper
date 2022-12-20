# Python version of the Simple Image Viewer
# Simper

from PIL import Image, ImageTk
from sys import argv

def main():
    help_message = '''
Usage: Simper.py FLAGS <FILENAME.simp>
Flags:
 -h, --help: Display this help message
 -s, --save: Save the image to a file
'''
    if len(argv) < 2:
        print(help_message)
        exit(1)
    save = False
    if len(argv) > 2:
        if '-h' in argv or '--help' in argv:
            print(help_message)
            exit(0)
        elif '-s' in argv or '--save' in argv:
            save = True

    # Get file name from argv which also contains flags
    filename = ''
    for arg in argv:
        if arg.endswith('.simp'):
            filename = arg
    if filename == '':
        print("Error: No filename given")
        exit(1)
    with open(filename, "rb") as f:
        data = f.read()
    # First two ints are the width and height of the image in big endian
    height = int.from_bytes(data[:4], "big")
    width = int.from_bytes(data[4:8], "big")

    # Convert the rest of the data to a list of pixels
    image = Image.frombytes("RGB", (width, height), data[8:])
    if save:
        image.save(filename[:-5]+'.jpg')
    else:
        image.show()


if __name__ == "__main__":
    main()
