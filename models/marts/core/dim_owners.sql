with bank_accounts as (
    select * from {{ ref('stg_bank_accounts')}}
),

contact_infos as (
    select * from {{ ref('stg_contact_infos')}}
),

owners as (
    select * from {{ ref('stg_owners')}}
),

final as (
    select 
        owners.owner_id,
        contact_infos.first_name,
        contact_infos.last_name,
        contact_infos.email_address,
        contact_infos.phone_number,
        bank_accounts.name,
        bank_accounts.bank_account_number,
        bank_accounts.routing_number

    from owners

    left join contact_infos using(contact_info_id)

    left join bank_accounts using(bank_account_id)
)

select * from final