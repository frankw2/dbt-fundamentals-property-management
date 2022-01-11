with vendors as (
    select * from {{ ref('dim_vendors')}}
)

select
    count(*) as num
from vendors where bank_account_number = routing_number
having num > 0