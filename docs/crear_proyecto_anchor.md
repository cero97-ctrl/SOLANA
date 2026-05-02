# Guía: Crear un Proyecto en Solana con Anchor

Una vez que tienes tu entorno de desarrollo configurado (Rust, Solana CLI y Anchor), estás listo para inicializar tu primer proyecto de Smart Contracts (Programas) en Solana.

## 1. Inicializar el Proyecto

Abre tu terminal y ejecuta el siguiente comando, reemplazando `mi_primer_proyecto` con el nombre que prefieras (usa guiones bajos para espacios):

```bash
anchor init mi_primer_proyecto
```

Este comando creará una nueva carpeta llamada `mi_primer_proyecto` con toda la estructura base necesaria. Entra en la carpeta:

```bash
cd mi_primer_proyecto
```

## 2. Entender la Estructura del Proyecto

Al explorar la carpeta, verás los siguientes archivos y directorios clave:

*   **`programs/`**: Aquí es donde vive el código de tus Smart Contracts en Rust. Dentro verás una subcarpeta con el nombre de tu proyecto y un archivo `src/lib.rs`. Este archivo contiene el código fuente de tu programa.
*   **`tests/`**: Contiene archivos TypeScript/JavaScript para probar tu programa utilizando Mocha, Chai y `@solana/web3.js`.
*   **`Anchor.toml`**: Es el archivo de configuración principal de tu proyecto. Aquí defines la red a la que te conectarás (localnet, devnet, mainnet) y la ubicación de las llaves de tu billetera.
*   **`app/`**: (Opcional) Un directorio vacío donde puedes poner el código del frontend (React, Next.js, etc.) de tu dApp web3.
*   **`package.json`** y **`Cargo.toml`**: Archivos de gestión de dependencias para Node.js y Rust, respectivamente.

## 3. Configurar tu Billetera (Wallet) Local

Para que Anchor pueda compilar y desplegar (incluso en un entorno de pruebas local), necesitas una billetera (keypair) configurada. Si no tienes una, créala con el CLI de Solana:

```bash
solana-keygen new --outfile ~/.config/solana/id.json
```
*(Puedes presionar `Enter` para dejar la contraseña en blanco para desarrollo local)*.

Verifica que Anchor esté apuntando a tu billetera correcta revisando el archivo `Anchor.toml`. Debe contener algo como:
```toml
wallet = "~/.config/solana/id.json"
```

## 4. Compilar el Programa

Para transformar tu código Rust en un binario ejecutable (.so) compatible con la máquina virtual de Solana (BPF), ejecuta:

```bash
anchor build
```

La primera vez tomará un par de minutos porque descargará todas las dependencias de Rust. Al finalizar, Anchor generará un **ID de Programa (Program ID)** único para tu contrato y un archivo **IDL (Interface Description Language)** en formato JSON que indica a las aplicaciones frontend cómo interactuar con tu código.

## 5. Probar el Programa

Anchor incluye una herramienta que levanta un clúster de Solana local temporal, despliega tu programa y ejecuta los tests de la carpeta `tests/`. Es ideal para comprobar que todo funciona sin gastar SOL real.

Ejecuta:

```bash
anchor test
```

Si todo es correcto, verás en la terminal un mensaje indicando que el test (usualmente llamado `Is initialized!`) ha pasado con éxito (un check verde `✔`).

---

## Resumen del Flujo de Trabajo

Cada vez que programes, tu ciclo de vida de desarrollo será:
1. Escribir código en `programs/.../src/lib.rs`
2. Escribir pruebas en `tests/...ts`
3. Compilar con `anchor build`
4. Probar con `anchor test`
5. Desplegar en Devnet/Mainnet con `anchor deploy` (cuando estés listo).