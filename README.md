# The Dark Side

Ce mini projet a pour but de facilité l'utilisation de Linux sur les pc de l'iut.

Le principe est très simple, il suffit de lancer un tout petit script qui va totalement métamorphoser l'apparence et le comportement du bureau, tout en ajoutant de vrais outils pour travailler.

## Installation

Il faut télécharger le script [the_dark_side.bash](https://raw.githubusercontent.com/L0L022/config_iut/master/the_dark_side.bash) (clique droit -> Enregistrer la cible du lien sous) et le mettre dans le net_home ou une clef usb. Après il ne reste plus qu'à l'exécuter et le tour est joué ! La magie vaudou prend (normalement) moins d'une demie minute pour faire son effet.

## Les changements

On peut classer les changements apportés en deux catégories:
- Modification de l'environnement de bureau
- L'ajout de l'éditeur de texte Atom

### Environnement de bureau

Ce qui saute d'abord aux yeux c'est le nouveau thème [Arc](https://github.com/horst3180/Arc-theme) tellement trop dark.

Ajout de raccourcies vers les applications les plus utilisées sur le bureau:
- firefox/chromium
- atom
- scilab

### Atom

Atom est un éditeur de texte qui a un système de paquet (plugins) qui lui permet d'être totalement personnalisable et donc parfaitement adapté à n'importe quelle situation.

#### BASH

[linter-shellcheck](https://atom.io/packages/linter-shellcheck): Affiche les erreurs à la volé grâce à [shellcheck](https://github.com/koalaman/shellcheck).

#### BDD

[data-atom](https://atom.io/packages/data-atom): Executer les requêtes sql sans quitter atom (au revoir phppgadmin)
![data-atom](https://cloud.githubusercontent.com/assets/156625/15249612/ccd377b0-1963-11e6-88ad-42eee914fc38.gif)

#### C++

[linter-gcc](https://atom.io/packages/linter-gcc): Affiche les erreurs de compilation.
![linter-gcc](https://raw.githubusercontent.com/hebaishi/images/master/lintergcc_onthefly.gif)

#### Web

[atom-bootstrap3](https://atom.io/packages/atom-bootstrap3): Ajoute l'auto-complétion pour bootstrap 3.
![atom-bootstrap3](https://dl.dropboxusercontent.com/u/20947008/webbox/atom/atom-bootstrap-3.gif)

[atom-html-preview](https://atom.io/packages/atom-html-preview): Affiche la page web dans atom et elle s'actualise toute seule !
![atom-html-preview](https://dl.dropboxusercontent.com/u/20947008/webbox/atom/atom-html-preview.png)

[color-picker](https://atom.io/packages/color-picker): Permet de sélectionner une couleur sans se casser la tête.
![color-picker](https://github.com/thomaslindstrom/color-picker/raw/master/preview.gif)

[linter-htmlhint](https://atom.io/packages/linter-htmlhint): Affiche les erreurs html.

[linter-stylelint](https://atom.io/packages/linter-stylelint): Affiche les erreurs css.
![linter-stylelint](https://raw.githubusercontent.com/AtomLinter/linter-stylelint/master/demo.png)

[random](https://atom.io/packages/random): Donne des noms, phrases, paragraphes et plein d'autre trucs au hasard.
![random](https://cdn.rawgit.com/RichardSlater/atom-random/v0.1.4/assets/screenshot.gif)

[webbox-color](https://atom.io/packages/webbox-color): Affiche les couleurs derrière les codes couleurs.
![webbox-color](https://dl.dropboxusercontent.com/u/20947008/webbox/atom/atom-color-3.png)

#### Autre

[git-plus](https://atom.io/packages/git-plus): Pour faire les commandes git depuis atom.
![git-plus](https://raw.githubusercontent.com/akonwi/git-plus/master/commit.gif)

[script](https://atom.io/packages/script): Lance script bash et compile/lance fichier cpp. Attention !: saisi utilisateur non prise en charge.
