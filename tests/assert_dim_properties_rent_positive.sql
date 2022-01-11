with properties as (
    select * from {{ ref('dim_properties')}}
)

select
    count(*) as num
from properties where rent <= 0
having num > 0