niu = 83398

niu_digits = list(set(str(niu)))  
niu_digits_int = [int(digit) for digit in niu_digits]

max_digit = max(niu_digits_int)
min_digit = min(niu_digits_int)

print("Lista unikalnych cyfr:", niu_digits_int)
print("Cyfra najwieksza:", max_digit)
print("Cyfra najmniejsza:", min_digit)
