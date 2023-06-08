import os
import sys
import pendulum
from datetime import timedelta
import airflow
from airflow import DAG
sys.path.insert(0, os.path.abspath(os.path.dirname(__file__)))
from tasks import DBT_0
PROPHECY_RELEASE_TAG = "__PROJECT_ID_PLACEHOLDER__/__PROJECT_RELEASE_VERSION_PLACEHOLDER__"

with DAG(
    dag_id = "UURTrn1LebJgGxdga3v_Dw_", 
    schedule_interval = "0 0 * * 4", 
    default_args = {"owner" : "Prophecy", "ignore_first_depends_on_past" : True, "pool" : "rHDsxIjo", "do_xcom_push" : True}, 
    start_date = pendulum.today('UTC'), 
    end_date = pendulum.datetime(2023, 6, 23, tz = "UTC"), 
    catchup = True
) as dag:
    DBT_0_op = DBT_0()
