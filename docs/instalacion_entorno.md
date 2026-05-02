# Guía de Instalación del Entorno de Desarrollo de Solana

Esta guía detalla los pasos para preparar tu máquina (Linux/macOS) para desarrollar Smart Contracts (Programas) en la blockchain de Solana, utilizando Rust y el framework Anchor.

## 1. Instalar Dependencias del Sistema (Linux)
Si utilizas Ubuntu o alguna distribución basada en Debian, necesitas instalar herramientas de compilación y librerías clave antes de instalar las herramientas de desarrollo:

```bash
sudo apt-get update
sudo apt-get install -y pkg-config build-essential libudev-dev libssl-dev
```

## 2. Instalar Rust
Rust es el lenguaje principal para escribir programas en Solana. Usaremos `rustup`, su instalador oficial.

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Sigue las instrucciones en la consola (presiona `1` para la instalación por defecto). Después, recarga tu entorno para usar los comandos de Rust sin reiniciar la terminal:

```bash
source $HOME/.cargo/env
```
Verifica que se instaló correctamente con `rustc --version`.

## 3. Instalar Solana CLI
Solana CLI es indispensable para interactuar con la red, crear billeteras locales (keypairs) y desplegar tus programas.

```bash
sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
```

*Nota: Si el comando no se reconoce de inmediato, asegúrate de actualizar tu variable PATH como te indica el final de la instalación en la consola (agregando `export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"` a tu `~/.bashrc` o `~/.zshrc`).*

Verifica tu instalación:
```bash
solana --version
```

## 4. Instalar Node.js y Yarn
El framework Anchor utiliza JavaScript/TypeScript de forma intensiva para hacer pruebas automáticas de tus contratos. Necesitas tener instalado Node.js y el gestor de paquetes `yarn`.

Si ya tienes Node y npm, simplemente ejecuta:
```bash
npm install -g yarn
```

## 5. Instalar Anchor Framework
La mejor manera de instalar Anchor es a través de **AVM** (Anchor Version Manager), ya que te permite administrar y cambiar fácilmente entre distintas versiones del framework.

Primero, instala AVM mediante Cargo (el gestor de paquetes de Rust):
```bash
cargo install --git https://github.com/coral-xyz/anchor avm --locked --force
```

A continuación, instala y configura la última versión de Anchor:
```bash
avm install latest
avm use latest
```

Verifica que Anchor esté funcionando correctamente:
```bash
anchor --version
```

## ¡Tu entorno está listo! 🎉
Para iniciar tu primer proyecto inteligente, simplemente ejecuta: `anchor init mi_primer_proyecto`