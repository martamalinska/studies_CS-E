import pandas as pd

def load_movies_csv():
    return pd.read_csv('movies.csv', sep=';', encoding="ISO-8859-1")

def task1_movies_from_2000(df):
    movies_2000 = df[df['Year'] == 2000]
    print("Movies from the year 2000:")
    print(movies_2000)

def task2_average_movie_length_by_director(df):
    average_lengths = df.groupby('Director')['Length'].mean()
    print("Average movie length by director:")
    print(average_lengths)

def task3_create_csv_with_selected_columns(df):
    selected_columns = df[['Title', 'Director', 'Popularity']]
    selected_columns.to_csv('selected_movie_data.csv', index=False)
    print("CSV with selected columns created.")

def task4_percentage_of_award_winning_movies(df):
    total_movies = len(df)
    award_movies = df['Awards'].sum()  # Assuming Awards column contains 1 for True and 0 for False
    percentage = (award_movies / total_movies) * 100
    print(f"Percentage of award-winning movies: {percentage:.2f}%")

def task5_movies_by_kubrick(df):
    kubrick_movies = df[df['Director'] == 'Kubrick']
    print("Movies by Kubrick:")
    print(kubrick_movies)

def task6_sum_popularity_of_comedy_movies(df):
    comedy_movies = df[df['Subject'].str.lower() == 'comedy']
    total_popularity = comedy_movies['Popularity'].sum()
    print(f"Total popularity of comedy movies: {total_popularity}")

df_movies = load_movies_csv()
task1_movies_from_2000(df_movies)
task2_average_movie_length_by_director(df_movies)
task3_create_csv_with_selected_columns(df_movies)
task4_percentage_of_award_winning_movies(df_movies)
task5_movies_by_kubrick(df_movies)
task6_sum_popularity_of_comedy_movies(df_movies)
