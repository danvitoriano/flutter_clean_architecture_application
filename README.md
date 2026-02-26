# flutter_clean_architecture_application

Aplicativo Flutter organizado seguindo os princípios da **Clean Architecture**, com separação clara de responsabilidades entre as camadas de apresentação, domínio e dados.

---

## 1. Visão Geral do Projeto

Este projeto tem como objetivo demonstrar como estruturar um aplicativo Flutter de forma escalável e de fácil manutenção, aplicando os conceitos de Clean Architecture:

- **Desacoplamento** entre regras de negócio e detalhes de implementação (UI, banco de dados, APIs).
- **Testabilidade** aprimorada graças à inversão de dependências.
- **Separação de responsabilidades** clara entre camadas.

---

## 2. Requisitos

- [Flutter](https://docs.flutter.dev/get-started/install) **3.x** ou superior
- [Dart](https://dart.dev/get-dart) **3.x** ou superior (incluído no SDK do Flutter)
- Ferramentas comuns:
  - `git`
  - Editor com suporte a Flutter (VS Code com extensão Flutter ou Android Studio)
  - Android SDK / Xcode (para builds nativos em Android/iOS)

---

## 3. Como Começar

```bash
# 1. Clone o repositório
git clone https://github.com/danvitoriano/flutter_clean_architecture_application.git
cd flutter_clean_architecture_application

# 2. Instale as dependências
flutter pub get

# 3. Execute o aplicativo (dispositivo/emulador conectado)
flutter run
```

---

## 4. Ambientes / Flavors

O projeto não possui configuração de flavors definida no momento. Caso deseje separar ambientes (ex.: `dev`, `staging`, `prod`), é possível configurar flavors no Flutter ajustando os arquivos de build nativos (`android/app/build.gradle`, `ios/Runner.xcodeproj`) e utilizando variáveis de ambiente ou arquivos de configuração específicos por flavor.

---

## 5. Estrutura de Pastas

```
lib/
├── controllers/      # Controladores / gerenciamento de estado
├── data/
│   ├── api/          # Fontes de dados remotas (clientes HTTP, serviços REST)
│   └── dao/          # Fontes de dados locais (DAOs, banco de dados)
├── domain/
│   ├── business/     # Casos de uso e regras de negócio
│   └── models/       # Entidades e modelos de domínio
├── screens/          # Telas e widgets da camada de apresentação
├── utils/            # Utilitários e helpers compartilhados
└── main.dart         # Ponto de entrada da aplicação
```

> **Camadas principais:**
> - **Presentation** (`screens/`, `controllers/`): UI e gerenciamento de estado.
> - **Domain** (`domain/`): Lógica de negócio pura, independente de frameworks.
> - **Data** (`data/`): Implementações de repositórios, acesso a APIs e banco de dados local.

---

## 6. Padrões e Boas Práticas

- **Inversão de dependências**: as camadas internas (domain) não dependem das camadas externas (data, presentation); a comunicação ocorre por meio de interfaces/contratos.
- **Injeção de dependências**: as dependências são fornecidas de fora para dentro, facilitando substituição e testes.
- **Gerenciamento de estado**: a camada de `controllers` é responsável por manter e expor o estado para a UI, mantendo as telas desacopladas da lógica.
- **Testes**: a separação de camadas permite testar casos de uso (domain) e repositórios (data) de forma isolada, sem depender de Flutter ou de dispositivos físicos.
- **Separação de responsabilidades**: cada classe e módulo tem uma única razão para mudar, seguindo o princípio SRP.

---

## 7. Comandos Úteis

```bash
# Formatar o código
flutter format .

# Analisar o código (linting)
flutter analyze

# Executar testes
flutter test

# Gerar código (build_runner, ex.: Floor DAOs)
flutter pub run build_runner build --delete-conflicting-outputs

# Build para Android (APK de release)
flutter build apk --release

# Build para iOS (requer macOS e Xcode)
flutter build ios --release
```

---

## 8. Como Contribuir

1. Crie um fork do repositório e clone localmente.
2. Crie uma branch descritiva a partir de `main`:
   ```bash
   git checkout -b feat/nome-da-funcionalidade
   ```
3. Faça commits pequenos e com mensagens claras:
   ```bash
   git commit -m "feat: descrição curta da mudança"
   ```
4. Abra um **Pull Request** para `main` descrevendo o que foi alterado e o motivo.
5. Aguarde a revisão antes do merge.

---

## 9. Licença

Licença **não definida**. Para adicionar uma licença ao projeto, crie um arquivo `LICENSE` na raiz do repositório. Sugestões comuns: [MIT](https://choosealicense.com/licenses/mit/), [Apache 2.0](https://choosealicense.com/licenses/apache-2.0/) ou [GPL-3.0](https://choosealicense.com/licenses/gpl-3.0/).
