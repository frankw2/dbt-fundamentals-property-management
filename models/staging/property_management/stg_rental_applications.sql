select 
    id as rental_application_id,
    status,
    contact_info_id

from {{ source('property_management', 'rental_applications')}}
