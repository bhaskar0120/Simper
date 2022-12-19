# Python version of the Simple Image Viewer
# Simper

from PIL import Image, ImageTk
from sys import argv

def main():
    if len(argv) < 2:
        print("Usage: python Simper.py <image file>")
        exit(1)
    with open(argv[1], "rb") as f:
        data = f.read()

    # First two ints are the width and height of the image in big endian
    height = int.from_bytes(data[:4], "big")
    width = int.from_bytes(data[4:8], "big")

    # Convert the rest of the data to a list of pixels
    image = Image.frombytes("RGB", (width, height), data[8:])
    image.show()


if __name__ == "__main__":
    main()
