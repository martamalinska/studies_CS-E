import tkinter as tk
from tkinter import messagebox, PhotoImage, Label, Entry, Button, Frame, StringVar, Radiobutton
import requests

def fetch_market_data():
    symbol = entry_symbol.get()
    interval = entry_interval.get()
    limit = entry_limit.get()
    url = f"https://www.mexc.com/open/api/v2/market/kline?symbol={symbol}&interval={interval}&limit={limit}"

    try:
        response = requests.get(url)
        if response.status_code == 200:
            data = response.json()
            # Wyświetlenie danych w konsoli
            print(data)
        else:
            messagebox.showerror("Błąd", f"Kod odpowiedzi HTTP: {response.status_code}")
    except Exception as e:
        messagebox.showerror("Błąd", str(e))

def print_text():
    print("Text from entry_one:", entry_symbol.get())

def print_selected_option():
    print("Selected option:", selected_option.get())

root = tk.Tk()
root.title('MyGUIApp')

canvas = tk.Canvas(root, height=800, width=600)
canvas.pack()

# Poniższa linijka powinna być odpowiednio zmodyfikowana do lokalizacji pliku 'altum.png' na Twoim komputerze
background_image = PhotoImage(file='altum.png')
background_label = Label(root, image=background_image)
background_label.place(relwidth=1, relheight=1)

frame = Frame(root, bg='#ffffff')
frame.place(relx=0.5, rely=0.1, relwidth=0.75, relheight=0.1, anchor='n')

label_symbol = Label(frame, text="Symbol:")
label_symbol.place(relx=0.05, rely=0.15, relwidth=0.18, relheight=0.3)

entry_symbol = Entry(frame)
entry_symbol.place(relx=0.25, rely=0.15, relwidth=0.3, relheight=0.3)

label_interval = Label(frame, text="Interval:")
label_interval.place(relx=0.05, rely=0.55, relwidth=0.18, relheight=0.3)

entry_interval = Entry(frame)
entry_interval.place(relx=0.25, rely=0.55, relwidth=0.3, relheight=0.3)

label_limit = Label(frame, text="Limit:")
label_limit.place(relx=0.6, rely=0.15, relwidth=0.18, relheight=0.3)

entry_limit = Entry(frame)
entry_limit.place(relx=0.8, rely=0.15, relwidth=0.18, relheight=0.3)

fetch_data_button = Button(frame, text="Fetch Data", command=fetch_market_data)
fetch_data_button.place(relx=0.6, rely=0.55, relwidth=0.35, relheight=0.3)

second_frame = Frame(root, bg='#ffffff')
second_frame.place(relx=0.5, rely=0.25, relwidth=0.75, relheight=0.1, anchor='n')

selected_option = StringVar(root, 'FIRST_OPTION')

option_one = Radiobutton(second_frame, text="Option One", variable=selected_option, value='FIRST_OPTION')
option_one.place(relx=0.1, rely=0.15, relwidth=0.3, relheight=0.3)

option_two = Radiobutton(second_frame, text="Option Two", variable=selected_option, value='SECOND_OPTION')
option_two.place(relx=0.1, rely=0.55, relwidth=0.3, relheight=0.3)

print_select_button = Button(second_frame, text="Print Selected", command=print_selected_option)
print_select_button.place(relx=0.6, rely=0.3, relwidth=0.3, relheight=0.4)

root.mainloop()

