import sys



def separate_phonemes(text):
    """
    Intersperse a phonetic text with spaces, leaving tildes attached to the letter they modify
    """
    output = ""
    for character in text:
        if character == '~':
            output = output + character
        else:
            output = output + ' ' + character
    return output


def gen_score(text, label):

    score = open("scores/{0}.txt".format(label), "w")

    score.write("[lyrics]")
    score.write("\nxsampa:")
    score.write(text)
    score.write("\n\n[score]")
    score.write("\nmidiNotes: 48, 48")
    score.write("\n\nglobalTransposition: 0")
    score.write("\n\nrhythm: 1, 1")
    score.write("\n\ndefaultSentenceLoudness: 1")
    score.write("\n\ntempo: 120\n\n")

    score.close()



if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Example use: python gen_score.py aSi")
    else:
        text = separate_phonemes(sys.argv[1])
        gen_score(text, sys.argv[1])

