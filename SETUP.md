# 🚀 Guia de Configuração e Execução

## ⚠️ Pré-requisitos

Para executar este projeto Flutter, você precisa ter instalado:

### 1. Flutter SDK
```bash
# Instalar Flutter (Linux/macOS)
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"

# Ou usando gerenciador de versões (recomendado)
# FVM (Flutter Version Manager)
dart pub global activate fvm
fvm install stable
fvm use stable
```

### 2. Verificar Instalação
```bash
flutter doctor
```

### 3. Configurar para desenvolvimento mobile

#### Para Android:
```bash
# Instalar Android Studio
# Aceitar licenças Android
flutter doctor --android-licenses
```

#### Para iOS (macOS apenas):
```bash
# Instalar Xcode da App Store
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

## 📦 Instalação do Projeto

1. **Instalar dependências**
```bash
cd /workspaces/sales-force-mobile-flutter
flutter pub get
```

2. **Verificar se não há erros**
```bash
flutter analyze
```

## ▶️ Executar o Projeto

### Desenvolvimento

```bash
# Listar dispositivos disponíveis
flutter devices

# Executar em dispositivo conectado
flutter run

# Executar em modo debug com hot reload
flutter run --debug

# Executar em modo release
flutter run --release
```

### Usando Emuladores

#### Android:
```bash
# Criar e iniciar emulador Android
flutter emulators
flutter emulators --launch <emulator_id>
flutter run
```

#### iOS:
```bash
# Abrir simulador iOS (macOS apenas)
open -a Simulator
flutter run
```

### Web (Desenvolvimento):
```bash
flutter run -d chrome
# ou
flutter run -d web-server
```

## 🏗️ Build para Produção

### Android APK:
```bash
flutter build apk --release
# APK gerado em: build/app/outputs/flutter-apk/app-release.apk
```

### Android App Bundle (para Google Play):
```bash
flutter build appbundle --release
# AAB gerado em: build/app/outputs/bundle/release/app-release.aab
```

### iOS (macOS apenas):
```bash
flutter build ios --release
# Depois abra no Xcode para fazer upload
```

### Web:
```bash
flutter build web --release
# Build gerado em: build/web/
```

## 🔧 Comandos Úteis

```bash
# Limpar build cache
flutter clean

# Atualizar dependências
flutter pub upgrade

# Verificar versão do Flutter
flutter --version

# Executar testes
flutter test

# Gerar coverage
flutter test --coverage

# Formatar código
flutter format lib/

# Verificar problemas de código
flutter analyze
```

## 📱 Dispositivos Físicos

### Android:
1. Habilite "Opções de desenvolvedor" no dispositivo
2. Ative "Depuração USB"
3. Conecte via USB
4. Execute `flutter devices`
5. Execute `flutter run`

### iOS:
1. Conecte o dispositivo via USB
2. Confie no computador quando solicitado
3. Configure provisioning profile no Xcode
4. Execute `flutter run`

## 🐛 Solução de Problemas

### Problemas comuns:

**"Unable to locate Android SDK"**
```bash
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

**"CocoaPods not installed"** (iOS)
```bash
sudo gem install cocoapods
pod setup
```

**"Gradle sync failed"** (Android)
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

## 📝 Notas Importantes

- Este projeto usa **Material Design 3**
- Gerenciamento de estado com **BLoC**
- Arquitetura **Clean Architecture**
- Suporta **tema claro e escuro**

## 🔗 Links Úteis

- [Documentação Flutter](https://flutter.dev/docs)
- [Pub.dev (Packages)](https://pub.dev)
- [Flutter BLoC](https://bloclibrary.dev)
- [Material Design 3](https://m3.material.io)

## 📞 Suporte

Para problemas ou dúvidas, consulte:
- [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)
- [Flutter Community](https://flutter.dev/community)
