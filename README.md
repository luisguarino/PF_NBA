# PF_SPORTICS_LAM_NBA

## ¿Quienes somos?
Somos una consultora llamada Sportycs LAM que se encarga de realizar análisis y predicciones deportivas. Fuimos contratados por la franquicia de NBA "New York Knicks" 
nuestro objetivo será establecer una base sólida que respalde la toma de decisiones en la renovación de contratos de jugadores para las próximas temporadas.

## Problema de estudio:
El equipo neoyorquino, presenta malos desempeños deportivos de algunos de sus jugadores afectando la performance global del equipo, obteniendo resultados negativos. Nos han contratado con el fin de establecer una base sólida que respalde la toma de decisiones en la renovación de contratos de jugadores para las próximas temporadas. Nuestro enfoque se centrará en garantizar que los jugadores que continúen en el equipo sean aquellos cuyo rendimiento tenga un impacto significativo en el desempeño general del equipo.

# Objetivo principal del proyecto:
El objetivo  de Sportycs LAM es proporcionar una base sólida para la toma de decisiones sobre la renovación de contratos, garantizando que los jugadores que continúen en el equipo sean aquellos cuyo desempeño tenga un impacto positivo y medible en los resultados del equipo.

# Resultados esperados:
Con el objetivo planteado para Sportycs LAM, los resultados esperados son:
Identificación clara de jugadores clave: A través de un análisis basado en métricas de desempeño, se espera identificar a los jugadores cuyo rendimiento impacta positivamente en el equipo, ayudando a seleccionar a los mejores candidatos para la renovación de contratos.

Optimización de recursos financieros: La renovación de contratos se realizará de manera más estratégica, evitando la inversión en jugadores con bajo rendimiento y asegurando que los recursos se destinen a aquellos que realmente contribuyen al éxito del equipo.

Mejor desempeño del equipo: Al retener a los jugadores con mejor desempeño, se espera mejorar los resultados generales del equipo en competiciones y temporadas futuras.
Toma de decisiones informadas y objetivas: Los directivos y entrenadores podrán basar sus decisiones en datos sólidos, reduciendo el margen de error en la evaluación de jugadores y minimizando sesgos subjetivos.

Mejora de la cohesión del equipo: La renovación de contratos basada en el desempeño puede promover una cultura de esfuerzo y resultados dentro del equipo, motivando a los jugadores a mejorar continuamente su rendimiento.

### Fuente de los datos:

Se utiliza el dataset  NBA Database tomado de la página Kaggle
 (https://www.kaggle.com/datasets/wyattowalsh/basketball/data)
Este conjunto de datos se actualiza diariamente e incluye:
30 teams
4800+ players
65,000+ games (every game since the inaugural 1946-47 NBA season)
Box Scores for over 95% of all games
Play-by-Play game data with 13M+ rows of Play-by-Play data in all!

### Descripcion de los datos:
El Dataset está conformado inicialmente por 16 tablas con un formato csv, UTF 8, de las cuales se proyecta utilizar 6 de ellas:
 
common_player_info: Muestra las características particulares  de los jugadores.
game: Contiene datos sobre los juegos.
line_scores: Alberga documentación de los puntos por equipo por cuartos.
other_stats: Incluye estadísticas de tácticas de juegos.
players: Identificación de los jugadores.
team: Descripción detallada de cada equipo.
play_by_play: Registra las acciones de los jugadores.

Dichas tablas se analizarán para limpiar y trabajar con las columnas que aporten los datos necesarios para la toma de decisiones.

El caso estudiado se llevó a cabo en dos sprint, de dos semanas cada uno.
# Sprint #1
### Creación del repositorio público en github

El filtrado de las tablas se realizó mediante Python en Visual Studio Code, con el objetivo de eliminar datos innecesarios para el análisis. Esto fue crucial, ya que uno de los principales motivos era reducir el alto consumo de recursos que implicaba trabajar con grandes volúmenes de información. 
A cada una de ellas se le realizó:
common_player_info: Se filtró la columna person_id para incluir únicamente a los jugadores pertenecientes al equipo New York Knicks.
others_stats: Se aplicó un filtro en la columna game_id para obtener los datos correspondientes a los partidos específicos.
game: Se realizaron cambios en el tipo de dato de algunas columnas. Luego, se filtró utilizando team_name_home y team_name_away para seleccionar únicamente los juegos en los que participaron los New York Knicks. Además, se aplicó un filtro adicional en la columna game_date para obtener los partidos a partir del 03/11/2021, enfocándonos en las dos últimas temporadas.
line_scores: Se realizó un filtrado basado en la columna game_id para extraer la información de los juegos seleccionados.
player: Esta tabla, que contiene los detalles de los jugadores, fue filtrada utilizando los IDs de los jugadores que pertenecen a los New York Knicks.
play_by_play: Se filtró la columna game_id utilizando los IDs de los juegos obtenidos de la tabla game.
team: No se aplicaron filtros en esta tabla, ya que no fue necesario.

## Incorporación de Datos de Rendimiento de los New York Knicks: Temporadas 2021-2023
Se han incorporado a nuestro dataset original tres tablas adicionales que contienen datos estadísticos de los jugadores de los New York Knicks correspondientes a la temporada regular 2021-2022, la temporada regular 2022-2023 y los playoffs 2022-2023. Estos conjuntos de datos fueron obtenidos a través de Kaggle y complementan la información existente para un análisis más completo.
##  Enlaces Relacionados 
Dataset 2021-2022 NBA players stats
https://www.kaggle.com/datasets/vivovinco/nba-player-stats
Dataset 2022-2023 NBA players stats
https://www.kaggle.com/datasets/vivovinco/20222023-nba-player-stats-regular

### Creación Base de Datos 
En SQL Server se crea la base de datos y se importan las tablas ya filtradas con las que se va a trabajar, para comenzar con la normalización de los datos realizando un tratamiento de los datos faltantes, una corroboración del tipo de dato de cada columna y  se realiza el casteo de la columna Date para establecerla como índice y así facilitar el análisis temporal.

