<p align="center">
  <img src="https://raw.githubusercontent.com/abdoulrl2028-cloud-Dev/abdoulrl2028-cloud-Dev/main/assets/projects/sales.jpg" alt="Força de vendas em Flutter" width="100%">
</p>

# Sales Force Mobile Flutter

Aplicativo mobile de força de vendas desenvolvido em Flutter seguindo Clean Architecture.

## 📚 Documentação

- 📖 **[SETUP.md](SETUP.md)** - Guia completo de configuração e execução
- 🛠️ **[TECHNOLOGIES.md](TECHNOLOGIES.md)** - Tecnologias e ferramentas utilizadas

## 🏗️ Arquitetura

O projeto segue a Clean Architecture com a seguinte estrutura:

```
lib/
 ├── core/
 │    ├── theme/          # Temas, cores e estilos de texto
 │    ├── utils/          # Validadores, formatadores e helpers
 │    └── constants/      # Constantes da aplicação
 │
 ├── features/
 │    ├── auth/           # Feature de autenticação
 │    │    ├── data/      # Fontes de dados, modelos e repositórios
 │    │    ├── domain/    # Entidades, repositórios e casos de uso
 │    │    └── presentation/ # BLoC, páginas e widgets
 │    │
 │    ├── sales/          # Feature de vendas
 │    │    ├── data/
 │    │    ├── domain/
 │    │    └── presentation/
 │
 └── main.dart           # Ponto de entrada da aplicação
```

## 📱 Features

### Autenticação
- ✅ Login
- ✅ Registro
- ✅ Recuperação de senha
- ✅ Logout

### Vendas
- ✅ Lista de vendas
- ✅ Detalhes da venda
- ✅ Criar nova venda
- ✅ Filtros e busca
- ✅ Relatórios

### Produtos
- ✅ Lista de produtos
- ✅ Detalhes do produto
- ✅ Busca e filtros por categoria
- ✅ Controle de estoque

## 🛠️ Tecnologias

- **Flutter** - Framework para desenvolvimento mobile
- **BLoC** - Gerenciamento de estado
- **HTTP/Dio** - Requisições HTTP
- **SharedPreferences** - Armazenamento local
- **Intl** - Internacionalização e formatação

Ver mais detalhes em [TECHNOLOGIES.md](TECHNOLOGIES.md)

## 🎨 Design Patterns

- **Clean Architecture** - Separação de camadas
- **Repository Pattern** - Abstração de fontes de dados
- **BLoC Pattern** - Gerenciamento de estado
- **Dependency Injection** - Injeção de dependências

## 🚀 Como Executar

### Requisitos
- Flutter SDK 3.0.0 ou superior
- Android Studio / Xcode
- Dispositivo físico ou emulador

### Instalação

```bash
# 1. Clonar o repositório
git clone https://github.com/abdoulrl2028-cloud-Dev/sales-force-mobile-flutter.git

# 2. Entrar no diretório
cd sales-force-mobile-flutter

# 3. Instalar dependências
flutter pub get

# 4. Executar o aplicativo
flutter run
```

Para instruções detalhadas, consulte [SETUP.md](SETUP.md)

## 📦 Estrutura de Dados

### Camadas

1. **Domain** - Regras de negócio
   - Entities: Modelos de domínio
   - Repositories: Interfaces
   - UseCases: Casos de uso

2. **Data** - Implementação de dados
   - DataSources: Fontes de dados (remote/local)
   - Models: Modelos de dados
   - Repositories: Implementação das interfaces

3. **Presentation** - Interface do usuário
   - BLoC: Gerenciamento de estado
   - Pages: Telas
   - Widgets: Componentes reutilizáveis

## 📊 Status do Projeto

```
📁 37 arquivos Dart criados
✅ Estrutura completa implementada
✅ Clean Architecture
✅ BLoC Pattern
✅ Código limpo e documentado
⚙️ Pronto para desenvolvimento
```

## 🔧 Scripts Úteis

```bash
# Limpar cache
flutter clean

# Atualizar dependências
flutter pub upgrade

# Analisar código
flutter analyze

# Formatar código
flutter format lib/

# Executar testes
flutter test
```

## 📝 Observações

- Este é um projeto template com código limpo e organizado
- As APIs estão configuradas para URLs de exemplo
- Implemente as funcionalidades específicas conforme necessário
- Adicione testes unitários e de integração
- Configure CI/CD antes de fazer deploy

## 🔮 Próximos Passos

- [ ] Configurar autenticação real com backend
- [ ] Implementar testes unitários
- [ ] Implementar testes de widget
- [ ] Implementar testes de integração
- [ ] Adicionar internacionalização completa
- [ ] Implementar cache e sincronização offline
- [ ] Adicionar analytics e crash reporting
- [ ] Configurar CI/CD
- [ ] Publicar nas lojas (Google Play / App Store)

## 🤝 Contribuindo

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto é um template de uso livre.

## 📞 Contato

- GitHub: [@abdoulrl2028-cloud-Dev](https://github.com/abdoulrl2028-cloud-Dev)
- Repository: [sales-force-mobile-flutter](https://github.com/abdoulrl2028-cloud-Dev/sales-force-mobile-flutter)

---

**Feito com ❤️ usando Flutter**