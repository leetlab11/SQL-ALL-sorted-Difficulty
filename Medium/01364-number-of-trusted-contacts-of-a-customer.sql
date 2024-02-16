-- simple aggregate for count of contacts
-- for trusted contacts, pick only those which are present in Customer table using CASE

select i.invoice_id, cm.customer_name, i.price, count(ct.contact_name) as contacts_cnt,
    sum(case when contact_name in (select customer_name
                                   from Customers) then 1 else 0 end) as trusted_contacts_cnt
from Invoices i
left join Customers cm
on i.user_id = cm.customer_id
left join Contacts ct
on cm.customer_id = ct.user_id
group by 1
order by 1

-- roblox- 1
