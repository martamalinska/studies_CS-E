import requests
import json
import pandas as pd
import mplfinance as mpl

def fetch_candle_data(url):
    response = requests.get(url)
    responseBody = response.text
    responseBodyJson = json.loads(responseBody)
    return responseBodyJson["data"]

def format_candle_data(candlesData):
    formattedCandlesData = []
    for candle in candlesData:
        formattedCandlesData.append({
            'time': candle[0],
            'open': float(candle[1]),
            'close': float(candle[2]),
            'high': float(candle[3]),
            'low': float(candle[4])
        })
    return formattedCandlesData

def prepare_dataframe(candlesData):
    df = pd.json_normalize(candlesData)
    df['time'] = pd.to_datetime(df['time'], unit='s')
    df = df.set_index('time')
    return df

# Normalizacja danych
def normalize_candles(candles):
    norm_candles = []
    for candle in candles:
        open_price = float(candle['open'])
        close_price = float(candle['close'])
        if open_price != 0:
            change = (close_price - open_price) / open_price
        else:
            change = 0
        norm_candles.append(change)
    return norm_candles

# Znajdowanie dopasowania
def find_match(pattern, data, threshold=0.01):
    for i in range(len(data) - len(pattern)):
        match = True
        for j in range(len(pattern)):
            if not (data[i+j] <= pattern[j] + threshold and data[i+j] >= pattern[j] - threshold):
                match = False
                break
        if match:
            return i
    return -1

# Pobieranie danych
url = 'https://www.mexc.com/open/api/v2/market/kline?symbol=SHINOBI_USDT&interval=1m&limit=1000'
candle_data = fetch_candle_data(url)
formatted_candles = format_candle_data(candle_data)
df = prepare_dataframe(formatted_candles)

# Przygotowanie wzorca do porównania (ostatnie 10 świec)
pattern = normalize_candles(formatted_candles[-10:])

# Przygotowanie danych do przeszukiwania (pierwsze 990 świec)
search_data = normalize_candles(formatted_candles[:-10])

# Szukanie dopasowania
match_index = find_match(pattern, search_data, threshold=0.01)

# Sprawdzenie, czy znaleziono dopasowanie i wyświetlenie wyników
if match_index != -1:
    print(f"Znaleziono dopasowanie na indeksie: {match_index}")
    matching_candles = formatted_candles[match_index:match_index+10]
    df_matching = prepare_dataframe(matching_candles)
    mpl.plot(
        df[-10:],
        type='candle',
        title='Ostatnie 10 świec',
        style='yahoo',
        mav=(3, 6, 9)
    )
    mpl.plot(
        df_matching,
        type='candle',
        title='Znalezione dopasowanie',
        style='yahoo',
        mav=(3, 6, 9)
    )
else:
    print("Nie znaleziono dopasowania.")
