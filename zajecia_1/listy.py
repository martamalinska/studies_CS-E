przedmioty = ['Programowanie', 'Ekonometria', 'Bazy danych']
print(przedmioty)
print(przedmioty[0])  # wyswietlamy pierwszy element
przedmioty[0] = "Programowanie w Pythonie"
print(przedmioty[0])
print(przedmioty[0].upper())
print(f"Nie mogę się doczekać egzaminu z przedmiotu: {przedmioty[1].upper()}")
przedmioty.append("Mikroekonomia")  # dodaj nowy element na koniec listy
print(przedmioty)
przedmioty.insert(0, "Cyberbezpieczeństwo")
print(przedmioty)
del przedmioty[0]  # usuwamy pierwszy element
print(przedmioty)
przedmiot_zaliczony = przedmioty.pop(3)  # usuniecie oraz pobranie z listy
print(f"Brawo! Zaliczyłeś przedmiot: {przedmiot_zaliczony}")
przedmioty.append(przedmiot_zaliczony)
print(przedmioty)
przedmioty.sort()
print(przedmioty)
# przedmioty.sort() trwale sortowanie listy
print(sorted(przedmioty))
print(przedmioty)
przedmioty.reverse() # trwale odwrocenie naszej listy
print(przedmioty)
print(przedmioty[2])
print(przedmioty[-1])


