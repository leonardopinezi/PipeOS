# 🧪 PipeOS Template

🚀 Um sistema operacional simples criado em **Assembly 16 bits** para arquitetura **x86**, rodando em **Real Mode**, com suporte a **boot por disquete (floppy)** e virtualização via **QEMU**.

## 🛠 Sobre o projeto

O **PipeOS Template** é a base de um sistema operacional minimalista e educacional, escrito completamente em **NASM** (Netwide Assembler). Ele roda no **modo real de 16 bits** da arquitetura x86, ideal para aprendizado sobre baixo nível, bootloaders, gerenciamento direto de hardware e criação de sistemas operacionais do zero.

---

## 🧱 Tecnologias

- 🧠 **Assembly x86 (16 bits)**
- 🛠️ **NASM** - Montador de código
- 💿 **QEMU** - Emulador para testar o OS
- 💾 **Floppy Disk Image (1.44MB)**

---

## ▶️ Como rodar

### Pré-requisitos:

- NASM
- QEMU

### Instalação no Linux:

```bash
sudo apt update
sudo apt install nasm qemu
```

### Para compilar e executar:

```bash
sudo ./build.sh
```

---

## 💡 Objetivos do projeto

- Criar uma base bootável em Assembly puro
- Aprender arquitetura x86 real mode
- Estudar como funciona o processo de boot
- Escrever diretamente para vídeo e I/O da máquina
- Servir como ponto de partida para um sistema completo

---

## 📚 Estudos recomendados

- [Guia de Desenvolvimento de SO - OSDev Wiki](https://wiki.osdev.org/Main_Page)
- [x86 Assembly - PC BIOS Real Mode](https://wiki.osdev.org/Real_Mode)
- Documentação NASM

---

## ✨ Autor

Desenvolvido com paixão por baixo nível por **Leonardo Pinezi**  
📍 Brasil • 💻 Assembly lover • 🌏 Aprendendo a fundo como o computador funciona.

---

> 💬 *"PipeOS é mais que um sistema operacional — é uma jornada ao coração do computador."*
