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
#### Creación de un Inicio de Sesión (Login):
 * Se ha creado un inicio de sesión (login) que permite a los usuarios autenticarse en el sistema.
 * Este proceso garantiza que solo las personas autorizadas puedan acceder a la base de datos.
#### Creación de un Usuario (User):
 * Se ha definido un usuario asociado al inicio de sesión.
 * Cada usuario tiene permisos específicos para interactuar con la base de datos.
#### Asignación de Roles:
 * Se ha asignado un rol al usuario.
 * Los roles agrupan permisos y privilegios comunes. Por ejemplo, un rol de ‘Lectura’ podría permitir solo consultas, mientras que un rol de ‘Administrador’ tendría acceso completo.
#### Configuración de Autenticación del Servidor SQL:
 * Se ha modificado la configuración para requerir autenticación mediante nombre de usuario y contraseña al conectarse al servidor SQL.
 * Esto añade una capa adicional de seguridad al proceso de inicio de sesión.


## Automatización de ingesta de datos 
#### Creación del Archivo CSV y Carga Inicial:
 * Se genera un archivo CSV que contiene datos en bruto.
 * Estos datos se cargarán posteriormente en nuestra base de datos SQL.
#### Uso de Tabla Temporal como Puente:
 * Se ejecuta un procedimiento almacenado que ingresa los datos del archivo CSV en una tabla temporal llamada “Players_Stats_temp”. La cual fue creada antes de este paso.
 * Esta tabla temporal actúa como un puente entre los datos brutos y la tabla final deseada.
#### Inserción en la Tabla Principal:
 * A través de otro procedimiento almacenado, los datos de la tabla temporal se transfieren a la tabla “player_stats”.
 * Esta tabla final contiene los datos estructurados y procesados.
#### Limpieza de Datos Temporales:
 * Una vez que los datos están en la tabla deseada, se eliminan los registros de la tabla “Players_Stats_temp”.
 * Esto garantiza que solo los datos relevantes permanezcan en la base de datos.
#### Automatización Mediante Archivo .bat:
 * Para lograr la automatización de este proceso, se crea un archivo .bat.
 * Mediante una tarea programada de Windows, este archivo .bat ejecuta automáticamente los procedimientos almacenados y carga los datos en la base de datos.
Cabe destacar que los datos estadísticos de nuestros jugadores son recibidos semanalmente en una carpeta de Drive. https://docs.google.com/spreadsheets/d/1HcaEjB-oa6wSCyuJGlF29DeCel_hTiL1iWAMN2NekYw/edit?gid=1179889504#gid=1179889504
Estos datos se transforman en un archivo plano en formato CSV, que se almacena en una carpeta especialmente designada para volcar la información en nuestra base de datos SQL. La manipulación de los datos será responsabilidad exclusiva del ingeniero de datos de la consultora.

## Transformación de datos
En Power BI, realizamos diversas transformaciones utilizando SQL Server. Al cambiar el formato de algunas columnas a porcentaje, fue necesario dividir los valores por 10,000, ya que originalmente presentaban cifras muy elevadas. Además, corregimos ciertos errores en los datos, como la presencia de un cero adicional al final de algunos valores en varias columnas. Para solucionar este inconveniente, dividimos esos valores por 10.
También, eliminamos algunas columnas a través de Power Query ya que no serán necesarias para la creación del dashboard y análisis del mismo.


## Creación de medidas para el Dashboard 

Se ha creado una tabla que servirá como contenedor de diversas medidas, entre las cuales se incluyen: puntos recibidos por el equipo como visitante, puntos anotados como local, partidos ganados, partidos perdidos, promedio de victorias y derrotas. Además, se han definido medidas para analizar las asistencias efectivas y la recuperación de rebotes.
Se han creado visualizaciones para graficar las medidas calculadas, incluyendo la importación de un gráfico en Python que muestra la posición de los New York Knicks en comparación con otros equipos de la NBA. Además, se ha diseñado un gráfico de embudo que ilustra las victorias y derrotas tanto de local como de visitante. También se ha generado un gráfico de torta para representar la proporción de partidos ganados y perdidos, así como un gráfico de líneas que muestra los puntos anotados y recibidos por el equipo. Por último, se han incorporado tres medidores para visualizar el rendimiento en tiros de campo, tiros libres y triples.
## Gráficas por jugador 
Se realiza una pagina del dashboard donde se muestra las estadísticas por jugador la cual incluye un gráfico de radar que discrimina 8 medidas estadísticas por jugador, se muestra la imagen del jugador que se selecciona con el slicer, con algunas algunas tarjetas informativas que contienen posición, puntos, salario, edad y número de camiseta del jugador.
## Gráficas comparativa S y PF
Contiene las posiciones c ( Pivot) y PF ( Ala Pívot), esta página contiene tres tarjetas interactivas que muestran las prácticas jugadas,, los minutos jugados y la altura del jugador.
Se hace un gráfico de columnas agrupadas que incluyen rebotes, bloqueos, tiros libres y puntos dobles. La gráfica nos permite comparar  el rendimiento de estas posiciones respecto a estas medidas, adicional se crea una tabla que contiene el nombre de los jugadores, las conversiones, el intento de conversiones y el promedio de estas dos medidas.
## Gráficas comparativa posición PG (base)
Se realiza dos gráficos de columnas agrupadas una contiene la suma de los puntos de dobles y triples, la otra gráfica contiene las pérdidas y robo de balón, también se realizaron dos gráficos de barra agrupadas una de ellas contiene los minutos jugados y los partidos jugados, y la otra contiene la suma de los puntos y las asistencias.
## Gráficas comparativa posición SF (Alero) y SG (EScolta)
Esta contiene dos gráficas de barra agrupadas la primera contiene la suma dobles e intentos de dobles, la otra gráfica contiene la suma de los triples e intento de triples. También se realizó una tabla informativa que contiene el nombre del jugador, el promedio de dobles, el promedio de triples intentados y partidos jugados.
todas las páginas cuentan con slicer interactivos de año, temporada, jugadores, y posiciones. 
# Conclusiones parciales
## Perfil general
Durante la temporada 2021-2022, los Knicks perdieron el 57,33% de sus partidos y ganaron el 42,67%, un rendimiento inferior en comparación con temporadas anteriores donde los partidos ganados fueron más numerosos. Al comparar todas las temporadas y tipos de competencia, se observa que los resultados son bastante equilibrados, con una leve ventaja para los Knicks. Esto indica la necesidad de fortalecer las estrategias de juego para aumentar el número de victorias y lograr una diferencia más significativa en su rendimiento.
El análisis también muestra que las derrotas son más frecuentes cuando el equipo juega como visitante, mientras que han conseguido más victorias como local.
Según las estadísticas de todos los equipos de la NBA, los Knicks se encuentran en una posición intermedia con respecto a los demás equipos, lo cual muestra la necesidad de escalar las posiciones.
En Febrero de la temporada 2022, se registra un aumento abrupto en los puntos recibidos, seguido de una caída significativa. Sin embargo, en noviembre de 2022, vuelve a iniciarse una racha de puntos en contra. Por otro lado, los puntos a favor muestran un inicio lento en la temporada 2022, con un aumento constante hasta marzo de 2023, cuando alcanzan un pico. Posteriormente, hay una caída abrupta en los puntos anotados, lo que podría deberse a una falta de actualización de los datos o a un mal desempeño del equipo.
En cuanto a las estadísticas de tiros puede apreciarse que el fuerte del equipo son los tiros libres y que hay una necesidad de mejorar los tiros de campo y triples.
## Perfil jugadores
# Análisis de Desempeño por Posición
### Posición C (Pivot)
En la posición de Pivot, es fundamental que los jugadores destaquen en bloqueos, rebotes y tiros de campo efectivos, ya que estas habilidades son cruciales para la protección del aro y el dominio en la zona pintada. Al analizar las estadísticas se observa que Isaiah Hartenstein muestra el desempeño más bajo en bloqueos y tiros de campo, lo que sugiere oportunidades de mejora en estos aspectos clave del juego.
### Posición PF (Ala-Pívot)
El jugador de la posición de Ala-Pívot bajo observación es Obi Toppin, cuyas estadísticas reflejan los valores más bajos dentro de su posición. Este desempeño indica que actualmente su contribución en áreas esenciales como rebotes, tiros y bloqueos es limitada, lo cual debe ser evaluado para futuras decisiones estratégicas en la rotación del equipo.
### Posición PG (Base)
El base tiene la responsabilidad de dirigir el ataque del equipo, lo que requiere un excelente manejo del balón, visión de juego y capacidad para tomar decisiones rápidas. En esta posición, se evaluaron asistencias, robos y pérdidas de balón. Miles McBride presenta un bajo número de asistencias, lo que sugiere una falta de participación en la generación ofensiva. En términos de anotaciones, Derrick Rose es quien contribuye menos en cuanto a puntos anotados. Adicionalmente, Ryan Arcidiacono destaca por tener el menor número de robos, mientras que Derrick Rose registra el mayor número de pérdidas, lo que afecta negativamente la estabilidad ofensiva del equipo.
### Posición SF (Alero)
El rol del Alero es ser versátil en la cancha, capaz de contribuir tanto en ataque como en defensa. Este jugador debe equilibrar fuerza y agilidad, con una sólida capacidad para anotar y penetrar al aro. En este análisis, se excluyen a Daniel House y Feron Hunt debido a su participación limitada en los juegos, lo que impacta negativamente sus estadísticas. En cuanto a los jugadores restantes, Kevin Knox se destaca como el que ha realizado menos intentos y tiros convertidos de dobles, lo que indica una baja participación en jugadas ofensivas dentro de la zona de dos puntos. En cuanto a los tiros de tres puntos, Svi Mykhailiuk es el jugador con el menor número de intentos y tiros convertidos, lo que puede ser un indicativo de falta de impacto desde el perímetro en comparación con otros jugadores de su posición.
### Posición SG (Escolta)
El escolta tiene un rol central en la anotación de puntos, particularmente desde el perímetro. Su rendimiento depende de su capacidad para moverse sin el balón y encontrar espacios para tiros efectivos, tanto dobles como triples. En este análisis, es relevante destacar que Damyean Dotson tiene el menor número de tiros dobles y triples convertidos, lo que sugiere que su contribución ofensiva es limitada. Esta falta de efectividad en su principal función como anotador genera la necesidad de revisar su desempeño en los próximos juegos, ya que el equipo depende de una mayor consistencia en esta posición para mantener un ataque fluido y efectivo.
# Conclusiones Generales del Análisis de Desempeño
Isaiah Hartenstein (C) y Obi Toppin (PF) muestran un bajo rendimiento tanto defensivo como ofensivo, lo que plantea la necesidad de mejorar su desempeño o evaluar su continuidad en el equipo.
En la posición de base (PG), Miles McBride, Derrick Rose y Ryan Arcidiacono presentan debilidades en asistencias, puntos y robos, lo que afecta la estabilidad del equipo. Se requiere un análisis detallado para decidir sobre sus contratos.
Kevin Knox (SF) y Svi Mykhailiuk tienen baja efectividad ofensiva, especialmente en tiros de dos puntos y triples. Damyean Dotson (SG) también muestra un bajo rendimiento en anotación, lo que compromete su rol como escolta.
# Recomendaciones para Mejorar las Estrategias de Entrenamiento
Recomendación para la Posición de Pívot:
Se recomienda que el equipo se enfoque en mejorar la práctica de bloqueos, tiros libres y tiros dobles. Estos aspectos son fundamentales para incrementar la eficiencia tanto defensiva como ofensiva en la posición de pívot. Fortalecer la técnica de bloqueos ayudará a proteger el aro de manera más efectiva, mientras que perfeccionar los tiros libres y dobles permitirá capitalizar oportunidades cerca del aro y mejorar la tasa de conversión en situaciones claves del juego. Implementar estas mejoras en los entrenamientos optimizará el rendimiento general del equipo en la zona pintada.
Ala-Pívot (PF):
En esta posición, es fundamental reforzar las técnicas de bloqueo. Los jugadores deben trabajar en su capacidad para leer las jugadas y posicionarse de manera óptima, anticipando los movimientos del rival para realizar bloqueos más efectivos. Se recomienda introducir sesiones de entrenamiento específicas que incluyan prácticas de bloqueo en situaciones de juego real, combinadas con ejercicios de fuerza y agilidad que mejoren el tiempo de reacción y la capacidad de mantener una posición defensiva sólida. La mejora en la eficiencia de los bloqueos no solo protegerá el aro, sino que aumentará las oportunidades de recuperación de balón y la transición rápida al ataque.
Base (PG):
En esta posición, es crucial reducir la proporción de pérdidas respecto a los robos. Actualmente, el equipo pierde el balón un 50% más de lo que lo roba, lo cual afecta directamente la dinámica ofensiva y la estabilidad del equipo. Para fortalecer esta área, se deben implementar entrenamientos enfocados en la protección del balón, toma de decisiones bajo presión, y ejercicios que simulen escenarios de juego con defensas intensas. Además, es importante mejorar la capacidad de los jugadores para anticipar los pases del oponente y realizar robos de balón efectivos, utilizando su visión de juego y velocidad. Un enfoque balanceado entre la mejora en robos y la reducción de pérdidas contribuirá a una mayor eficiencia ofensiva y defensiva.
Alero (SF) y Escolta (SG):
Para las posiciones de Alero y Escolta, es necesario enfocarse en fortalecer la capacidad de conversión en tiros dobles y triples con la menor cantidad de intentos. Esto implica mejorar la precisión de tiro bajo presión y aumentar la confianza de los jugadores en situaciones de juego real. Se recomienda incluir entrenamientos con alto volumen de tiros en condiciones simuladas de fatiga, así como la práctica de selección de tiro, donde los jugadores aprenden a identificar cuándo y desde dónde realizar los tiros más efectivos. El uso de análisis de video para corregir la mecánica de tiro también será clave para mejorar las tasas de conversión. Estas mejoras no solo elevarán el rendimiento ofensivo del equipo, sino que optimizarán el uso de las posesiones y reducirán la ineficacia en ataque.
Mejora General del Equipo:
Es esencial integrar estas recomendaciones en un plan de entrenamiento holístico que combine tanto aspectos técnicos como tácticos. Los entrenadores deben diseñar sesiones que aborden las debilidades individuales y colectivas, mientras fomentan la cohesión del equipo. Además, sería beneficioso incorporar análisis de rendimiento a través de estadísticas avanzadas y herramientas tecnológicas como simulaciones de juego y estudios de movimientos, para personalizar los entrenamientos y maximizar el desarrollo de cada jugador. Evaluar periódicamente los resultados de estos entrenamientos permitirá ajustar las estrategias y mejorar progresivamente la eficiencia del equipo.
Teniendo en cuenta la decisión de los directivos de la franquicia, ya sea para fortalecer los entrenamientos de los jugadores actuales o considerar su reemplazo, es crucial implementar las estrategias sugeridas anteriormente para optimizar el rendimiento del equipo.
En resumen, con un enfoque en mejorar la defensa, reducir las pérdidas, aumentar las conversiones de tiro y optimizar la técnica de bloqueo, el equipo podrá elevar su nivel competitivo de manera significativa. Estos ajustes no sólo fortalecerán el rendimiento individual, sino que impactarán de forma positiva en la cohesión y efectividad del equipo en general. 
El objetivo de estas mejoras es que el equipo supere su balance actual entre victorias y derrotas, logrando más partidos ganados y escalando posiciones en la liga. Al fortalecer bloqueos, tiros, control de balón y rebotes, el equipo aumentará su competitividad y estará mejor posicionado frente a los demás equipos, impulsando su rendimiento general y obteniendo mejores resultados.
## Conclusión General
El equipo se encuentra en una posición media en victorias y derrotas. El análisis revela que deben mejorar en defensa, reducir pérdidas de balón y optimizar sus tiros. Los pívots deben enfocarse en bloqueos, mientras que los bases deben hacerlo en el control del balón. Fortalecer estas áreas y la cohesión del equipo les permitirá ascender en la clasificación de la liga.
## Estrategia Propuesta
Se recomienda desarrollar un plan de entrenamiento integral que contemple sesiones específicas dedicadas a las áreas críticas identificadas, incluyendo ejercicios de defensa, control de balón, técnicas de tiro y bloqueos. Esto permitirá a los jugadores adquirir habilidades clave y mejorar su desempeño en los partidos.
## Recomendación
Es crucial evaluar periódicamente el progreso de los jugadores y realizar ajustes en el enfoque de entrenamiento según sea necesario. Además, considerar la posibilidad de incorporar nuevos talentos que se alineen con la visión del equipo puede ser clave para optimizar el rendimiento general y lograr una escalabilidad relevante en las victorias sobre las derrotas.


