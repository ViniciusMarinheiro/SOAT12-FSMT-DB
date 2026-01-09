# SOAT12-FSMT-DB

## 📝 Descrição do Propósito
Provisionamento do **Azure Database for PostgreSQL (Flexible Server)**. Este repositório gerencia o banco de dados como um serviço (PaaS), garantindo persistência isolada dos pods do Kubernetes.

## 🛠 Tecnologias Utilizadas
* **Terraform**: Gerenciamento de recursos PaaS.
* **PostgreSQL Flexible Server**: Banco de dados gerenciado.
* **Azure Blob Storage**: Backend para o estado do Terraform.

## 🚀 Passos para Execução e Deploy

### 💻 Execução Local
1. **Dependência**: Certifique-se de que o Resource Group do repo INFRA já existe.
2. **Inicializar**: `terraform init`
3. **Aplicar**: `terraform apply -auto-approve`
   * *A senha gerada pode ser recuperada via `terraform output`.*

### ☁️ Execução na Nuvem (CI/CD)
1. **Secrets**: Configure as chaves de acesso no GitHub.
2. **Federated Credentials**: O repositório deve ter permissão OIDC no App Registration do Azure.
3. **Trigger**: Push na branch `main` dispara o deploy para o ambiente de produção na Azure.

