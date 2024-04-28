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

url = 'https://www.mexc.com/open/api/v2/market/kline?symbol=SHINOBI_USDT&interval=60m&limit=10'

candle_data = fetch_candle_data(url)
formatted_candles = format_candle_data(candle_data)
df = prepare_dataframe(formatted_candles)

# Zmienilam sobie kolory swieczek na ladniejsze :)
mc = mpl.make_marketcolors(
    up='#D8BFD8', down='#B0C4DE',
    wick={'up':'#D8BFD8', 'down':'#B0C4DE'},
    edge='inherit',
    volume='inherit'
)

s = mpl.make_mpf_style(marketcolors=mc)

mpl.plot(
    df,
    type='candle',
    title='Candle Chart for SHINOBI_USDT',
    style=s,
    mav=(3, 6, 9)
)
