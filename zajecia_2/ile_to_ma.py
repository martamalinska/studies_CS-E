import string

text = input("Wpisz tekst: ")

letters_and_punctuation = sum(c.isalpha() or c in string.punctuation for c in text) #litery i znaki

spaces = text.count(' ') # spacje 
words = len(text.split()) #wyrazy
frequency = {} #czestotliwosc
for char in text.lower(): 
    if char.isalpha(): 
        if char in frequency:
            frequency[char] += 1
        else:
            frequency[char] = 1

print(f"Liczba liter i znaków interpunkcyjnych: {letters_and_punctuation}")
print(f"Liczba spacji: {spaces}")
print(f"Liczba wyrazów: {words}")
print("Częstotliwość użycia liter:")
for letter, freq in frequency.items():
    print(f"{letter}: {freq}")

