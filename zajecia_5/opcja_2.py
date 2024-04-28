import tkinter as tk
from tkinter import messagebox, PhotoImage, Label, Entry, Button, Frame, StringVar, Radiobutton
import requests

def fetch_market_data():
    global text_area  # Deklarujemy, że użyjemy globalnej zmiennej text_area
    symbol = entry_symbol.get()
    interval = entry_interval.get()
    limit = entry_limit.get()
    url = f"https://www.mexc.com/open/api/v2/market/kline?symbol={symbol}&interval={interval}&limit={limit}"

    try:
        response = requests.get(url)
        if response.status_code == 200:
            data = response.json()
            text_area.delete("1.0", tk.END)  # Czyszczenie text_area
            text_area.insert(tk.END, str(data))  # Wstawianie danych do text_area
        else:
            messagebox.showerror("Błąd", f"Kod odpowiedzi HTTP: {response.status_code}")
    except Exception as e:
        messagebox.showerror("Błąd", str(e))

# Reszta kodu (definicja root, canvas, frame, etc.)
root = tk.Tk()
root.title('MyGUIApp')

canvas = tk.Canvas(root, height=800, width=600)
canvas.pack()

background_image = tk.PhotoImage(file='altum.png')
background_label = tk.Label(root, image=background_image)
background_label.place(relwidth=1, relheight=1)

frame = Frame(root, bg='#ffffff')
frame.place(relx=0.5, rely=0.1, relwidth=0.75, relheight=0.1, anchor='n')

# Definicje Label i Entry
# ...

fetch_data_button = Button(frame, text="Fetch Data", command=fetch_market_data)
fetch_data_button.place(relx=0.6, rely=0.55, relwidth=0.35, relheight=0.3)

# Deklaracja text_area jako globalna i jego definicja
text_area = tk.Text(root, height=10, width=50)
text_area.place(relx=0.1, rely=0.3, relwidth=0.8, relheight=0.5)

root.mainloop()