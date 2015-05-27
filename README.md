# Secret Messages 

Throughout history, cryptography has had dramatic effects on the outcome of wars, monarchies and the lives of individuals. One example of this is the successful cracking of the German Enigma cipher during World War II. This ultimately proved to be instrumental in the Allied forces victory.

In this puzzle you will have the opportunity to try your hand at the ancient art of code-cracking by decrypting a text message that uses two distinct ciphers to render its contents unintelligible.

## The Ciphers

### The Caesar Cipher

The earliest and simplest form of ciphers is known as "monoalphabetic substitutions". This is a system of encryption wherein every occurrence of a particular plaintext letter in the alphabet is replaced by a cyphertext letter. This will generate a second alphabet where the 26 letters are in different positions. Juxtaposing the two alphabets will yield a one-to-one mapping of the plaintext letter to its encrypted counterpart.

The **Caesar Cipher** is an example of such a substitution cipher. It is attributed to Julius Caesar who used it to communicate with his generals. Also known as a shift cipher, it replaces each plaintext letter with a letter that is a fixed number of places down the alphabet. For example, with a shift of three, a `B` in the plaintext alphabet becomes an `E` in the ciphertext one.

As such, this is the full cipher alphabet with a shift parameter of 3:

```
Plain alphabet:    ABCDEFGHIJKLMNOPQRSTUVWXYZ
Cipher alphabet:   DEFGHIJKLMNOPQRSTUVWXYZABC
```

Placing the two alphabets side by side makes it easy to decrypt the message:

```
FRZDUGV GLH PDQB WLPHV EHIRUH WKHLU GHDWKV; WKH YDOLDQW QHYHU WDVWH RI GHDWK 
EXW RQFH.

Z. VKDNHVSHDUH, MXOLXV FDHVDU
```

Yielding its plain text form:

```
COWARDS DIE MANY TIMES BEFORE THEIR DEATHS; THE VALIANT NEVER TASTE OF DEATH 
BUT ONCE.

W. SHAKESPEARE, JULIUS CAESAR
```

The tricky part of the Caesar cipher is that the shift parameter is often unknown to the code cracker.

### The Vigenère Cipher

This cipher was long thought to be unbreakable because, unlike the Caesar cipher, there is no simple one-to-one mapping of the plaintext to the cipher alphabet. 

The Vigenère cipher is applied by utilizing a series of different Caesar ciphers based on the letters of a particular keyword. The ordinal position of each letter in the keyword is what determines the shift parameter values of the various Caesar ciphers used. The resulting cipher alphabets are then applied in sequence and then repeated to encode the letters in the message.

An example should make the process a bit clearer.

If we use the word `ABLE` as the keyword, we can see that the shift values are 0, 1, 4 and 11. Note that the letter `A` produces no shift since its value is 0. 

Let's use the Vigenère Cipher to encrypt this message with the keyword `ABLE`:

```
ATTACK AT DAWN
```

The following four cipher alphabets come into play:

```
Shift 0 (Letter A):

Plain alphabet:    ABCDEFGHIJKLMNOPQRSTUVWXYZ
Cipher alphabet:   ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

```
Shift 1 (Letter B):

Plain alphabet:    ABCDEFGHIJKLMNOPQRSTUVWXYZ
Cipher alphabet:   BCDEFGHIJKLMNOPQRSTUVWXYZA
```

```
Shift 11 (Letter L):

Plain alphabet:    ABCDEFGHIJKLMNOPQRSTUVWXYZ
Cipher alphabet:   LMNOPQRSTUVWXYZABCDEFGHIJK
```

```
Shift 4 (Letter E):

Plain alphabet:    ABCDEFGHIJKLMNOPQRSTUVWXYZ
Cipher alphabet:   EFGHIJKLMNOPQRSTUVWXYZABCD
```

One trick you can use to facilitate knowing when to apply which cipher alphabet is to repeat the keyword above the encoded message, like so:

```
Keyword: ABLEABLEABLE
Message: ATTACKATDAWN
```

Using these four cipher alphabets in circular sequence will produce the following encrypted message:

```
AUEECL LX DBHR
```

## The Input

The input will contain an encrypted keyword and and encrypted message. The keyword is a common English word encrypted with a Caesar cipher. Your job will be to figure out what that keyword is and then use it to unravel the secret message by writing a Vigenère cipher decryption program.

The input might look something like this:

```
RLCOPY

IONDVQY DZH QNTY KLQRY BVISEK TYHME JERWLF; ZHV YEYOAEW RRBEI WEFZE FI HRGTY 
EYG UNTH. SS GLC WLR COEGIEY TYDX V EEK KEIK HVDVQ, OT JHIZY TF PI ZUSK VXEGNXH 
XUGT DHR FNOLOH SKAI; VIRONX WLNZ DVDXU, G NVFIFYAIB IAJ, WZOP PUMV ZLRT 
IK ZMYR CFPI.
```

The first line contains the keyword encrypted with the Caesar cipher of unknown shift parameter value. You'd need to get cracking on that first. 

Say you've figured out that the keyword is `GARDEN`, you would then use that to decipher the secret message, which has been encrypted with the Vigenère cipher.

Regarding the format, note that both the keyword, as well as the message will be in uppercase letters. Also, spaces and punctuation marks in the message body should not be considered as part of the encryption, but will need to be reproduced in the decrypted version of the message.

## The Output

The output should contain the decrypted secret message. In our example from above this should be:

```
COWARDS DIE MANY TIMES BEFORE THEIR DEATHS; THE VALIANT NEVER TASTE OF DEATH 
BUT ONCE. OF ALL THE WONDERS THAT I YET HAVE HEARD, IT SEEMS TO ME MOST STRANGE 
THAT MEN SHOULD FEAR; SEEING THAT DEATH, A NECESSARY END, WILL COME WHEN 
IT WILL COME.
```

## References

To read more about the different ciphers introduced in this puzzle see the Wikipedia articles on the [Caesar cipher](http://en.wikipedia.org/wiki/Caesar_cipher) and the [Vigenère cipher](http://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher). Some of the examples used here were sourced from these articles. 

_This puzzle was contributed to [Puzzle Node](http://www.puzzlenode.com/puzzles/12-secret-messages) by Gregory Brown & Andrea Singh and published on July 14, 2011_