with rental_applications as (
    select * from {{ ref('stg_rental_applications')}}
),

tenants as (
    select * from {{ ref('dim_tenants')}}
),

leases as (
    select * from {{ ref('stg_leases')}}
),

completed_leases as (
    select 
        rental_applications.contact_info_id,
        leases.lease_id,
        leases.unit_id,
        leases.start_date,
        leases.end_date
    
    from rental_applications

    left join leases using (rental_application_id)

    where leases.completed = 'true'

),

final as (
    select
        completed_leases.unit_id,
        completed_leases.start_date,
        completed_leases.end_date,
        tenants.first_name,
        tenants.last_name,
        tenants.email_address,
        tenants.phone_number,
        tenants.name,
        tenants.bank_account_number,
        tenants.routing_number
    
    from completed_leases

    left join tenants using (lease_id)
)

select * from final