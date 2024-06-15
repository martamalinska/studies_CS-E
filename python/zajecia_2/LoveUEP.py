def check_number(i, niu):
    if i == 50:
        return str(niu)
    elif i % 3 == 0 and i % 5 == 0:
        return "LoveUEP"
    elif i % 3 == 0:
        return "Love"
    elif i % 5 == 0:
        return "UEP"
    else:
        return str(i)
# Moj numer niu
niu = 83398
results = [check_number(i, niu) for i in range(1, 101)]
for result in results:
    print(result)