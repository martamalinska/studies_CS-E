import pandas as pd

def wczytaj_dane():
    return pd.read_csv('movies.csv', sep=';', encoding='ISO-8859-1')

def zadanie1():
    df = wczytaj_dane()
    movies_2000 = df[df['Year'] == 2000]
    print("Filmy z roku 2000:")
    print(movies_2000)

def zadanie2():
    df = wczytaj_dane()
    df['Length'] = pd.to_numeric(df['Length'], errors='coerce')
    average_length_by_director = df.groupby('Director')['Length'].mean()
    print("Średnia długość filmów dla każdego reżysera:")
    print(average_length_by_director)

def zadanie3():
    df = wczytaj_dane()
    filtered_df = df[['Title', 'Director', 'Popularity']]
    filtered_df.to_csv('filtered_movies.csv', index=False)
    print("Utworzono plik 'filtered_movies.csv' z filtrami.")

def zadanie4():
    df = wczytaj_dane()
    total_movies = len(df)
    award_movies = len(df[df['Awards'] == 'Yes'])
    award_percentage = (award_movies / total_movies) * 100
    print("Procentowy udział filmów z nagrodami:")
    print(f"{award_percentage}%")

def zadanie5():
    df = wczytaj_dane()
    kubrick_movies = df[df['Director'].str.contains("Kubrick, Stanley", case=False, na=False)]
    print("Filmy reżyserowane przez Kubricka:")
    print(kubrick_movies)

def zadanie6():
    df = wczytaj_dane()
    df['Popularity'] = pd.to_numeric(df['Popularity'], errors='coerce')
    comedy_popularity_sum = df[df['Subject'] == 'Comedy']['Popularity'].sum()
    print("Suma popularności filmów komediowych:")
    print(comedy_popularity_sum)

if __name__ == "__main__":
    zadanie1()
    zadanie2()
    zadanie3()
    zadanie4()
    zadanie5()
    zadanie6()
