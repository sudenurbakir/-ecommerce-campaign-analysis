# Requirements Analysis

## 1. Business Requirements

### BR-001 — Kampanya Aktarımı

CRM sisteminde oluşturulan kampanyalar e-ticaret sistemine otomatik olarak aktarılmalıdır.

### BR-002 — Kampanya Bilgilerinin Doğrulanması

E-ticaret sistemine aktarılmadan önce kampanya bilgilerinin geçerli olup olmadığı kontrol edilmelidir.

### BR-003 — Manuel İşlemlerin Azaltılması

Kampanya aktarım sürecindeki manuel veri girişleri azaltılmalıdır.

### BR-004 — Hataların Takip Edilmesi

Kampanya aktarımı başarısız olduğunda sistem hata durumunu kayıt altına almalı ve ilgili ekiplerin sorunu takip edebilmesini sağlamalıdır.

---

## 2. Functional Requirements

### FR-001 — Kampanya Oluşturma

Sistem, CRM kullanıcısının kampanya adı, hedef müşteri segmenti, indirim oranı, başlangıç tarihi ve bitiş tarihi bilgilerini girmesine izin vermelidir.

### FR-002 — Kampanya Doğrulama

Sistem, kampanya aktarılmadan önce zorunlu alanları ve kampanya tarihlerini kontrol etmelidir.

### FR-003 — API ile Aktarım

Sistem, doğrulaması başarılı olan kampanya bilgilerini REST API aracılığıyla e-ticaret sistemine göndermelidir.

### FR-004 — Aktarım Sonucunun Kontrolü

Sistem, e-ticaret sisteminden gelen API yanıtını kontrol etmelidir.

### FR-005 — Başarılı Aktarım

API başarılı yanıt verdiğinde kampanya aktarımı başarılı olarak işaretlenmelidir.

### FR-006 — Hatalı Aktarım

API başarısız yanıt verdiğinde kampanya aktarımı başarısız olarak işaretlenmeli ve hata bilgisi kayıt altına alınmalıdır.

---

## 3. Business Rules

### BRULE-001

Kampanya adı boş bırakılamaz.

### BRULE-002

İndirim oranı 0'dan küçük veya %100'den büyük olamaz.

### BRULE-003

Kampanya bitiş tarihi başlangıç tarihinden önce olamaz.

### BRULE-004

Kampanya yalnızca aktif bir müşteri segmentine atanabilir.

---

## 4. User Stories

### US-001 — Kampanya Oluşturma

**As a** Marketing Specialist

**I want to** CRM üzerinde müşteri segmentine özel kampanya oluşturmak

**So that** belirlenen müşterilere uygun kampanyalar sunabilirim.

#### Acceptance Criteria

**AC-001**

```text
Given aktif bir müşteri segmenti bulunmaktadır
When kullanıcı kampanya bilgilerini girip kaydettiğinde
Then kampanya başarıyla oluşturulmalıdır.
```

**AC-002**

```text
Given kampanya bilgileri eksiktir
When kullanıcı kampanyayı kaydetmeye çalıştığında
Then sistem eksik alanları göstermelidir.
```

---

### US-002 — Kampanyayı E-Ticaret Sistemine Aktarma

**As a** Marketing Specialist

**I want to** oluşturduğum kampanyanın e-ticaret sistemine otomatik aktarılmasını

**So that** kampanyayı manuel olarak tekrar tanımlamak zorunda kalmayayım.

#### Acceptance Criteria

**AC-003**

```text
Given kampanya bilgileri geçerlidir
When kampanya aktarımı başlatıldığında
Then sistem kampanya bilgilerini API aracılığıyla e-ticaret sistemine göndermelidir.
```

**AC-004**

```text
Given API başarılı yanıt vermiştir
When aktarım tamamlandığında
Then kampanya "Aktarıldı" olarak işaretlenmelidir.
```

**AC-005**

```text
Given API hata yanıtı vermiştir
When aktarım tamamlandığında
Then kampanya "Aktarım Başarısız" olarak işaretlenmeli ve hata bilgisi kaydedilmelidir.
```

---

## 5. Scope

### In Scope

* CRM üzerinden kampanya oluşturulması
* Kampanya bilgilerinin doğrulanması
* CRM ve e-ticaret sistemi arasındaki API aktarımı
* Kampanya aktarım sonucunun kontrol edilmesi
* Hata durumlarının kayıt altına alınması
* Test ve UAT süreçleri

### Out of Scope

* Ödeme sistemi geliştirmesi
* Kargo süreçleri
* Ürün stok yönetimi
* Gerçek müşteri verilerinin kullanılması
* Gerçek bir CRM veya e-ticaret sisteminin geliştirilmesi
