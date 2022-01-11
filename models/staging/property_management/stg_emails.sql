select
    id as email_id,
    subject,
    body,
    delivered_at

from {{source('property_management', 'emails')}}