WITH goods_classification_snowflake_master AS (

  SELECT * 
  
  FROM {{ ref('goods_classification_snowflake_master')}}

),

TABLE_COMPLEX_TYPES_1 AS (

  SELECT * 
  
  FROM {{ source('QA_DATABASE.QA_SIMPLE_SCHEMA', 'TABLE_COMPLEX_TYPES_1') }}

),

TABLE_COMPLEX_TYPES AS (

  SELECT * 
  
  FROM {{ source('QA_DATABASE.QA_SIMPLE_SCHEMA', 'TABLE_COMPLEX_TYPES') }}

),

Join_2 AS (

  SELECT 
    in0.C_ARRAY_INT AS C_ARRAY_INT,
    in0.C_ARRAY_FLOAT AS C_ARRAY_FLOAT,
    in0.C_ARRAY_STRING AS C_ARRAY_STRING,
    in0.C_ARRAY_OBJECT AS C_ARRAY_OBJECT,
    in0.C_ARRAY_ARRAY AS C_ARRAY_ARRAY,
    in0.C_ARRAY_VARIANT AS C_ARRAY_VARIANT,
    in0.C_OBJECT_1 AS C_OBJECT_1,
    in0.C_OBJECT_2 AS C_OBJECT_2,
    in0.C_OBJECT_3 AS C_OBJECT_3,
    in0.C_OBJECT_4 AS C_OBJECT_4,
    in0.C_OBJECT_5 AS C_OBJECT_5,
    in0.C_VARIANT_1 AS C_VARIANT_1,
    in1.C_VARIANT_2 AS C_VARIANT_2,
    in1.C_VARIANT_3 AS C_VARIANT_3
  
  FROM TABLE_COMPLEX_TYPES AS in0
  INNER JOIN TABLE_COMPLEX_TYPES_1 AS in1
     ON in0.C_ARRAY_STRING[0] != in1.C_ARRAY_STRING[1]

),

test_snowflake_main_model_1 AS (

  SELECT * 
  
  FROM {{ ref('test_snowflake_main_model_1')}}

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
  
  FROM test_snowflake_main_model_1 AS in0
  INNER JOIN goods_classification_snowflake_master AS in1
     ON in0.C_STRING != in1.Status_HS4
  INNER JOIN Join_2 AS in2
     ON in1.Status_HS4 != in2.C_ARRAY_STRING[0]

)

SELECT *

FROM Join_1