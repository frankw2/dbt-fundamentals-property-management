with emails as (
    select * from {{ ref('stg_emails')}}
),

delivered_emails as (
    select * from {{ ref('stg_email_delivery_statuses')}} where event = 'delivered'
),

final as (

    select 
        emails.email_id,
        emails.subject,
        emails.body,
        emails.delivered_at,
        delivered_emails.event
    
    from delivered_emails

    left join emails using (email_id)

)

select * from final