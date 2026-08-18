# Geração do APK

## 1. Introdução

Este documento descreve o processo de geração do arquivo APK da aplicação **Brick Breaker**, desenvolvido com **Flutter** e **Dart**. A finalidade desta documentação é detalhar as etapas necessárias para compilar a versão final do projeto, validar o funcionamento em ambiente Android e disponibilizar o pacote executável para testes e entrega.

A geração do APK é uma etapa essencial do ciclo de desenvolvimento, pois confirma que o projeto foi compilado corretamente, que os recursos foram registrados adequadamente e que a aplicação pode ser instalada em um dispositivo Android ou em um emulador.

---

## 2. Pré-requisitos

Antes de gerar o APK, é necessário garantir que o ambiente esteja corretamente configurado.

Os principais requisitos são:

- Flutter instalado e configurado;
- Dart instalado junto com o Flutter;
- Android SDK configurado;
- Android Studio instalado, quando necessário para emulador e ferramentas do Android;
- dispositivo Android físico ou emulador habilitado;
- dependências do projeto instaladas corretamente.

Além disso, o projeto deve estar compilando sem erros de análise, sintaxe ou dependências pendentes.

---

## 3. Verificação do ambiente

Antes de gerar a build, recomenda-se verificar se o Flutter está funcionando corretamente.

Comandos úteis:

```bash
flutter --version
flutter doctor
```

O comando `flutter doctor` deve indicar se há pendências relevantes no ambiente Android, Flutter, Android Studio ou conectividade do emulador/dispositivo.

Caso existam erros de configuração, devem ser corrigidos antes da geração da versão de produção.

---

## 4. Instalação das dependências

No diretório raiz do projeto, execute:

```bash
flutter pub get
```

Esse comando instala as dependências declaradas no arquivo `pubspec.yaml`, incluindo bibliotecas relacionadas ao jogo, navegação, recursos e qualquer utilidade adicional do projeto.

---

## 5. Testes antes da geração

Antes de gerar o APK, é importante validar o comportamento do aplicativo em ambiente de desenvolvimento.

Os testes devem incluir:

- carregamento da aplicação;
- navegação entre telas;
- execução do jogo;
- movimentação da bola e do paddle;
- colisões com blocos;
- progressão entre níveis;
- comportamento após derrota ou vitória;
- ajustes de cores e tamanhos;
- reprodução dos sons configurados.

Quando todas as funcionalidades principais estiverem funcionando corretamente, pode-se seguir para a geração da versão de release.

---

## 6. Geração da versão de release

Para gerar o APK de produção, execute o seguinte comando no terminal do projeto:

```bash
flutter build apk --release
```

Esse comando compila a aplicação em modo de release, otimizando o pacote para distribuição e uso em dispositivos Android.

O arquivo gerado será salvo em uma pasta semelhante a:

```text
build/app/outputs/flutter-apk/
```

O nome do arquivo geralmente inclui a versão final da aplicação, como `app-release.apk`.

---

## 7. Geração de build debug

Em alguns casos, pode ser útil gerar uma versão de depuração para testes rápidos.

```bash
flutter build apk --debug
```

Essa versão é útil para testes de desenvolvimento, mas a build de release deve ser usada como versão final do projeto.

---

## 8. Instalação em dispositivo ou emulador

Após a geração do APK, é possível instalar o arquivo em um dispositivo Android ou emulador.

### Instalação em dispositivo físico

1. Conecte o celular via USB;
2. habilite a depuração USB;
3. execute:

```bash
flutter install
```

Ou instale manualmente o APK gerado a partir do arquivo `.apk` no dispositivo.

### Instalação em emulador

1. Inicie um emulador via Android Studio ou AVD Manager;
2. execute:

```bash
flutter install
```

Essa etapa valida se o aplicativo pode ser instalado e executado corretamente no ambiente Android.

---

## 9. Validação final

Antes de considerar o APK pronto para entrega, devem ser realizados testes finais.

Os principais pontos a verificar são:

- aplicativo abre normalmente;
- todas as telas carregam corretamente;
- o jogo inicia sem erros;
- os blocos e a bola se comportam conforme a lógica esperada;
- a colisão com o paddle e os blocos funciona corretamente;
- a próxima fase carrega corretamente;
- a tela de configurações altera os parâmetros esperados;
- o APK é instalado corretamente;
- não há erros de runtime críticos.

Caso algum problema seja identificado, deve-se corrigir e repetir o processo de build.

---

## 10. Boas práticas para entrega

Para uma entrega mais segura, recomenda-se:

- testar a versão de release em um dispositivo real;
- validar a compatibilidade com a resolução da tela;
- verificar se todos os recursos de áudio e imagem estão presentes;
- revisar se o APK tem tamanho aceitável;
- manter uma cópia da build final para referência e entrega.

---

## 11. Conclusão

A geração do APK é a etapa final de compilação e validação da aplicação móvel. Com o ambiente corretamente configurado e a aplicação testada, o comando `flutter build apk --release` permite produzir uma versão executável para Android.

Essa etapa garante que a aplicação possa ser instalada em dispositivos compatíveis, validando a qualidade do projeto antes da entrega final. O processo também contribui para a identificação de possíveis problemas de compilação, dependências e comportamento em tempo de execução.

---

## 12. Referências

- Flutter. **Build and release an Android app**. Documentação oficial.  
  https://docs.flutter.dev/deployment/android

- Flutter. **Android installation**. Documentação oficial.  
  https://docs.flutter.dev/get-started/install/windows

- Android Developers. **Build for Android**. Documentação oficial.  
  https://developer.android.com/studio/build
