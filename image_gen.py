
def main():
    height = 400;
    width = 600

    height_bytes = height.to_bytes(4,byteorder="big")
    width_bytes = width.to_bytes(4,byteorder="big")
    with open("image.simp", "wb") as f:
        f.write(height_bytes)
        f.write(width_bytes)
        for i in range(height*width):
            f.write((0xff0040).to_bytes(3,byteorder="big"))


if __name__ == "__main__":
    main()
