with emails_delivered as (
    select * from {{ ref('fct_emails_delivered')}}
)

select
    count(*) as num
from emails_delivered where event = 'delivered'
having num < 0