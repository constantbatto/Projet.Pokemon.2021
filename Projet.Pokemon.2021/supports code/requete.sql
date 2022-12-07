CREATE USER 'pokemonUser'@'%' IDENTIFIED BY 'pokemon1234';
GRANT ALL PRIVILEGES ON `pokemon2019`.* TO 'pokemonUser'@'%';
FLUSH PRIVILEGES;