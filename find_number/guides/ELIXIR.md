# Fiche Elixir

## Afficher des valeurs

```elixir
IO.inspect("salut") # "salut"
IO.inspect([1,2,3], label: "ma_list") # ma_list: [1,2,3]
```

## Pipe operator

Il permet d'enchainer des opérations facilement.
L'élément avant le pipe devient l'argument du prochain appel de fonction.

```elixir
"        euNevNeib        "
|> String.trim() # "euNevNeib"
|> String.reverse # "bieNveNue"
|> String.capitalize() # "Bienvenue"
```

## If / Else

```elixir
if true do
  IO.puts("Paris")
end

if 5 > 1 do
  IO.puts("ici")
else
  IO.puts("là")
end
```

## Case

Au lieu d'utiliser plusieurs if/else, on a une syntaxe en Elixir plus concise, les case:

```elixir
language = "Elixir"

case language do
  "Python" -> "🐍"
  "Ruby" -> "💎"
  "Elixir" -> "🧪"
  - -> "le reste"
end

# Résultat attendu: "🧪"
```

## Pattern matching

Avec les listes:

```elixir
[a, b, _] = [1, 2, 3]
IO.inspect(a) # 1
IO.inspect(b) # 2
```

Avec les binaries (string):

```elixir
"user_id:" <> user_id = "user_id:ds39k8_cjdi"

IO.inspect(user_id) # ds39k8_cjdi
```

Avec les maps:

```elixir
%{"name" => name } = %{"name" => "José", "language" => "Elixir"}

IO.inspect(name) # "José"


%{language: language } = %{name: "José", language: "Elixir"}

IO.inspect(language) # "Elixir"
```

Avec les fonctions:

```elixir
def print_name(%{name: name}), do: IO.puts(name)
def print_name(_), do: IO.puts("Name not found")
```
