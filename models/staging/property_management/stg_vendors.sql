select

    id as vendor_id,
    contact_info_id,
    bank_account_id

from {{ source('property_management', 'vendors')}}