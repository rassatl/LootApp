# 3 - SwiftUI-101
# Exercice 1:
## 1 : Il manque un identifier pour pouvoir se repéré dans la liste.

# Exercice 2:
## 1 : On à rajouté une fonction qui rajoute un élement à la liste, et aussi le fait que lorsque l'on clique sur le bouton cela appel cette fonction
## 2 : List est un composant pour dit que ce qui est présent dedans sera affiché sous forme de liste que dedans, on retrouve 1 bouton et la liste de tous les élement de la liste "Loot". On sépare le bouton du foreach pour éviter la création de pleins de boutons.

# Exercice 3:
## 1 : Le code ne fonctionne pas car il manque un "@State" qui permet de dire à l'application que la liste à été mise à jour, et cela va donc l'actualisé.
## 2 : Car j'ai rajouté un @State.

# Ajouter un item
# Exercice 1 :
## 1 : Pour que le bouton marche il manque l'utilisation d'un @StateObject sur l'object inventaire que l'on à créer, il manque aussi ObservableObject que l'on rajoute à côté du nom de la classe Inventaire et pour finir il manque un @Published sur la liste de loot.

# Exercice 2 :
## 1 : L'utilisation de @StateObject permet le rechargement de la page lorsqu'un objet change, contrairement à @State, qui est utilisé pour les objets personnalisés. L'intégration de cette fonctionnalité nécessite l'ajout de l'interface ObservableObject à la classe. Enfin, pour garantir que la liste n'est créée qu'une seule fois dans l'application, on rajoute @Published .
## 2 : On utilise "@State" pour des données locales à une vue, "@ObservedObject" pour observer des objets externes, et "@StateObject" pour créer et maintenir une référence à un objet observable au niveau de la vue, avec une garantie de persistance de l'instance.
