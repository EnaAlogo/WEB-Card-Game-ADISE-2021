# ADISE21_gandalfthegrey
Table of Contents
=================
   * [Εγκατάσταση](#εγκατάσταση)
      * [Απαιτήσεις](#απαιτήσεις)
      
   * [Περιγραφή API](#περιγραφή-api)
      * [Methods](#methods)
         * [deck](#deck)
            * [Ανάγνωση deck](#ανάγνωση-deck)
            * [Αρχικοποίηση deck](#αρχικοποίηση-deck)
         * [card](#card)
            * [Ανάγνωση κάρτας](#ανάγνωση-κάρτας)
            * [Μεταβολή κάρτας](#μεταβολή-κάρτας)
         * [Player](#player)
            * [Ανάγνωση στοιχείων παίκτη](#ανάγνωση-στοιχείων-παίκτη)
            * [Καθορισμός στοιχείων παίκτη](#καθορισμός-στοιχείων-παίκτη)
         * [Status](#status)
            * [Ανάγνωση κατάστασης παιχνιδιού](#ανάγνωση-κατάστασης-παιχνιδιού)
      * [Entities](#entities)
         * [deck](#deck)
         * [Players](#players)
         * [Game_status](#game_status)


# Demo Page

Μπορείτε να κατεβάσετε τοπικά ή να επισκευτείτε την σελίδα: https://users.it.teithe.gr/~it164773/adise21/GandalfTheGrey/www/index.html




# Εγκατάσταση

## Απαιτήσεις

* Apache2
* Mysql Server
* php


# Περιγραφή Παιχνιδιού

O μουτζούρης παίζεται ως εξής: Αφού ανακατέψουμε καλά, μοιράζουμε όλη την τράπουλα στους παίχτες έτσι ώστε όλοι να έχουν των ίδιο αριθμό φύλλων (ή + - 1). Κάθε παίχτης αφαιρεί από τα φύλλα που έχει στα χέρια του τα ζευγάρια, δηλαδή, 2 Άσσους 2 δυάρια 2 τριάρια κ.τ.λ. Τα υπόλοιπα τα κρατάμε στο χέρι σαν βεντάλια έτσι ώστε να μπορεί ο άλλος παίχτης να διαλέξει, χωρίς να τα βλέπει, ένα από αυτά. Ο πρώτος παίχτης τραβάει ένα φύλλο από τον αντίπαλο, αν κάνει ζευγάρι το νέο χαρτί με κάποια από τα δικά του τότε τα ρίχνει, αλλιώς τα κρατάει και συνεχίζει ο επόμενος. Όποιος ζευγαρώσει όλα τα φύλλα του βγαίνει από το παιχνίδι. Όποιος μείνει τελευταίος με τον Ρήγα Μπαστούνι (τον Μουτζούρη) στο χέρι του είναι ο χαμένος.

Η βάση μας κρατάει τους εξής πίνακες και στοιχεία : Αρχικά όλο το functionality της εφαρμογής γίνετε αυτόματα στην βάση μέσω stored procedures (π.χ. ανακάτεμα, επιλογή κάρτας, διαγραφή των διπλών κτλ),οι πινάκες είναι οι: deck,game_status,player όπου αποθηκεύονται  τα στοιχειά της τράπουλας και σε ποιον ανήκει το κάθε φύλλο,οι παίκτες το όνομα το token, το τρέχον status του παιχνιδιού ,ποιος έχει σειρά, το αποτέλεσμα εάν έχει βγει καθώς και πότε έγινε η τελευταία αλλαγή.

Η εφαρμογή απαπτύχθηκε μέχρι το σημείο: fully functional player vs player Μουτζουρης με GUI και sound effects , ενα scoreboard το oποίο δουλέυει στον client και δεν επικοινωνεί με την βαση. Υπήρχε η ιδέα για δυνατότητα παραπάνω από δυο παικτών αλλά δεν πρόλαβε/μπόρεσε να υλοποιηθεί , δεν υπάρχει δυνατότητα ύπαρξης πολλών σύγχρονων παιχνιδιών 

## Συντελεστές
Στο project Πραγματοποιήθηκε ολόκληρο από έμενα(Χαλκίδης Λάζαρος 164773)
με 

GUI Javascript/css/html

Php API

MySQL

# Περιγραφή API

## Methods


### deck
#### Ανάγνωση deck

```
GET /deck/
```

Επιστρέφει το [deck](#deck).

#### Αρχικοποίηση deck
```
POST /deck/
```

Αρχικοποιεί το deck, δηλαδή το παιχνίδι. Γίνονται Το ανακάτεμα της τράπουλας, ο διαμοιρασμός και πετιούνται τα πρώτα διπλά φύλλα συμφώνα με τους κανόνες.
Επιστρέφει το [deck](#deck).


### card
#### Ανάγνωση κάρτας

```
GET /board/card/:cardid/
```

Κάνει την κίνηση κάρτας από τον έναν owner στον άλλον. Προφανώς ελέγχεται αν είναι η σειρά του παίκτη να παίξει με βάση το token.
Επιστρέφει τα στοιχεία από το [deck](#deck) περιλαμβάνει τις αλλαγές.

#### Επιλογή Κάρτας

```
PUT /deck/card/:cardid/
```
Json Data:

| Field             | Description                 | Required   |
| ----------------- | --------------------------- | ---------- |
| `id`               |  Η  Ταυτότητα κάρτας             | yes        |
| `ow`               | Ο παίκτης στον όποιο θα μετακινηθεί η κάρτα επειδή την επέλεξε             | yes        |

Επιστρέφει τα στοιχεία από το [deck](#deck) περιλαμβάνει τις αλλαγές


### Player

#### Ανάγνωση στοιχείων παίκτη
```
GET /players/:p
```

Επιστρέφει τα στοιχεία του παίκτη p ή όλων των παικτών αν παραληφθεί. Το p μπορεί να είναι 'p1' ή 'p2'.

#### Καθορισμός στοιχείων παίκτη
```
PUT /players/:p
```
Json Data:

| Field             | Description                 | Required   |
| ----------------- | --------------------------- | ---------- |
| `username`        | Το username για τον παίκτη p. | yes        |
| `p_turn`           |  ο παίκτης p. | yes        |


Επιστρέφει τα στοιχεία του παίκτη p και ένα token. Το token πρέπει να το χρησιμοποιεί ο παίκτης καθόλη τη διάρκεια του παιχνιδιού.

### Status

#### Ανάγνωση κατάστασης παιχνιδιού
```
GET /status/
```

Επιστρέφει το στοιχείο [Game_status](#Game_status).



## Entities


### deck
---------

Το deck είναι ένας πίνακας, ο οποίος στο κάθε στοιχείο έχει τα παρακάτω:


| Attribute                | Description                                  | Values                              |
| ------------------------ | -------------------------------------------- | ----------------------------------- |
| `cardid`                      | Η   Ταυτότητα κάρτας          | 1..41                                |
| `suits`                      | Η αξία της κάρτας            | "♥","♦","♠","♣"                            |
| `val`                |Η αξία της κάρτας                      |"A",2,3,4,5,6,7,8,9,10,"J","Q","K"                      |
| `owning`            | To χρώμα του πιονιού                         | 'player1','player2','player3','player4','player5','player6' null                       |



### Players
---------

O κάθε παίκτης έχει τα παρακάτω στοιχεία:


| Attribute                | Description                                  | Values                              |
| ------------------------ | -------------------------------------------- | ----------------------------------- |
| `username`               | Όνομα παίκτη                                 | String                              |
| `p_turn`            | ο παίκτης                | 'p1','p2','p3','p4','p5','p6'                             |
| `token  `                | To κρυφό token του παίκτη. Επιστρέφεται μόνο τη στιγμή της εισόδου του παίκτη στο παιχνίδι | HEX |


### Game_status
---------

H κατάσταση παιχνιδιού έχει τα παρακάτω στοιχεία:


| Attribute                | Description                                  | Values                              |
| ------------------------ | -------------------------------------------- | ----------------------------------- |
| `status  `               | Κατάσταση             | 'not active', 'initialized', 'started', 'ended', 'aborded'     |
| `p_turn`                 | O παίκτης που παίζει        | 'p1','p2','p3','p4','p5','p6' ,null                              |
| `result`                 |  O παίκτης που κέρδισε |'p1','p2','p3','p4','p5','p6','D',null                              |
| `last_change`            | Τελευταία αλλαγή/ενέργεια στην κατάσταση του παιχνιδιού         | timestamp |
