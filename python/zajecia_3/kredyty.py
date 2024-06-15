def oblicz_rate_malejaca(S, N, r, n):
    odsetki = S / N * (1 + (N - n + 1) * r / 12)
    return odsetki

def oblicz_rate_rowna(S, r, m, n):
    q = 1 + r / m
    rata = S * (q ** n * (q - 1) / (q ** n - 1))
    return rata

def wyswietl_informacje(S, N, r, typ_raty):
    print(f"Kwota kredytu: {S} zł")
    print(f"Liczba lat: {N}")
    print(f"Procent w skali roku: {r}%")
    print(f"Typ raty: {'malejąca' if typ_raty == 'm' else 'stała'}")

def generowanie_rat_kredytu():
    S = float(input("Podaj kwotę kredytu: "))
    lata = int(input("Podaj liczbę lat: "))
    N = lata * 12 
    r = float(input("Podaj procent w skali roku: ")) / 100
    typ_raty = input("Jaki jest typ raty (malejąca - 'm' lub stała - 's'): ")
    
    if S <= 0 or N <= 0 or r < 0 or typ_raty not in ('m', 's'):
        print("Podane informacje są nieprawidłowe. Spróbuj ponownie.")
        return
    
    wyswietl_informacje(S, N, r, typ_raty)

    suma_odsetek = 0
    pozostaly_kapital = S

    for n in range(1, N + 1):
        if typ_raty == 'm':
            odsetki = oblicz_rate_malejaca(S, N, r, n)
            kapitalowa = S / N
        else:
            calkowita_rata = oblicz_rate_rowna(S, r, 12, N)
            odsetki = pozostaly_kapital * r / 12
            kapitalowa = calkowita_rata - odsetki

        suma_odsetek += odsetki
        pozostaly_kapital -= kapitalowa

        print(f"  Numer kolejny raty {n}:")
        print(f"  Część kapitałowa: {kapitalowa:.2f} zł")
        print(f"  Część odsetkowa: {odsetki:.2f} zł")
        print(f"  Wysokość raty: {kapitalowa + odsetki:.2f} zł")
        print(f"  Kapitał pozostały do spłaty po opłaceniu raty: {pozostaly_kapital:.2f} zł\n")
    
    print(f"Całkowity koszt kredytu: {suma_odsetek:.2f} zł")

generowanie_rat_kredytu()