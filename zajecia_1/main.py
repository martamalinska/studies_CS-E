my_super_nice_name = "marta"
message = f"hello {my_super_nice_name}!"
print(message.title())
print(message.upper())
print(message)
message = message.upper()
print(message)
my_favorite_lectures = ("Moje ulubione przedmioty: "
                       "\n\tProgramowanie"
                       "\n\tMikroekonomia")
print(my_favorite_lectures)


#  Usuwanie białych znaków
login = " marta123 "
print(f'"{login}"')
print(f'"{login.rstrip()}"')
print(f'"{login.lstrip()}"')
print(f'"{login.strip()}"')
print(f'"{login}"')


uep_website = " http://ue.Poznan.pl/ "
print(f'"{uep_website}''')
uep_website = (uep_website.strip().removefix("https://").removeprefix("https://").removesuffix("/").lower())
print(f'"{uep_website}"')