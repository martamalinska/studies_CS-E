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
        current_slice = data[i:i + pattern_length]
        if similar_pattern(target_pattern, current_slice):
            return current_slice
    return None


def similar_pattern(pattern1, pattern2, tolerance=0.1):
    for candle1, candle2 in zip(pattern1, pattern2):
        if abs(candle1['open'] - candle2['open']) / candle1['open'] > tolerance or \
                abs(candle1['close'] - candle2['close']) / candle1['close'] > tolerance:
            return False
    return True


url = 'https://www.mexc.com/open/api/v2/market/kline?symbol=SHINOBI_USDT&interval=60m&limit=1000'
candle_data = fetch_candles(url)

pattern_length = 10
if len(candle_data) >= pattern_length:
    matched_pattern = find_candle_pattern(candle_data, pattern_length)
    if matched_pattern:
        df_matched = pd.DataFrame(matched_pattern)
        df_matched['time'] = pd.to_datetime(df_matched['time'], unit='ms')
        df_matched = df_matched.set_index("time")

        # Customizing the plot colors
        custom_style = mpl.make_marketcolors(up='#A7BED3', down='#C6E2E9', edge='inherit', wick='inherit',
                                             volume='inherit')
        custom_mpf_style = mpl.make_mpf_style(marketcolors=custom_style, base_mpf_style='yahoo')

        mpl.plot(
            df_matched,
            type='candle',
            title="Matched Pattern",
            style=custom_mpf_style,
            mav=(3, 6, 9)
        )
    else:
        print("No pattern match found")
else:
    print("Not enough data to match the pattern")