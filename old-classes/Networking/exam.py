# calculate checksum
def checksum(numbers, hex=False):

    if len(numbers) > 3:
        print("this doesn't seem like udp")
    length = len(numbers[0])
    if hex:
        wrap = int("f"*length, 16)
    else:
        wrap = int("1" * length, 2)
    result = 0
    for i in numbers:
        if hex:
            i = int(i, 16)
        else:
            i = int(i, 2)
        result += i
        if result > wrap:
            result -= wrap
    result = bin(result ^ wrap)[2:]
    result = (length-len(result)) * "0" + result
    return result
if __name__ == "__main__":
    print(checksum(["0110011001100000", "0101010101010101", "1000111100001100"]))
