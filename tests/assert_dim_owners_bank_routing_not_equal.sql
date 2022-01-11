with owners as (
    select * from {{ ref('dim_owners')}}
)

select
    count(*) as num
from owners where bank_account_number = routing_number
having num > 0