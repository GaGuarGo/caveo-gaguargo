# Caveo Gaguargo

Caveo Gaguargo é um aplicativo Flutter que simula um catálogo de produtos com paginação, splash animada e arquitetura moderna utilizando Riverpod, Clean Architecture e comandos assíncronos.

## Funcionalidades
- Splash screen animada com barra de progresso
- Listagem de produtos com paginação simulada
- Gerenciamento de estado com Riverpod
- Separação de camadas: domain, data, infrastructure, presenter
- Uso de comandos para operações assíncronas

## Estrutura do Projeto
```
lib/
  main.dart                // Ponto de entrada do app
  app_widget.dart          // Widget principal
  app_provider.dart        // Provider principal
  core/                    // Pasta com configurações centrais do projeto
  domain/                  // Entidades, regras de negócio, use-scases, erros e abstração dos repositórios
  data/                    // DTOs, implementação dos repositórios, abstração do datasources
  infrastructure/          // Implementação do datasource
  presenter/modules/       // Páginas e widgets visuais
  presenter/providers/     // Notifiers, providers e states do Riverpod
  
```

## Paginação Simulada
O app carrega todos os produtos na primeira requisição e exibe apenas uma parte deles por vez, simulando o comportamento de paginação. Ao solicitar mais produtos, o estado é atualizado com mais itens da lista completa.

## Splash Animada
A tela de splash exibe uma barra de progresso animada, proporcionando uma transição suave para a tela principal.

## Cache local com criptografia
O app guarda localmente dados de requisições que foram configuradas para ter cache local de forma segura com criptografia num período configurável
(Padrão 10 minutos). E quando a mesma request é feita utilizando os mesmos parâmetros o interceptor barra a request e devolve os dados localmente armazenados.

## Como Executar
1. Instale as dependências:
   ```sh
   flutter pub get
   ```
2. Execute o app:
   ```sh
   flutter run
   ```

## Tecnologias Utilizadas
- Flutter
- Riverpod
- GoRouter
- Clean Architecture


## Licença
Este projeto está sob a licença MIT.
