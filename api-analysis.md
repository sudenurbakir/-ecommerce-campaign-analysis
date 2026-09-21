# API Analysis

## 1. API Integration Overview

CRM sisteminde oluşturulan kampanya bilgilerinin e-ticaret sistemine aktarılması için REST API kullanılmaktadır.

Temel veri akışı:

```text
CRM
 ↓
POST /api/campaigns
 ↓
E-Commerce API
 ↓
Campaign Created
```

API üzerinden gönderilecek temel bilgiler:

* Kampanya adı
* Müşteri segmenti
* İndirim oranı
* Başlangıç tarihi
* Bitiş tarihi

---

## 2. Create Campaign API

### Endpoint

```http
POST /api/campaigns
```

### Purpose

CRM'de oluşturulan kampanya bilgilerinin e-ticaret sisteminde oluşturulmasını sağlar.

### Request Headers

```http
Content-Type: application/json
```

### Request Body

```json
{
  "campaignName": "VIP Cilt Bakımı Kampanyası",
  "segmentId": 15,
  "discountRate": 20,
  "startDate": "2026-10-01",
  "endDate": "2026-10-15"
}
```

---

## 3. Successful Response

Kampanya başarıyla oluşturulduğunda e-ticaret sistemi aşağıdaki gibi bir response döndürebilir:

```json
{
  "campaignId": 1024,
  "campaignName": "VIP Cilt Bakımı Kampanyası",
  "status": "ACTIVE",
  "message": "Campaign created successfully"
}
```

### HTTP Status

```text
201 Created
```

---

## 4. Validation Errors

### Missing Campaign Name

Kampanya adı gönderilmediğinde:

```json
{
  "errorCode": "CAMPAIGN_NAME_REQUIRED",
  "message": "Campaign name is required"
}
```

HTTP Status:

```text
400 Bad Request
```

### Invalid Discount Rate

İndirim oranı 100'den büyük olduğunda:

```json
{
  "errorCode": "INVALID_DISCOUNT_RATE",
  "message": "Discount rate must be between 0 and 100"
}
```

HTTP Status:

```text
400 Bad Request
```

### Invalid Segment

Gönderilen müşteri segmenti bulunamadığında:

```json
{
  "errorCode": "SEGMENT_NOT_FOUND",
  "message": "Customer segment not found"
}
```

HTTP Status:

```text
404 Not Found
```

---

## 5. API Error Handling

E-ticaret sistemi beklenmeyen bir hata döndürdüğünde:

```json
{
  "errorCode": "INTERNAL_SERVER_ERROR",
  "message": "An unexpected error occurred"
}
```

HTTP Status:

```text
500 Internal Server Error
```

Bu durumda kampanya aktarımı başarısız olarak işaretlenmeli ve hata bilgisi kayıt altına alınmalıdır.

---

## 6. API Test Scenarios

| ID      | Test                                   | Beklenen Sonuç              |
| ------- | -------------------------------------- | --------------------------- |
| API-001 | Geçerli kampanya gönderilir            | `201 Created`               |
| API-002 | Kampanya adı boş gönderilir            | `400 Bad Request`           |
| API-003 | İndirim oranı 100'den büyük gönderilir | `400 Bad Request`           |
| API-004 | Geçersiz segment gönderilir            | `404 Not Found`             |
| API-005 | Sunucu hatası oluşur                   | `500 Internal Server Error` |

---

## 7. Postman Test Approach

API testleri Postman kullanılarak gerçekleştirilebilir.

Test sırasında aşağıdaki kontroller yapılır:

* HTTP method kontrolü
* Endpoint kontrolü
* Request body kontrolü
* Response status code kontrolü
* Response body kontrolü
* Validation error kontrolü
* Başarılı ve başarısız senaryoların doğrulanması

### Example Request

```http
POST /api/campaigns
Content-Type: application/json
```

### Expected Result

```text
HTTP 201 Created
Campaign successfully created
```

---

## 8. Business Analyst Perspective

İş analisti açısından API analizinde aşağıdaki noktalar önemlidir:

* Hangi sistem hangi sisteme veri gönderiyor?
* Hangi veriler gönderiliyor?
* Verilerin formatı nedir?
* Hangi HTTP method kullanılacak?
* Başarılı işlemde hangi response dönmeli?
* Hatalı durumda hangi hata mesajı dönmeli?
* Hangi durumlarda işlem başarısız kabul edilmeli?

Bu bilgiler geliştirme ve test ekipleriyle paylaşılacak teknik gereksinimlerin oluşturulmasında kullanılır.
