-- ============================================================
-- Nom de la base   :  OptimiseurEquipePOKEMON                             
-- 14 decembre 2019
-- Constant BATTO             
-- ============================================================

drop table PossedeEquipe cascade constraints
;

drop table Pokemons cascade constraints
;

drop table Dresseurs cascade constraints
;

drop table Terrains cascade constraints
;

drop table Objets cascade constraints
;

drop table Meteos cascade constraints
;

drop table Specificites cascade constraints
;

drop table Types cascade constraints
;


-- ============================================================
--   Table : Types
-- ============================================================
create table Types
(
NomType         VARCHAR(255)           not null,
ImageType       MEDIUMBLOB             null    ,
primary key (NomType)
)
;

-- ============================================================
--   Table : Specificites
-- ============================================================
create table Specificites
(
NomSpecificite  VARCHAR(255)           not null,
GainAttaqueSpe  INT(11)                null    ,
  GainAttaque int(11) DEFAULT NULL,
  GainDefenseSpe int(11) DEFAULT NULL,
  GainDefense int(11) DEFAULT NULL,
  GainVitesse int(11) DEFAULT NULL,
primary key (NomSpecificite)
)
;

-- ============================================================
--   Table : Meteos
-- ============================================================
create table Meteos
(
NomMeteo        VARCHAR(255)           not null,
NomSpecificite  VARCHAR(255)           null    ,
NomType         VARCHAR(255)           null    ,
primary key (NomMeteo)
)
;

-- ============================================================
--   Index : MeteoA_FK
-- ============================================================
create index MeteoA_FK on Meteos (NomSpecificite asc)
;

-- ============================================================
--   Index : MeteoAffecte_FK
-- ============================================================
create index MeteoAffecte_FK on Meteos (NomType asc)
;

-- ============================================================
--   Table : Objets
-- ============================================================
create table Objets
(
NomObjet        VARCHAR(255)           not null,
NomSpecificite  VARCHAR(255)           null    ,
primary key (NomObjet)
)
;

-- ============================================================
--   Index : ObjetA_FK
-- ============================================================
create index ObjetA_FK on Objets (NomSpecificite asc)
;

-- ============================================================
--   Table : Terrains
-- ============================================================
create table Terrains
(
NomTerrain      VARCHAR(255)           not null,
NomSpecificite  VARCHAR(255)           null    ,
NomType         VARCHAR(255)           null    ,
primary key (NomTerrain)
)
;

-- ============================================================
--   Index : TerrainA_FK
-- ============================================================
create index TerrainA_FK on Terrains (NomSpecificite asc)
;

-- ============================================================
--   Index : TerrainAffecte_FK
-- ============================================================
create index TerrainAffecte_FK on Terrains (NomType asc)
;

-- ============================================================
--   Table : Dresseurs
-- ============================================================
create table Dresseurs
(
NomDresseur     VARCHAR(255)           not null,
NomMeteo        VARCHAR(255)           null    ,
NomTerrain      VARCHAR(255)           null    ,
PrenomDresseur  VARCHAR(255)           null    ,
ImageDresseur   MEDIUMBLOB             null    ,
primary key (NomDresseur)
)
;

-- ============================================================
--   Index : ConnaitMeteo_FK
-- ============================================================
create index ConnaitMeteo_FK on Dresseurs (NomMeteo asc)
;

-- ============================================================
--   Index : ConnaitTerrain_FK
-- ============================================================
create index ConnaitTerrain_FK on Dresseurs (NomTerrain asc)
;


-- ============================================================
--   Table : Pokemons
-- ============================================================
create table Pokemons
(
Numero          INT(11)                not null,
NomType         VARCHAR(255)           null    ,
NomObjet        VARCHAR(255)           null    ,
NomPokemon      VARCHAR(255)           null    ,
AttaqueSpe      INT(11)                null    ,
DefenseSpe      INT(11)                null    ,
Attaque         INT(11)                null    ,
Defense         INT(11)                null    ,
Vitesse         INT(11)                null    ,
ImagePokemon    MEDIUMBLOB             null    ,
primary key (Numero)
)
;

-- ============================================================
--   Index : Contient_FK
-- ============================================================
create index Contient_FK on Pokemons (NomType asc)
;

-- ============================================================
--   Index : PokemonPossede_FK
-- ============================================================
create index PokemonPossede_FK on Pokemons (NomObjet asc)
;

-- ============================================================
--   Table : PossedeEquipe
-- ============================================================
create table PossedeEquipe
(
NomDresseur     VARCHAR(255)           not null,
Numero          INT(11)                not null,
primary key (NomDresseur, Numero)
)
;

-- ============================================================
--   Index : DresseurEquipe_FK
-- ============================================================
create index DresseurEquipe_FK on PossedeEquipe (NomDresseur asc)
;

-- ============================================================
--   Index : NumeroEquipe_FK
-- ============================================================
create index NumeroEquipe_FK on PossedeEquipe (Numero asc)
;



alter table Meteos
add foreign key  (NomSpecificite)
references Specificites (NomSpecificite)
;

alter table Meteos
add foreign key  (NomType)
references Types (NomType)
;

alter table Objets
add foreign key  (NomSpecificite)
references Specificites (NomSpecificite)
;

alter table Terrains
add foreign key  (NomSpecificite)
references Specificites (NomSpecificite)
;

alter table Terrains
add foreign key  (NomType)
references Types (NomType)
;

alter table Dresseurs
add foreign key  (NomMeteo)
references Meteos (NomMeteo)
;

alter table Dresseurs
add foreign key  (NomTerrain)
references Terrains (NomTerrain)
;

alter table Pokemons
add foreign key  (NomType)
references Types (NomType)
;

alter table Pokemons
add foreign key  (NomObjet)
references Objets (NomObjet)
;

alter table PossedeEquipe
add foreign key  (NomDresseur)
references Dresseurs (NomDresseur)
;

alter table PossedeEquipe
add foreign key  (Numero)
references Pokemons (Numero)
;



