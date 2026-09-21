```sql
-- E-commerce Campaign Analysis
-- SQL Query Examples
-- Portfolio / Educational Project

/*
Assumed database structure:

CUSTOMERS
- CustomerId
- CustomerName
- SegmentId
- Status

SEGMENTS
- SegmentId
- SegmentName
- Status

CAMPAIGNS
- CampaignId
- CampaignName
- SegmentId
- DiscountRate
- StartDate
- EndDate
- Status
*/


-- 1. Aktif kampanyaları listeleme
-- Amaç: E-ticaret sisteminde aktif olan kampanyaları görüntülemek.

SELECT
    CampaignId,
    CampaignName,
    DiscountRate,
    StartDate,
    EndDate,
    Status
FROM CAMPAIGNS
WHERE Status = 'ACTIVE';


-- 2. Belirli bir müşteri segmentine ait kampanyaları listeleme
-- Amaç: Bir segment için tanımlanan kampanyaları kontrol etmek.

SELECT
    CampaignId,
    CampaignName,
    SegmentId,
    DiscountRate,
    StartDate,
    EndDate
FROM CAMPAIGNS
WHERE SegmentId = 15;


-- 3. Aktif müşteri segmentlerini listeleme
-- Amaç: Kampanya oluşturulurken kullanılabilecek aktif segmentleri kontrol etmek.

SELECT
    SegmentId,
    SegmentName,
    Status
FROM SEGMENTS
WHERE Status = 'ACTIVE';


-- 4. Bir segmentteki aktif müşteri sayısını bulma
-- Amaç: Kampanyanın hedeflediği segmentte kaç aktif müşteri olduğunu görmek.

SELECT
    SegmentId,
    COUNT(*) AS ActiveCustomerCount
FROM CUSTOMERS
WHERE Status = 'ACTIVE'
GROUP BY SegmentId;


-- 5. Segment adı ile birlikte kampanyaları listeleme
-- Amaç: Kampanyanın hangi müşteri segmentine ait olduğunu daha okunabilir şekilde göstermek.

SELECT
    C.CampaignId,
    C.CampaignName,
    S.SegmentName,
    C.DiscountRate,
    C.StartDate,
    C.EndDate,
    C.Status
FROM CAMPAIGNS C
INNER JOIN SEGMENTS S
    ON C.SegmentId = S.SegmentId;


-- 6. Geçersiz indirim oranına sahip kampanyaları kontrol etme
-- Amaç: Business rule kontrolü yapmak.
-- İndirim oranı 0 ile 100 arasında olmalıdır.

SELECT
    CampaignId,
    CampaignName,
    DiscountRate
FROM CAMPAIGNS
WHERE DiscountRate < 0
   OR DiscountRate > 100;


-- 7. Tarih bilgisi hatalı kampanyaları kontrol etme
-- Amaç: EndDate değerinin StartDate değerinden önce olup olmadığını kontrol etmek.

SELECT
    CampaignId,
    CampaignName,
    StartDate,
    EndDate
FROM CAMPAIGNS
WHERE EndDate < StartDate;


/*
BA Perspective:

Bu sorgular ile;

- Kampanya verileri kontrol edilir.
- Müşteri segmentleri analiz edilir.
- Kampanya ve segment ilişkisi incelenir.
- Business rule kontrolleri yapılır.
- Test sırasında veri doğrulaması desteklenir.
- Gerektiğinde geliştirici/QA ekibine veri analizi konusunda destek sağlanabilir.
*/
```
