# E-commerce Campaign Analysis

## Proje Hakkında

Bu proje, bir e-ticaret şirketinde CRM sistemi üzerinden oluşturulan kampanyaların e-ticaret sistemine aktarılması sürecinin iş analizi çalışmasıdır.

Mevcut süreçte kampanya bilgilerinin e-ticaret sistemine manuel olarak aktarılması operasyonel yük oluşturmakta ve veri giriş hatalarına neden olabilmektedir.

Projenin amacı, CRM ile e-ticaret sistemi arasındaki kampanya aktarım sürecini analiz ederek daha otomatik ve kontrollü bir yapı için gereksinimleri ve süreçleri tanımlamaktır.

## Problem

Kampanya bilgileri CRM sisteminde oluşturulduktan sonra e-ticaret sistemine manuel olarak aktarılmaktadır.

Bu süreçte:

* Manuel veri girişi yapılmaktadır.
* Veri giriş hataları oluşabilmektedir.
* Kampanyaların sisteme aktarılması zaman alabilmektedir.
* Kampanya bilgilerinin kontrol edilmesi gerekmektedir.

## Proje Amacı

CRM'de oluşturulan kampanyaların e-ticaret sistemine API aracılığıyla aktarılabileceği bir süreç tasarlamak.

## Kapsam

Proje kapsamında:

* İş gereksinimlerinin belirlenmesi
* Fonksiyonel gereksinimlerin oluşturulması
* AS-IS ve TO-BE süreçlerinin modellenmesi
* User Story ve Acceptance Criteria hazırlanması
* REST API entegrasyonunun analiz edilmesi
* SQL sorgularının hazırlanması
* Test senaryolarının oluşturulması
* UAT senaryolarının hazırlanması

ele alınmıştır.

## Temel Süreç

```text
CRM
 ↓
Kampanya Oluşturma
 ↓
API
 ↓
E-ticaret Sistemi
 ↓
Kampanya Doğrulama
 ↓
Kampanyanın Aktif Hale Gelmesi
```

## Kullanılan İş Analizi Teknikleri

* Requirement Analysis
* Functional Analysis
* User Story
* Acceptance Criteria
* AS-IS / TO-BE Analysis
* Process Flow
* REST API Analysis
* SQL
* Software Testing
* UAT

## Proje Çıktıları

| Doküman           | Açıklama                        |
| ----------------- | ------------------------------- |
| `requirements.md` | İş ve fonksiyonel gereksinimler |
| `process-flow.md` | AS-IS ve TO-BE süreçleri        |
| `api-analysis.md` | API ve entegrasyon analizi      |
| `sql-queries.sql` | Örnek SQL sorguları             |
| `test-cases.md`   | Test ve UAT senaryoları         |

## Not

Bu proje eğitim ve portföy amacıyla hazırlanmış örnek bir iş analizi çalışmasıdır. Gerçek şirket, müşteri veya kişisel veriler kullanılmamıştır.
