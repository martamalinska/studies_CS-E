import random

def guess(x):
    random_number = random.randint(1, x)
    guess = 0
    while guess != random_number:
        guess = int(input(f'Zgadnij liczbę pomiędzy 1 a {x}: '))
        if guess < random_number:
            print('Niestety, podana liczba jest za mała.')
        elif guess > random_number:
            print('Niestety, podana liczba jest za duża.')

    print(f'Gratulacje !!! {random_number} to poprawna liczba!!')

def computer_guess(x):
    low = 1
    high = x
    feedback = ''
    while feedback != 'p':
        if low != high:
            guess = random.randint(low, high)
        else:
            guess = low  # could also be high b/c low = high
        feedback = input(f'Czy {guess} jest większa (W), mniejsza (M) czy poprawna (P)?? ').lower()
        if feedback == 'w':
            high = guess - 1
        elif feedback == 'm':
            low = guess + 1

    print(f'Komputer zgadł liczbę podaną liczbę ({guess})!')


guess(10)