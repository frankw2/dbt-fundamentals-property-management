with tenants as (
    select * from {{ ref('dim_tenants')}}
),

leases as (
    select * from {{ ref('stg_leases')}}
),

units as (
    select * from {{ ref('stg_units')}}
),

transactions as (
    select * from {{ ref('stg_transactions')}}
),

payments as (
    select
    
    SUBSTRING(payer, 1, CHARINDEX(' ', payer) - 1) as first_name, 
    SUBSTRING(payer, CHARINDEX(' ', payer) + 1, LEN(payer)) as last_name,
    SUM(amount) as amount
    
    from transactions where type = 'charge'
    
    group by payer
),

tenants_leases as (
    select
        tenants.tenant_id,
        tenants.first_name,
        tenants.last_name,
        tenants.email_address,
        tenants.phone_number,
        tenants.name,
        tenants.bank_account_number,
        tenants.routing_number,
        leases.start_date,
        leases.end_date,
        units.address_1,
        units.address_2,
        units.city,
        units.state,
        units.zip_code,
        units.rent
    
    from tenants

    left join leases using (lease_id)
    left join units using (unit_id)
),

final as (
    select

        tenants_leases.tenant_id,
        tenants_leases.first_name,
        tenants_leases.last_name,
        payments.amount,
        tenants_leases.email_address,
        tenants_leases.phone_number,
        tenants_leases.name,
        tenants_leases.bank_account_number,
        tenants_leases.routing_number,
        tenants_leases.start_date,
        tenants_leases.end_date,
        tenants_leases.address_1,
        tenants_leases.address_2,
        tenants_leases.city,
        tenants_leases.state,
        tenants_leases.zip_code,
        tenants_leases.rent
    
    from payments
    
    left join tenants_leases on tenants_leases.first_name = payments.first_name and tenants_leases.last_name = payments.last_name
)

select * from final