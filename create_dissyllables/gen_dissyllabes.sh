# Specify all possible vowels and transitions, and every combination will be generated
# The format is XSAMPA (see https://isis-documentation.readthedocs.io/en/latest/XSampa.html)

vowels1=(e a i 2 o)         # list of starting vowels
transitions=(R s l t k) 		# list of consonantic transitions (can be empty ("") or more than one consonant)
vowels2=(e a i 2 o)         # list of ending vowels

# a e E 2 9 @ i o O u y o~ a~ e~ 9~
# v z Z f s S b d g p t k m n N R l


for v1 in "${vowels1[@]}";     do
for t  in "${transitions[@]}"; do
for v2 in "${vowels2[@]}";     do

    diphone="$v1$t$v2"

    if [ "$v1" = "E" ]; then
    	nv1="e!"
    elif [ "$v1" = "O" ]; then
    	nv1="o!"
    else
    	nv1="$v1"
    fi
    
    if [ -z "$t" ]; then
    	nt="_"
    elif [ "$t" = "Z" ]; then
    	nt="z!"
    elif [ "$t" = "S" ]; then
    	nt="s!"
    elif [ "$t" = "N" ]; then
    	nt="n!"
    else
    	nt="$t"
    fi
    
    if [ "$v2" = "E" ]; then
    	nv2="e!"
    elif [ "$v2" = "O" ]; then
    	nv2="o!"
    else
    	nv2="$v2"
    fi

    filename="$nv1$nt$nv2"

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
done;

