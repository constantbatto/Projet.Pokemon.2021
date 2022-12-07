##Appel des packages
library(dplyr)
library(FactoMineR)
library(explor)
library(questionr)
library(data.table)
library(tidyverse)


##Renommage de la base de données
CB <- read.csv('5-Minute Crafts.csv')


##Supression des colones inutiles
CB$active_since_days = NULL
CB$num_chars = NULL
CB$avg_word_len = NULL
CB$video_id = NULL


##Renommage des colones
colnames(CB)[1] <- "Titre"
colnames(CB)[2] <- "Durée"
colnames(CB)[3] <- "Nombre_de_vues"
colnames(CB)[4] <- "Nombre_de_mots"
colnames(CB)[5] <- "Contient_de_la_ponctuation"
colnames(CB)[6] <- "Nombre_de_mots_en_majuscule"
colnames(CB)[7] <- "Nombre_de_mots_en_minuscule"
colnames(CB)[8] <- "Contient_des_mots_vide"
colnames(CB)[9] <- "Contient_des_chiffres"
colnames(CB)[10] <- "Debute_par_un_chiffre"
colnames(CB)[11] <- "Ressenti_du_titre"


##Creation d'une nouvelle colone
CB$Ratio_mot_sur_mot_en_majuscule <- CB$Nombre_de_mots_en_majuscule / CB$Nombre_de_mots
colnames(CB)[12] <- "Tout_en_majuscule"
CB$Nombre_de_mots_en_majuscule = NULL
CB$Nombre_de_mots_en_minuscule = NULL


##Recodage des variables pour avoir des variables qualitatives

  #On transforme le ratio mot / mot en majuscule en titre tout en majuscule : oui ou non
CB$Tout_en_majuscule <- cut(CB$Tout_en_majuscule, c(-0.1,0.99999,2), labels = c("non","oui"))

  #On classe le nombre de mot en quatre categorie corespondant aux quartils et a la mediane
summary(CB$Nombre_de_mots)
CB$Nombre_de_mots <- cut(CB$Nombre_de_mots, c(0,3,8,10,21), labels = c("Moins de 3 mots","entre 3 et 8 mots", "entre 8 et 10 mots", "plus de 10 mots"))

  #On transforme la variable nombre de mot vide en variable contient des mots vides : oui ou non
CB$Contient_des_mots_vide <- cut(CB$Contient_des_mots_vide, c(-0.1,0.9,100), labels = c("non","oui"))

  #On transforme la variable nombre de signe de ponctuation en variable contient des signe de ponctuation : oui ou non
summary(CB$Contient_de_la_ponctuation)
CB$Contient_de_la_ponctuation <- cut(CB$Contient_de_la_ponctuation, c(-0.1,0.9,100), labels = c("non","oui"))

  #Explicitation des données 1=oui 0=non
CB$Contient_des_chiffres <- recode(CB$Contient_des_chiffres, '1'='oui','0'='non', .default = NA_character_)

  #Explicitation des données 1=oui 0=non
CB$Debute_par_un_chiffre <- recode(CB$Debute_par_un_chiffre, '1'='oui','0'='non', .default = NA_character_)

  #On Crée des categories pour la durée des videos
summary(CB$Durée)
CB$Durée <- cut(CB$Durée, c(0,600,840,960,15000), labels = c("Moins de 10min","entre 10min et 14min", "entre 14min et 16min", "plus de 16min"))

  #On Crée des categories pour le ressenti du titre des videos
CB$Ressenti_du_titre <- cut(CB$Ressenti_du_titre, c(-1.1,-0.5,0,0.5,1.1), labels = c("Negatif","Plutot negatif", "Plutot positif", "Positif"))


##Nom de ligne = Titre + numero de ligne pour eviter les doublons
CB <- mutate(CB, id = rownames(CB))
CB$Titre <-paste(CB$id,CB$Titre,sep="_")
CB$id = NULL
row.names(CB) = CB$Titre
CB$Titre = NULL


##Creation de l'ACM
res.mca <- MCA(CB,
               quanti.sup = 2, # Variables quantitatives supplémentaires : Nombre_De_Vue
               graph=FALSE)

explor(res.mca) #affichage de l'ACM


