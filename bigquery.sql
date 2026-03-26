
-- =============================================
-- TOOL: Google BigQuery
-- DATABASE: lh-ng-cms-prod
-- PURPOSE: Sales & Outlet Analytics
-- =============================================


-- -----------------------------------------------
-- Query 1: Sales by All Criteria (July 2022)
-- Returns daily sales breakdown by region,
-- territory, outlet and products delivered
-- -----------------------------------------------
SELECT
    CAST(createdAt AS DATE) AS date,
    cluster_region_name AS region,
    cluster_territory_name AS territory,
    cluster_region_id,
    cluster_name,
    outlet_id,
    outlet_name,
    retailer_id,
    retailer_name,
    fsa_name,
    productsDelivered_classic,
    productsDelivered_supafixc0,
    productsDelivered_supafixc1,
    productsDelivered_supaset,
    statusHistory_fulfilled
FROM `lh-ng-cms-prod.firestore_export_orders.orders_schema_bigquery_schema_orders_latest`
WHERE createdAt BETWEEN "2022-07-01" AND "2022-07-30"
ORDER BY createdAt ASC;


-- -----------------------------------------------
-- Query 2: Geo-Tag & Geo-Fence Confirmation
-- Returns active outlet locations with
-- coordinates for geo-fencing validation
-- -----------------------------------------------
SELECT
    CAST(createdAt AS DATE) AS date,
    cluster_region_name,
    cluster_territory_name,
    cluster_name,
    sop_name,
    fsa_name,
    retailer_id,
    retailer_name,
    retailer_phone,
    name AS outlet_name,
    location_geohash,
    location_lat,
    location_lng
FROM `lh-ng-cms-prod.firestore_export_outlets.outlets_schema_bigquery_schema_outlets_latest`
WHERE active = TRUE;


-- -----------------------------------------------
-- Query 3: Retailers by Chatbot & Chatbot Sales
-- Tracks chatbot adoption and sales activity
-- per retailer across May - August 2022
-- -----------------------------------------------
SELECT
    CAST(createdAt AS DATE) AS date,
    cluster_region_name AS region,
    cluster_territory_name AS territory,
    cluster_region_id,
    cluster_name,
    outlet_name,
    retailer_id,
    retailer_name,
    fsa_name,
    productsDelivered_classic,
    productsDelivered_supaset,
    status,
    createdBy_phone,
    createdBy_roles_member,
    retailer_hasInteracted,
    retailer_chatbotTOSAccepted,
    createdOn
FROM `lh-ng-cms-prod.firestore_export_orders.orders_schema_bigquery_schema_orders_latest`
WHERE createdAt BETWEEN "2022-05-01" AND "2022-08-31"
ORDER BY createdAt ASC;
