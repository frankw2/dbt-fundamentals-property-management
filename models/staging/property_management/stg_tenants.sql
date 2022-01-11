select
    lease_id,
    id as tenant_id,
    contact_info_id,
    bank_account_id,
    move_in_date

from {{ source('property_management', 'tenants')}}
