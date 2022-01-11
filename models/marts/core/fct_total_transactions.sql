with transactions as (
    select * from {{ ref('stg_transactions')}}
),

payments as (
    select * from {{ ref('stg_payments')}}
),

final as (
    select
        COUNT(*)
    from transactions

    left join payments
)

select * from final