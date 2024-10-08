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
## Creación del repositorio público en github
Se inicia creando el repositorio desde la interfaz de GitHub. Luego, se procede a crear una nueva rama a partir de la rama principal (main), a la cual se le denomina "Develop". Posteriormente, se crea una rama adicional llamada "Desarrollo", que deriva de la rama "Develop". Esto permite establecer diferentes entornos de trabajo y facilita la organización del flujo de desarrollo, asegurando que los cambios se integren de manera controlada antes de llegar a la rama principal.
https://github.com/luisguarino/PF_NBA

## Filtrado de tablas
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

## Normalización de la base de Datos
Cambios en las columnas:
En la tabla “player_filtered”, se modificó el nombre de la columna “id” a “player_id”.
En la tabla “filtered_common_player_info”, se realizaron dos cambios:
La columna “person.id” se renombró como “player_id”.
La columna “display_first_last” ahora se llama “full_name”.

## Nuevas columnas en las tablas de estadísticas de jugadores:
En las tablas “2021-2022 nba players stats”, “2022-2023 nba players stats regular” y “2022-2023 nba players stats playoffs”, se agregaron dos columnas:
“season”: Esta columna contendrá el año de la temporada.
“season_type”: Indicará en qué fase de la temporada se encuentran los partidos (por ejemplo, temporada regular o playoffs).

## Creación de la tabla “player stats”:
Se creó una nueva tabla llamada “player stats”.
Esta tabla se formará mediante un union all con las tablas “2021-2022 nba players stats”, “2022-2023 nba players stats regular” y “2022-2023 nba players stats playoffs”
Además, se añadirá una columna llamada “player_id” para asignar el identificador correspondiente a cada jugador.

## Jugadores:
Se llevó a cabo una operación de left join entre las tablas ‘filtered_common_player_info’ y ‘played_filtered’. Esta decisión se tomó debido a que ambas tablas contenían información similar sobre los jugadores de nuestra plantilla. Como resultado de esta unión, se creó una única tabla que incluye a los jugadores que serán objeto de nuestro análisis.

## Se realizó el diagrama Entidad Relación 
Después de realizar el filtrado de las tablas, se procedió a establecer las Primary Keys (claves primarias) y las Foreign Keys (claves foráneas) para garantizar la integridad referencial y facilitar las relaciones entre las tablas. Las claves primarias se asignaron a aquellos campos que identifican de manera única a cada registro en sus respectivas tablas.

## Seguridad de la Base de Datos
En el contexto de la administración de una base de datos en SQL Server, se han llevado a cabo los siguientes pasos para fortalecer la seguridad:
Creación de un Inicio de Sesión (Login):
 * Se ha creado un inicio de sesión (login) que permite a los usuarios autenticarse en el sistema.
 * Este proceso garantiza que solo las personas autorizadas puedan acceder a la base de datos.
### Creación de un Usuario (User):
 * Se ha definido un usuario asociado al inicio de sesión.
 * Cada usuario tiene permisos específicos para interactuar con la base de datos.
Asignación de Roles:
 * Se ha asignado un rol al usuario.
 * Los roles agrupan permisos y privilegios comunes. Por ejemplo, un rol de ‘Lectura’ podría permitir solo consultas, mientras que un rol de ‘Administrador’ tendría acceso completo.
Configuración de Autenticación del Servidor SQL:
 * Se ha modificado la configuración para requerir autenticación mediante nombre de usuario y contraseña al conectarse al servidor SQL.
 * Esto añade una capa adicional de seguridad al proceso de inicio de sesión.


## Automatización de ingesta de datos 
Creación del Archivo CSV y Carga Inicial:
 * Se genera un archivo CSV que contiene datos en bruto.
 * Estos datos se cargarán posteriormente en nuestra base de datos SQL.
Uso de Tabla Temporal como Puente:
 * Se ejecuta un procedimiento almacenado que ingresa los datos del archivo CSV en una tabla temporal llamada “Players_Stats_temp”. La cual fue creada antes de este paso.
 * Esta tabla temporal actúa como un puente entre los datos brutos y la tabla final deseada.
Inserción en la Tabla Principal:
 * A través de otro procedimiento almacenado, los datos de la tabla temporal se transfieren a la tabla “player_stats”.
 * Esta tabla final contiene los datos estructurados y procesados.
Limpieza de Datos Temporales:
 * Una vez que los datos están en la tabla deseada, se eliminan los registros de la tabla “Players_Stats_temp”.
 * Esto garantiza que solo los datos relevantes permanezcan en la base de datos.
Automatización Mediante Archivo .bat:
 * Para lograr la automatización de este proceso, se crea un archivo .bat.
 * Mediante una tarea programada de Windows, este archivo .bat ejecuta automáticamente los procedimientos almacenados y carga los datos en la base de datos.
Cabe destacar que los datos estadísticos de nuestros jugadores son recibidos semanalmente en una carpeta de Drive. https://docs.google.com/spreadsheets/d/1HcaEjB-oa6wSCyuJGlF29DeCel_hTiL1iWAMN2NekYw/edit?gid=1179889504#gid=1179889504
Estos datos se transforman en un archivo plano en formato CSV, que se almacena en una carpeta especialmente designada para volcar la información en nuestra base de datos SQL. La manipulación de los datos será responsabilidad exclusiva del ingeniero de datos de la consultora. 

