with transactions as (
    select * from {{ ref('fct_total_transactions')}}
)

select
    num
from transactions where num <= 0