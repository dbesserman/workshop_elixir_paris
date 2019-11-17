# Fiche LiveView

## C'est quoi ? Ca sert à quoi ?

Les LiveViews sont une fonctionnalité du framework Elixir, Phoenix. Grâce aux LiveViews, vous pourrez créer des interfaces utilisateurs en Elixir très facilement sans écrire une seule ligne de Javascript. En bref, c'est le turfu ! 🚀

L'avantage:

- on peut faire du front sophistiqué dans le back et donc avoir un seul "code base".
- pas besoin de mettre en place une SPA (application Javascript en React, Vue ou Angular, réputé pour être lourd à mettre en place) pour faire des composants front sophistiqué.
- pas besoin de changer de language, vous pouvez rester qu'avec Elixir pour faire une application complète
- si vous avez besoin d'utiliser du Javascript, il existe des "bindings" (mécanisme de liaison entre le JS et Elixir) pour connecter du code JS à vos LiveViews

En résumé:

- Enorme productivité.

Les LiveViews sont un nouveau paradigme très prometteur qui ont pu voir le jour seulement grâce à la puissance de la BEAM (machine virtuelle Erlang qui permet de lancer des applications Elixir et Phoenix). (Bon courage pour mettre en place ça avec Rails 😄)

Pour plus d'infos, vous avez [un chouette talk ici](https://www.youtube.com/watch?v=8xJzHq8ru0M).

## Boilerplate

Boilerplate, c'est un mot anglais qui veut dire "code de base" (pour lancer un projet).

```elixir
defmodule MyAppWeb.XXXLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <h1>XXXX</h1>
    """
  end
end
```

C'est dans la fonction render que vous allez mettre votre code HTML.

## Initialiser le state de la LiveView:

Le state correspond à l'ensemble des données propre à notre LiveView qui sont susceptibles d'être **modifié**.
Ex: pour un compteur, le state correspondra à l'ensemble des valeurs susceptibles d'être modifié. En particulier, on aura qu'une seule valeur, la valeur du compteur (`:count_value`, dans le code ci-dessous).

Pour initialiser du state dans une LiveView, on ajoute la fonction `mount/2` dans le module comme ci-dessous, et on assign les valeurs nécessaires.

```elixir
def mount(_, socket) do
   {:ok, socket
            |> assign(:count_value, 0)
            |> assign(:value2, "value 2")
   }
end
```

## Accéder aux valeurs du state (assigns):

Les valeurs du state sont dans `socket.assigns`.

Ex: Pour accéder à `:count_value`, on fait: `socket.assigns.count_value`.

Dans le HTML, vous pouvez afficher votre valeur ainsi:

```elixir
  def render(assigns) do
    ~L"""
    <h1><%= @count_value %></h1>
    """
  end
```

## Changer valeur du state (assigns):

Pour changer la valeur du state, on utilise la fonction `assign/3`. [assign(socket, clé, nouvelle valeur)]

```elixir
socket |> assign(:count_value, socket.assigns.count_value + 10)
```

## Ajouter une action

Dans le render, ajouter `phx-click` ou un autre [event-binding](https://hexdocs.pm/phoenix_live_view/Phoenix.LiveView.html#module-bindings) dans le bon élement HTML.

Ex:

```elixir
<button phx-click="change_value">Change value</button>
```

Puis, dans le module, ajouter la fonction qui va gérer l'action:

```elixir
def handle_event("change_value", _, socket) do
   {:noreply, socket |> assign(:count_value, socket.assigns.count_value + 10)}
end
```

## Ecrire une condition

Vous pouvez écrire une condition dans le render ainsi:

```elixir
<%= if @value > 0 do %>
  <h2>C'est un nombre positif</h2>
<% end %>
```

## Gérer le CSS

Vous pouvez gérer le CSS dans le fichier `assets/css/app.css`.

## Méthode de travail

Quand vous avez un problème, posez vous les 3 questions du MVC:

- quelles sont mes données? (Model ou state)
- à quoi va ressembler mon interface visuelle (View)
- quels sont les interactions/actions que je dois mettre en place? (Controller)

Ainsi, vous divisez votre fonctionnalité en 3 sous-problèmes que vous devez résoudre:

- données: lister les données susceptibles de changer en cours de route, puis assignez les dans `socket` lors du mount
- interface visuelle: poser le html de la LiveView dans le render
- interaction/action: créer les événements correspondants à votre fonctionnalité et les fonctions qui vont les traiter
