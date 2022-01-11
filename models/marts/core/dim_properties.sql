with properties as (
    select * from {{ ref('stg_properties')}}
),

property_owners as (
    select * from {{ ref('stg_property_owners')}}
),

units as (
    select * from {{ ref('stg_units')}}
),

final as (
    select
        properties.name,
        properties.address,
        properties.city,
        properties.state,
        properties.zip_code,
        properties.type,
        properties.year_built,
        property_owners.owner_id,
        units.unit_id,
        units.rent,
        units.square_feet,
        units.bedrooms,
        units.bathrooms,
        units.status

    from properties
    
    left join property_owners using(property_id)

    left join units using(property_id)

)

select * from final