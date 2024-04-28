import requests
import pandas as pd
import json
import mplfinance as mpl

def fetch_candles(url):
    response = requests.get(url)
    responseBody = response.text
    responseBodyJson = json.loads(responseBody)
    candlesData = responseBodyJson["data"]
    formattedCandlesData = []
    for candle in candlesData:
        formattedCandle = {
            'time': candle[0],
            'open': float(candle[1]),
            'close': float(candle[2]),
            'high': float(candle[3]),
            'low': float(candle[4])
        }
        formattedCandlesData.append(formattedCandle)
    return formattedCandlesData

def find_candle_pattern(data, pattern_length):
    target_pattern = data[-pattern_length:]

    for i in range(len(data) - pattern_length):
        current_slice = data[i:i+pattern_length]

        if similar_pattern(target_pattern, current_slice):
            return current_slice

    return None

def similar_pattern(pattern1, pattern2, tolerance=0.02):
    for candle1, candle2 in zip(pattern1, pattern2):

        if abs(candle1['open'] - candle2['open']) / candle1['open'] > tolerance:
            return False
        if abs(candle1['close'] - candle2['close']) / candle1['close'] > tolerance:
            return False
    return True

url = 'https://www.mexc.com/open/api/v2/market/kline?symbol=SHINOBI_USDT&interval=60m&limit=10'
candle_data = fetch_candles(url)

pattern_length = 10
matched_pattern = find_candle_pattern(candle_data[-1000:], pattern_length)

if matched_pattern:
    df = pd.DataFrame(candle_data)
    df['time'] = pd.to_datetime(df['time'], unit='s')
    df = df.set_index("time")

    mpl.plot(
        df[-10:],
        type="candle",
        title="Last 1000 candles matched by pattern",
        style="yahoo",
        mav=(3, 6, 9),
    )
    df2 = pd.DataFrame(matched_pattern)
    df2['time'] = pd.to_datetime(df2['time'], unit='s')
    df2 = df2.set_index("time")

    mpl.plot(
        df2,
        type="candle",
        title="Matched Pattern",
        style="yahoo",
        mav=(3, 6, 9)
    )
else:
    print("No pattern match found")
