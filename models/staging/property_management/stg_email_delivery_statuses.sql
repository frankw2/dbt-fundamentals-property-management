select
    created_at,
    event,
    email_id

from {{ source('property_management', 'email_delivery_statuses')}}
