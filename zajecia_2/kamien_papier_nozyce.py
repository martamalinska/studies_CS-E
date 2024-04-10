import random

def play_round(user_choice, computer_choice):
    rules = {"K": "N", "P": "K", "N": "P"}
    if user_choice == computer_choice:
        return "Niestety remis! Myślicie tak samo. Wybraliście: " + user_choice
    elif rules[user_choice] == computer_choice:
        victory_message = """
Gratulacje, jesteś super i wygrałeś! Słodkie kotki dla Ciebie!
        へ   ♡   ╱|、
     ૮ - ՛ )    (` - 7
     /⁻   ៸|     |、 ⁻〵
 乀 (ˍ, ل ل      じしˍ,)ノ
"""
        return f"Wygrałeś! {user_choice} pokonuje {computer_choice}" + victory_message
    else:
        return f"Przegrałeś! {computer_choice} pokonuje {user_choice}"

def get_computer_choice():
    return random.choice(["K", "P", "N"])

def game():
    print("Witaj w emocjonującejgrze Kamień, Papier, Nożyce!\n")
    score = {"Wygrane": 0, "Przegrane": 0, "Remisy": 0}
    
    while True:
        user_choice = input("Wybierz: K (Kamień), P (Papier), N (Nożyce) lub Q, aby zakończyć: ").upper()
        
        if user_choice == "Q":
            print("\nDziękuję bardzo za grę ^^")
            break
        
        if user_choice not in ["K", "P", "N"]:
            print("Niepoprawny wybór. Wybierz K, P, N lub Q.\n")
            continue
        
        computer_choice = get_computer_choice()
        print(f"\nTwój wybór: {user_choice} | Komputer wybrał: {computer_choice}")
        
        result = play_round(user_choice, computer_choice)
        print(result)
        
        if "Wygrałeś" in result:
            score["Wygrane"] += 1
        elif "Przegrałeś" in result:
            score["Przegrane"] += 1
        else:
            score["Remisy"] += 1
        
        print(f"Aktualny wynik - Wygrane: {score['Wygrane']}, Przegrane: {score['Przegrane']}, Remisy: {score['Remisy']}\n")

game()
