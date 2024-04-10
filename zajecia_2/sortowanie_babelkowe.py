def bubble_sort_descending(lst): # sortowanie malejace
    n = len(lst)
    for i in range(n-1):
        swapped = False
        for j in range(0, n-i-1):
            if lst[j] < lst[j+1]:
                lst[j], lst[j+1] = lst[j+1], lst[j]
                swapped = True
        if not swapped: 
            break
    return lst

def bubble_sort_ascending(lst): # sortowanie rosnace
    n = len(lst)
    for i in range(n-1):
        swapped = False
        for j in range(0, n-i-1):
            if lst[j] > lst[j+1]:
                lst[j], lst[j+1] = lst[j+1], lst[j]
                swapped = True
        if not swapped:  
            break
    return lst

niu = "83398"
unique_digits = list(set(niu))  
unique_digits = [int(digit) for digit in unique_digits] 

sorted_descending = bubble_sort_descending(unique_digits[:]) 
sorted_ascending = bubble_sort_ascending(unique_digits[:])  

print("Sortowanie malejące:", sorted_descending)
print("Sortowanie rosnące:", sorted_ascending)
