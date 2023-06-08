

{% set v_snow_int = 11 %}

WITH ALL_TYPE_TABLE_SMALLER_1 AS (

  SELECT * 
  
  FROM {{ source('QA_DATABASE.QA_SIMPLE_SCHEMA', 'ALL_TYPE_TABLE_SMALLER_1') }}

),

ALL_TYPE_TABLE_NON_GEOMETRY AS (

  SELECT * 
  
  FROM {{ source('QA_DATABASE.QA_SCHEMA', 'ALL_TYPE_TABLE_NON_GEOMETRY') }}

),

goods_classification_snowflake_master AS (

  SELECT * 
  
  FROM {{ ref('goods_classification_snowflake_master')}}

),

Join_1 AS (

  SELECT 
    in0.C_NUM AS C_NUM,
    in0.C_NUM10 AS C_NUM10,
    in0.C_DEC AS C_DEC,
    in0.C_NUMERIC AS C_NUMERIC,
    in0.C_INT AS C_INT,
    in0.C_INTEGER AS C_INTEGER,
    in0.C_DOUBLE AS C_DOUBLE,
    in0.C_FLOAT AS C_FLOAT,
    in0.C_COUBLE_PRECISION AS C_COUBLE_PRECISION,
    in0.C_REAL AS C_REAL,
    in0.C_VARCHAR AS C_VARCHAR,
    in0.C_VARCHAR50 AS C_VARCHAR50,
    in0.C_CHAR AS C_CHAR,
    in0.C_CHAR10 AS C_CHAR10,
    in0.C_STRING AS C_STRING,
    in0.C_STRING20 AS C_STRING20,
    in0.C_TEXT AS C_TEXT,
    in0.C_TEXT30 AS C_TEXT30,
    in0.C_BINARY AS C_BINARY,
    in0.C_BINARY100 AS C_BINARY100,
    in0.C_VARBINARY AS C_VARBINARY,
    in0.C_BOOL AS C_BOOL,
    in0.C_TIMESTAMP AS C_TIMESTAMP,
    in0.C_DATE AS C_DATE,
    in0.C_DATETIME AS C_DATETIME,
    in0.C_TIME AS C_TIME,
    in0.C_TIMESTAMPLTZ AS C_TIMESTAMPLTZ,
    in0.C_TIMESTAMP_NTZ AS C_TIMESTAMP_NTZ,
    in0.C_VARIANT AS C_VARIANT,
    in0.C_ARRAY AS C_ARRAY,
    in0.C_OBJECT AS C_OBJECT,
    in0.C_GEOGRAPHY AS C_GEOGRAPHY
  
  FROM ALL_TYPE_TABLE_NON_GEOMETRY AS in0
  INNER JOIN ALL_TYPE_TABLE_SMALLER_1 AS in1
     ON in0.c_num != in1.c_num
  INNER JOIN goods_classification_snowflake_master AS in2
     ON in1.c_num != in2.NZHSC_Level_2_Code_HS4

),

Limit_1 AS (

  SELECT * 
  
  FROM Join_1 AS in0
  
  LIMIT 10

),

Reformat_1 AS (

  SELECT 
    C_NUM AS C_NUM,
    C_NUM10 AS C_NUM10,
    C_DEC AS C_DEC,
    C_NUMERIC AS C_NUMERIC,
    C_INT + {{v_snow_int}} + {{ var('v_project_snow_int')}} AS C_INT,
    C_INTEGER AS C_INTEGER,
    C_DOUBLE AS C_DOUBLE,
    C_FLOAT AS C_FLOAT,
    C_COUBLE_PRECISION AS C_COUBLE_PRECISION,
    C_REAL AS C_REAL,
    C_VARCHAR AS C_VARCHAR,
    C_VARCHAR50 AS C_VARCHAR50,
    C_CHAR AS C_CHAR,
    C_CHAR10 AS C_CHAR10,
    C_STRING AS C_STRING,
    C_STRING20 AS C_STRING20,
    C_TEXT AS C_TEXT,
    C_TEXT30 AS C_TEXT30,
    C_BINARY AS C_BINARY,
    C_BINARY100 AS C_BINARY100,
    C_VARBINARY AS C_VARBINARY,
    C_BOOL AS C_BOOL,
    C_TIMESTAMP AS C_TIMESTAMP,
    C_DATE AS C_DATE,
    C_DATETIME AS C_DATETIME,
    C_TIME AS C_TIME,
    C_TIMESTAMPLTZ AS C_TIMESTAMPLTZ,
    C_TIMESTAMP_NTZ AS C_TIMESTAMP_NTZ,
    C_VARIANT AS C_VARIANT,
    C_ARRAY AS C_ARRAY,
    C_OBJECT AS C_OBJECT,
    C_GEOGRAPHY AS C_GEOGRAPHY
  
  FROM Limit_1 AS in0

),

qa_all_not_null_snow_1 AS (

  {{ SQL_SnowflakeMain.qa_all_not_null_snow(model = 'Reformat_1', column_name = 'C_STRING') }}

)

SELECT *

FROM qa_all_not_null_snow_1