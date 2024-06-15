niu = "83398"
unique_digits = list(set(niu)) 
unique_digits = [int(digit) for digit in unique_digits] 

user_number = int(input("Podaj liczbę: "))

sum_pairs = []
product_pairs = []

for i in range(len(unique_digits)):
    for j in range(i + 1, len(unique_digits)):  
        if unique_digits[i] + unique_digits[j] == user_number:
            sum_pairs.append((unique_digits[i], unique_digits[j]))
        if unique_digits[i] * unique_digits[j] == user_number:
            product_pairs.append((unique_digits[i], unique_digits[j]))

if sum_pairs:
    print(f"Suma cyfr dająca {user_number}: {sum_pairs}")
else:
    print(f"Żadna para nie daje sumy {user_number}.")

if product_pairs:
    print(f"Iloczyn cyfr dający {user_number}: {product_pairs}")
else:
    print(f"Żadna para nie daje iloczynu {user_number}.")