with stg_products as (
     select * from {{ source('northwind','Products')}}
),
stg_categories as (
select * from {{ source('northwind','Categories')}}
)


select productid,
    {{ dbt_utils.generate_surrogate_key(['productid']) }} as productkey, 
    productname,
    {{ dbt_utils.generate_surrogate_key(['supplierid']) }} as supplierkey,
    CategoryName,
    Description from
    stg_categories c join stg_products p on c.CategoryID = p.CategoryID

