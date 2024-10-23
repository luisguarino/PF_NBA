--Usuario para Matias

CREATE LOGIN Matias_LP
WITH PASSWORD = 'NBASPORTICS';

USE Sportics_LAM;
CREATE USER Sportics_LAM 
FOR LOGIN Sportics_LAM;

ALTER ROLE db_owner 
ADD MEMBER Sportics_LAM


CREATE USER Matias_LP
For login Matias_LP

ALTER ROLE db_owner 
ADD MEMBER Matias_LP

--Usuario para Angelica

CREATE LOGIN Angelica_SM
WITH PASSWORD = 'NBASPORTICS';

CREATE USER Angelica_SM
FOR LOGIN Angelica_SM;

ALTER ROLE db_owner 
ADD MEMBER Angelica_SM

--Usuario para Luis

CREATE LOGIN Luis_G
WITH PASSWORD = 'NBASPORTICS';

CREATE USER Luis_G
FOR LOGIN Luis_G;

ALTER ROLE db_owner 
ADD MEMBER Luis_G

--Usuario para Mariana

CREATE LOGIN Mariana_P
WITH PASSWORD = 'NBASPORTICS';

CREATE USER Mariana_P
FOR LOGIN Mariana_P

ALTER ROLE db_owner 
ADD MEMBER Mariana_P

--Ver los usuarios y los roles asignados

SELECT 
    DP1.name AS Usuario,
    DP2.name AS Rol_Base_Datos
FROM 
    sys.database_role_members AS DRM
    INNER JOIN sys.database_principals AS DP1 ON DRM.member_principal_id = DP1.principal_id
    INNER JOIN sys.database_principals AS DP2 ON DRM.role_principal_id = DP2.principal_id
ORDER BY DP1.name;

-- Ver los Logins
SELECT 
    name AS LoginName,
    type_desc AS LoginType
FROM 
    sys.server_principals
WHERE 
    type IN ('S', 'U') -- S = SQL user, U = Windows user
ORDER BY 
    name;

	
	drop user Matias_LP
	drop login Matias_LP 