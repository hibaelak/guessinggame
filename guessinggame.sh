653
#!/usr/bin/env bash
# File: guessinggame.sh
# Jeu : deviner le nombre de fichiers dans le repertoire actuel

# Fonction qui retourne le nombre de fichiers du repertoire actuel
count_files() {
    ls -1 | wc -l
}

nb_files=$(count_files)
guess=-1

echo "Bienvenue dans le jeu de devinettes !"
echo "Combien de fichiers y a-t-il dans le repertoire actuel ?"

# Boucle : on continue tant que la reponse n'est pas correcte
while [[ $guess -ne $nb_files ]]
do
    read -p "Entrez votre estimation : " guess

    # On verifie que la saisie est bien un nombre entier
    if [[ ! $guess =~ ^[0-9]+$ ]]
    then
        echo "Veuillez entrer un nombre entier valide."
        guess=-1
    elif [[ $guess -lt $nb_files ]]
    then
        echo "Trop bas ! Essayez encore."
    elif [[ $guess -gt $nb_files ]]
    then
        echo "Trop haut ! Essayez encore."
    fi
done

echo "Felicitations ! Il y a bien $nb_files fichiers dans ce repertoire."
