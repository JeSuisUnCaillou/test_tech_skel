# test_tech_skel

Add in your `.bashrc` your Wit & Amazon access keys :
```
  #Amazon access keys
  export AWS_ACCESS_KEY_ID={KEY}
  export AWS_SECRET_ACCESS_KEY={SECRET}
  #Wit access token
  export WIT_ACCESS_TOKEN={TOKEN}
```

L'objectif pour moi était de réaliser un outil de recherche en langage naturel sur 2 catégories prédéfinies (Books & Cars), accompagnée d'un prix. Je n'ai pas trouvé comment demander un filtre sur le prix à amazon, donc seule l'identification de la catégorie est en place.

J'ai pas non plus trouvé comment extraire l'objet principal de la recherche avec Wit, du coup j'envoie simplement à amazon la question originale dans 'keywords' accompagné de la catégorie trouvée par Wit (Books ou Cars) pour faire la recherche. Ce n'est pas très efficace.

Pour ce qui est du back-end, j'aurais voulu ajouter 2 objets : QueryClassifier & QueryIdentifier. L'un classe les requêtes, l'autre identifie et traite les requêtes "reconnues". J'aurais aussi fait persister les 2 objets en BDD, afin de lier aux recherches leurs classifications et résultats, et pouvoir revoir le résultat sans rejouer les 2 algos.
