with tenants as (
    select * from {{ ref('dim_tenants')}}
)

select
    count(*) as num
from tenants where bank_account_number = routing_number
having num > 0