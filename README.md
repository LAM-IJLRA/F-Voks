# F-Voks

![f-voks](images/f-voks1.png)

The instrument F-Voks (Finger-Voks) is a performative vocal synthesizer by gestural control composed of an interface including two graphic tablets, a base of sound samples of sung disyllables, as well as a synthesis engine functioning by concatenation of sound samples with a vocoder. This instrument allows to generate phonemes, then transformed into voice, from gestures on a graphic tablet and to control the pitch and the vocal effort of the synthesized voice. Vowels are represented by a vowel space (triangle or vowel trapezium) on a surface. The gestures generating the consonants are associations of finger movements.

## Comparison of audio samples from ISiS before and after F0 flattening

### Audio sample generated with ISiS
This audio sample is an example generated with ISiS, the french singing synthesizer that we use in order to create a database of audio samples.
<audio controls>
  <source src="samples/reproRT.wav" type="audio/wav">
Your browser does not support the audio element.
</audio>

![f-voks](images/repro1.png)

### Audio sample after F0 flattening with WORLD
This extract is the same example resynthesized with WORLD in order to get a flat fundamental frequency.
<audio controls>
  <source src="samples/reproRT_flat.wav" type="audio/wav">
Your browser does not support the audio element.
</audio>

![f-voks](images/repro2.png)

## Comparison of audio samples generated with ISiS and F-Voks
This section present examples of audio generated with ISiS and then attempted to be recreated with F-Voks.

### First audio sample generated with ISiS
This first audio example use a majority of plosive consonants.

<audio controls>
  <source src="samples/colasRT1_IS.wav" type="audio/wav">
Your browser does not support the audio element.
</audio>

![f-voks](images/colasRT1_IS.png)

### Audio sample generated with F-Voks n°1
For this first audio sample generated with F-Voks the focus was on the speed and rythm of generation.

<audio controls>
  <source src="samples/colasRT1_V1.wav" type="audio/wav">
Your browser does not support the audio element.
</audio>

![f-voks](images/colasRT1_V1.png)

### Audio sample generated with F-Voks n°2
For this second audio sample the focus was on the vocal expression, especially to recreate the vibrato of the original recording.

<audio controls>
  <source src="samples/colasRT1_V2.wav" type="audio/wav">
Your browser does not support the audio element.
</audio>

![f-voks](images/colasRT1_V2.png)



### Second audio sample generated with ISiS
This second audio example use a majority of fricative and liquid consonants.

<audio controls>
  <source src="samples/colasRT4_IS.wav" type="audio/wav">
Your browser does not support the audio element.
</audio>

![f-voks](images/colasRT4_IS.png)

### Audio sample generated with F-Voks n°1
For this first audio sample generated with F-Voks the focus was on the speed and rythm of generation.

<audio controls>
  <source src="samples/colasRT4_V1_2.wav" type="audio/wav">
Your browser does not support the audio element.
</audio>

![f-voks](images/colasRT4_V1.png)

### Audio sample generated with F-Voks n°2
For this second audio sample the focus was on the vocal expression, especially to recreate the vibrato of the original recording.

<audio controls>
  <source src="samples/colasRT4_V2_2.wav" type="audio/wav">
Your browser does not support the audio element.
</audio>

![f-voks](images/colasRT4_V2.png)




## How to use F-Voks from scratch

### Create a base of audio samples

In order to use F-Voks we need to generate a base of all the dissylables we need. It can be achieve by modifying and executing the gen_dissylables.sh script in the create_dissylables folder

### Indexing audio samples

In order to use the audio samples created we need to index each of them. An index for an audio sample consist in a .txt file with the same file name and consist in two values separated by a line break. The first value is a position value of the audio sample corresponding to a clear starting vowel (no co-articulation), the second value is a position value corresponding to a clear ending vowel. 

To index properly an audio sample the file index_dissylabes.maxpat in the create_dissylables folder can be used. It allows to test the sounding of audio samples at each position with the SuperVP Vocoder and to test the mixing of two audio samples at a specific position.

### Gesture training

### Play with F-Voks
