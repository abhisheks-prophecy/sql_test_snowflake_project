def DBT_0():
    settings = {}
    from datetime import timedelta
    from airflow.operators.bash import BashOperator
    envs = {}
    envs["DBT_WARN_ERROR"] = "true"
    envs["DBT_PARTIAL_PARSE"] = "false"
    envs["DBT_PROFILES_DIR"] = ""
    envs["DBT_FULL_REFRESH"] = "true"

    return BashOperator(
        task_id = "DBT_0",
        bash_command = "set -euxo pipefail; tmpDir=`mktemp -d`; git clone https://github.com/abhisheks-prophecy/sql_test_snowflake_project --branch main --single-branch $tmpDir; cd $tmpDir/; dbt deps --profile ; dbt seed --profile  --exclude test_exclude_me; dbt run --profile  --exclude test_exclude_me; ",
        env = envs,
        append_env = True,
        **settings
    )
