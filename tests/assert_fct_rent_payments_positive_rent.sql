with rent_payments as (
    select * from {{ ref('fct_rent_payments')}}
)

select
    count(*) as num
from rent_payments where rent <= 0
having num > 0