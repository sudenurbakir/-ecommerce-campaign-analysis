# Test Cases

## 1. Test Senaryoları

| Test ID | Senaryo                    | Ön Koşul                | Test Adımı                                       | Beklenen Sonuç                                                            | Sonuç |
| ------- | -------------------------- | ----------------------- | ------------------------------------------------ | ------------------------------------------------------------------------- | ----- |
| TC-001  | Geçerli kampanya oluşturma | Aktif segment mevcut    | Geçerli kampanya bilgileri girilir ve kaydedilir | Kampanya başarıyla oluşturulur                                            | Pass  |
| TC-002  | Kampanya adı boş bırakma   | CRM ekranı açık         | Kampanya adı girilmeden kayıt yapılır            | Sistem zorunlu alan uyarısı gösterir                                      | Pass  |
| TC-003  | Geçersiz indirim oranı     | CRM ekranı açık         | %101 indirim girilir                             | Sistem hata mesajı gösterir                                               | Pass  |
| TC-004  | Geçersiz tarih aralığı     | CRM ekranı açık         | Bitiş tarihi başlangıç tarihinden önce seçilir   | Sistem kampanyanın kaydedilmesine izin vermez                             | Pass  |
| TC-005  | Başarılı API aktarımı      | Geçerli kampanya mevcut | Kampanya API üzerinden gönderilir                | API 201 response döner ve kampanya e-ticarete aktarılır                   | Pass  |
| TC-006  | API aktarım hatası         | API erişilebilir        | Hatalı istek gönderilir                          | Hata response'u alınır ve kampanya "Aktarım Başarısız" olarak işaretlenir | Pass  |
| TC-007  | Geçersiz segment           | Segment mevcut değil    | Geçersiz segment ID ile istek gönderilir         | API 404 response döner                                                    | Pass  |

---

## 2. API Test Senaryoları

### API-001 — Başarılı Kampanya Oluşturma

**Request**

```json
{
  "campaignName": "VIP Cilt Bakımı Kampanyası",
  "segmentId": 15,
  "discountRate": 20,
  "startDate": "2026-10-01",
  "endDate": "2026-10-15"
}
```

**Expected Response**

```text
HTTP 201 Created
```

**Expected Result:**

Kampanya e-ticaret sisteminde oluşturulur ve başarılı aktarım olarak işaretlenir.

---

### API-002 — Eksik Kampanya Adı

**Test Data**

```json
{
  "campaignName": "",
  "segmentId": 15,
  "discountRate": 20,
  "startDate": "2026-10-01",
  "endDate": "2026-10-15"
}
```

**Expected Response**

```text
HTTP 400 Bad Request
```

**Expected Result:**

Kampanya oluşturulmaz ve zorunlu alan hatası döndürülür.

---

### API-003 — Geçersiz İndirim Oranı

**Test Data**

```json
{
  "campaignName": "Test Kampanyası",
  "segmentId": 15,
  "discountRate": 120,
  "startDate": "2026-10-01",
  "endDate": "2026-10-15"
}
```

**Expected Response**

```text
HTTP 400 Bad Request
```

**Expected Result:**

Kampanya oluşturulmaz ve indirim oranının geçersiz olduğu belirtilir.

---

## 3. UAT Senaryoları

UAT, geliştirilen fonksiyonun iş biriminin ihtiyacını karşılayıp karşılamadığını kontrol etmek amacıyla gerçekleştirilir.

| UAT ID  | İş Senaryosu                                                           | Beklenen Sonuç                                          |
| ------- | ---------------------------------------------------------------------- | ------------------------------------------------------- |
| UAT-001 | Pazarlama uzmanı aktif bir müşteri segmenti için kampanya oluşturur    | Kampanya başarılı şekilde oluşturulur                   |
| UAT-002 | Oluşturulan kampanyanın e-ticaret sistemine aktarılması kontrol edilir | Kampanya doğru bilgilerle aktarılmış olur               |
| UAT-003 | Hatalı kampanya bilgilerinin sisteme gönderilmesi denenir              | Sistem hatayı gösterir ve kampanyayı aktarmadan bırakır |

---

## 4. Hata Raporlama

Test sırasında hata bulunması durumunda aşağıdaki bilgiler kayıt altına alınır:

* Hata başlığı
* Test ID
* Hatanın açıklaması
* Tekrar oluşturma adımları
* Beklenen sonuç
* Gerçekleşen sonuç
* Hata önceliği
* Ekran görüntüsü / log bilgisi

### Örnek Bug

**Bug ID:** BUG-001
**Başlık:** Geçersiz indirim oranı kabul ediliyor

**Test ID:** TC-003

**Beklenen Sonuç:**
100'den büyük indirim oranı kabul edilmemeli.

**Gerçekleşen Sonuç:**
%120 indirim oranı ile kampanya oluşturulabiliyor.

**Öncelik:** High

**Önerilen İnceleme:**
İndirim oranı validasyonunun kontrol edilmesi.

---

## 5. Test Sonucu

Test senaryoları sonucunda:

* Kampanya oluşturma akışı kontrol edilmiştir.
* Zorunlu alan ve business rule kontrolleri test edilmiştir.
* API başarılı ve hatalı response senaryoları test edilmiştir.
* SQL ile veri doğrulama yaklaşımı kullanılmıştır.
* UAT senaryoları hazırlanmıştır.
* Tespit edilen hataların yazılım ekibine aktarılması için bug formatı oluşturulmuştur.

> Not: Test sonuçları ve API response'ları bu proje kapsamında örnek/mock veriler kullanılarak hazırlanmıştır.
