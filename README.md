# GlowOn

Aplicativo mobile para gestão de agendamentos, clientes, serviços e pagamentos
de salões de beleza de pequeno porte, de uso exclusivo da proprietária.
Funciona offline, com dados locais no aparelho.

## Arquitetura

**Feature-first** com duas camadas por feature (`data` e `presentation`).
Sem camada `domain`/usecases: o app é pequeno, local e de uma única usuária,
então os models da camada `data` servem direto como entidades.

```
lib/
├── main.dart
├── app/
│   ├── app.dart               # MaterialApp
│   ├── router/                # Rotas
│   ├── shell/                 # Navegação principal (abas)
│   └── theme/
├── core/                      # Transversal, sem dependência de features
│   ├── constants/
│   ├── database/              # Configuração do banco local
│   ├── extensions/
│   └── utils/
├── shared/widgets/            # Widgets reutilizáveis entre features
└── features/
    ├── agenda/                # Agendamentos (tela principal)
    ├── clients/               # Clientes
    ├── services/              # Serviços e preços
    └── payments/              # Pagamentos
        ├── data/              # models + repositories (acesso ao banco)
        └── presentation/      # pages, widgets, controllers (estado)

test/                          # Espelha a estrutura de lib/
integration_test/
assets/                        # images, icons, fonts
docs/
```

Fluxo: `Page → Controller → Repository → banco local`.

Se alguma regra de negócio ficar complexa (ex.: cálculo de comissões ou
detecção de conflitos de horário), extraia-a para uma classe/serviço em
`domain/` dentro da feature correspondente.

## Primeiros passos

Este repositório contém apenas o código Dart. Para gerar as pastas de
plataforma (`android/`, `ios/`), rode na raiz:

```bash
flutter create . --project-name glow_on --org com.glowon
flutter pub get
flutter analyze
flutter test
flutter run
```

> O `flutter create .` não sobrescreve `lib/`, `pubspec.yaml` nem os testes existentes.
