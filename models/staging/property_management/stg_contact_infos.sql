select 
    id as contact_info_id,
    first_name,
    last_name,
    email_address,
    phone_number

from {{ source('property_management', 'contact_infos')}}