
---

````markdown
#  Terraform AWS Provider – Recherche & Dokumentation

##  Ziel der Aufgabe

Diese Rechercheaufgabe befasst sich mit dem **AWS Provider für Terraform**. Ziel war es, zu verstehen, wie der AWS Provider funktioniert, wie man ihn konfiguriert, wie AWS-Ressourcen über Terraform abgebildet werden und wie man die offizielle Dokumentation korrekt nutzt. Die praktische Umsetzung einer einfachen AWS-Ressource (eines S3 Buckets) wurde optional, aber empfohlen, durchgeführt.

---

##  Die Rolle des AWS Providers in Terraform

Der **AWS Provider** verbindet Terraform mit Amazon Web Services (AWS). Er stellt die notwendigen Funktionen bereit, um Infrastrukturressourcen in einem AWS-Account programmatisch über Terraform zu erstellen, zu verändern und zu löschen. Terraform verwendet den Provider, um die Konfiguration in HCL (HashiCorp Configuration Language) in konkrete API-Aufrufe an AWS zu übersetzen.

---

##  Konfiguration des AWS Providers

Die Konfiguration erfolgt im Terraform-Code über den `provider`-Block. In unserem Fall wurde insbesondere die Region angegeben:

```hcl
provider "aws" {
  region = "eu-central-1"  # AWS-Region Frankfurt
}
````

### Authentifizierung

Die Authentifizierung erfolgt **sicher über bestehende AWS-Konfigurationsmethoden**, nicht über fest eingebettete Zugangsdaten. Zwei bewährte Methoden:

* **AWS CLI Konfigurationsdatei**: `~/.aws/credentials` mit `[default]`-Profil
* **Umgebungsvariablen**:

  * `AWS_ACCESS_KEY_ID`
  * `AWS_SECRET_ACCESS_KEY`

---

##  Die Ressource `aws_s3_bucket`

### Bedeutung

Ein `aws_s3_bucket` ist die Terraform-Abbildung eines **S3 Buckets** in AWS – einem hochverfügbaren, skalierbaren Objektspeicher.

### Argumente laut Dokumentation (Argument Reference)

Wichtige Konfigurationsoptionen im `resource`-Block:

* `bucket` *(erforderlich)*: global eindeutiger Name
* `acl` *(optional)*: Zugriffssteuerung, z. B. `"private"`, `"public-read"`
* Optional: `tags`, `versioning`, `lifecycle_rule`, `force_destroy` usw.

Beispiel:

```hcl
resource "aws_s3_bucket" "my_research_bucket" {
  bucket = "my-unique-research-bucket-jonas123"
  acl    = "private"
}
```

### Bereitgestellte Attribute nach Erstellung (Attribute Reference)

Terraform stellt nach Erstellung einer Ressource Metadaten bereit, z. B.:

* `arn`: Amazon Resource Name des Buckets
* `id`: Bucket-Name
* `bucket_domain_name`: globale Domain
* `bucket_regional_domain_name`: regional-spezifische Domain (z. B. für Website-Hosting)

Beispiel-Output:

```hcl
output "bucket_arn" {
  value = aws_s3_bucket.my_research_bucket.arn
}
```

---

##  Dokumentationsquellen

Die Informationen wurden aus der offiziellen Terraform Registry entnommen:

*  **AWS Provider Übersicht**:
  [https://registry.terraform.io/providers/hashicorp/aws/latest](https://registry.terraform.io/providers/hashicorp/aws/latest)

*  **Spezifische Ressource `aws_s3_bucket`**:
  [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3\_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)

### Unterschied: Argument Reference vs. Attribute Reference

| Typ                     | Beschreibung                                                                                                                                     |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Argument Reference**  | Definitionen, die in der `.tf`-Datei angegeben werden müssen, um die Ressource zu erstellen                                                      |
| **Attribute Reference** | Eigenschaften der Ressource, die **nach** der Erstellung automatisch verfügbar sind – z. B. für `output` oder zur Verknüpfung anderer Ressourcen |



