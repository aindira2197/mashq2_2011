categories(
    id,
    name,
    description,
    parent_id,      -- asosiy kategoriya bo‘lsa NULL
    created_at
)

SELECT name, description
FROM categories
WHERE parent_id IS NULL;

SELECT parent_id AS main_category_id,
       COUNT(*) AS subcategory_count
FROM categories
WHERE parent_id IS NOT NULL
GROUP BY parent_id;

SELECT c1.id AS main_category_id,
       c1.name AS main_category_name,
       COUNT(c2.id) AS subcategory_count
FROM categories c1
LEFT JOIN categories c2 ON c1.id = c2.parent_id
WHERE c1.parent_id IS NULL
GROUP BY c1.id, c1.name;
