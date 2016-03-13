# test_tech_skel

Add in your `.bashrc` your Wit & Amazon access keys :
```
  #Amazon access keys
  export AWS_ACCESS_KEY_ID={KEY}
  export AWS_SECRET_ACCESS_KEY={SECRET}
  #Wit access token
  export WIT_ACCESS_TOKEN={TOKEN}
```

L'objectif pour moi était de réaliser une recherche sur 2 catégories au choix (Books & Cars), accompagnée d'un prix, mais j'ai pas trouvé comment demander un filtre sur le prix à amazon.

J'ai aussi pô trouvé comment extraire l'objet principal de la recherche avec Wit, du coup j'envoie simplement à amazon la query entière dans 'keywords' accompagné de la catégorie trouvée (Books ou Cars) pour faire la recherche. Ce n'est pas très efficace.
