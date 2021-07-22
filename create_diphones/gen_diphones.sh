# Specify all possible vowels and transitions, and every combination will be generated
# The format is XSAMPA (see https://isis-documentation.readthedocs.io/en/latest/XSampa.html)

transitions=("") 		# list of consonantic transitions (can be empty ("") or more than one consonant)
vowels=(e a i 2 o)         # list of ending vowels

# a e E 2 9 @ i o O u y o~ a~ e~ 9~
# v z Z f s S b d g p t k m n N R l


for t  in "${transitions[@]}"; do
for v in "${vowels[@]}";     do

    diphone="$t$v"

    if [ -z "$t" ]; then
    	nt="__"
    elif [ "$t" = "Z" ]; then
    	nt="z!"
    elif [ "$t" = "S" ]; then
    	nt="s!"
    elif [ "$t" = "N" ]; then
    	nt="n!"
    else
    	nt="$t"
    fi
    
    if [ "$v" = "E" ]; then
    	nv="e!"
    elif [ "$v" = "O" ]; then
    	nv="o!"
    else
    	nv="$v"
    fi

    filename="$nt$nv"

    # Write ISiS score file (see https://isis-documentation.readthedocs.io/en/latest/score.html)
    python3 gen_score.py $diphone
    # Generate audio (you need ISiS on your path obviously)
    isis.sh -m scores/${diphone}.txt -o audio/${filename}.wav
    # Declutter
    rm audio/${filename}.log
    # Turn weird audio files into normal ones
    #ffmpeg -i audio/${filename}.wav -ar 44100 -map_metadata -1 -fflags +bitexact -flags:v +bitexact -#flags:a +bitexact corrected/${filename}.wav
    # Flatten f0
    ./reprosody pitch.txt audio/${filename}.wav flat/${filename}.wav

done;
done;

