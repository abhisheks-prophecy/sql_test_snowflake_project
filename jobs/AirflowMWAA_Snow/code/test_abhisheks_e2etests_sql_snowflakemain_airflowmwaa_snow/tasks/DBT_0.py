def DBT_0():
    from datetime import timedelta
    from airflow.operators.bash import BashOperator

    return BashOperator(
        task_id = "DBT_0",
        bash_command = "set -euxo pipefail; tmpDir=`mktemp -d`; git clone https://github.com/abhisheks-prophecy/sql_test_snowflake_project --branch main --single-branch $tmpDir; cd $tmpDir/; dbt deps --profile run_profile_snowflake; dbt seed --profile run_profile_snowflake --exclude test_exclude_me; dbt run --profile run_profile_snowflake --exclude test_exclude_me; ",
        env = {
          "DBT_WARN_ERROR": "true", 
          "DBT_PARTIAL_PARSE": "false", 
          "DBT_PROFILES_DIR": "/usr/local/airflow/dags", 
          "DBT_FULL_REFRESH": "true"
        },
        append_env = True,
    )
