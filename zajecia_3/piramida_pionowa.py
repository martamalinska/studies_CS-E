def generowanie_pionowej_piramidy():
    while True:
        dane_podstawowe = input("Napisz jaka wysoka ma być Twoja piramida lub jeśli masz dość piramid - wybierz 'q': ")
        if dane_podstawowe.lower() == 'q':
            print("Nie zostaniesz Tutanchamonem.")
            break

        try:
            wysokosc = int(dane_podstawowe)
            if wysokosc <= 0:
                raise ValueError("Wysokość piramidy nie może być ujemna.")
        except ValueError as e:
            print("Błąd:", e)
            continue
        
        y = wysokosc - 1
        
        while y >= 0:
            x = 1
            linia = ""
            while x < wysokosc * 2:
                if x > y and x < (wysokosc * 2 - y):
                    linia += "#"
                else:
                    linia += " "
                x += 1
            print(linia)
            y -= 1

generowanie_pionowej_piramidy()

