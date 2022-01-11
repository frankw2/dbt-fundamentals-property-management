select
    property_id,
    owner_id

from {{ source('property_management', 'property_owners')}}