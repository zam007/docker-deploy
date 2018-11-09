use `scheduler`;

select job_id into @jobId from t_c_job where job_name = 'PaymentRollback';
delete from `t_c_job` where job_id = @jobId;

delete from t_c_task where task_name = 'PaymentRollbackTask';
delete from t_c_job_tasks where job_id = @jobId;