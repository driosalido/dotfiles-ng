# Dotfiles-NG Roadmap

Este documento contiene la lista de funcionalidades planificadas para implementar en nuestro sistema de dotfiles basado en chezmoi.

## ✅ Funcionalidades Completadas

### Core Foundation
- [x] **Chezmoi Setup**: Configuración base con templates
- [x] **Platform Detection**: Detección automática de macOS/Linux
- [x] **Git Configuration**: Template multiplataforma con variables personalizadas
- [x] **XDG Compliance**: Implementación del XDG Base Directory Specification
- [x] **One-liner Installation**: Instalación completa con `sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply driosalido/dotfiles-ng`
- [x] **Smart Defaults**: Auto-detección de email, configuración sin prompts

### Shell Configuration
- [x] **Basic Shell Config**: Configuración básica de zsh (bash eliminado)
- [x] **Modular Zsh Configuration**: Estructura modular en `~/.config/zsh/` con orden de carga definido
- [x] **Oh-My-Zsh Integration**: Instalación automática y configuración XDG-compliant
- [x] **Powerlevel10k Theme**: Instalación automática con configuración personalizada
- [x] **Nerd Font Installation**: Instalación automática de MesloLGS NF para macOS/Linux
- [x] **Shell Plugins**: zsh-autosuggestions, zsh-syntax-highlighting
- [x] **Cross-platform Aliases**: Aliases comunes y específicos por plataforma
- [x] **XDG-Compliant P10k Config**: Configuración en `~/.config/powerlevel10k/p10k.zsh`
- [x] **Advanced Autocompletion**: Sistema de completado con menús y colores
- [x] **FZF Integration**: Búsqueda fuzzy con Ctrl+R, Ctrl+T, Alt+C
- [x] **Modern Tools**: fzf, zoxide, ripgrep, fd, bat, eza, delta

### Package Management
- [x] **Homebrew Integration**: Instalación automática y gestión de paquetes
- [x] **Cross-platform Brewfile**: Soporte para macOS y Linux
- [x] **Package Cleanup**: Eliminación de paquetes deprecados y erróneos
- [x] **Cask Applications**: Instalación de aplicaciones GUI (personal/corporativo)

## 🚧 Próximas Funcionalidades (Prioridad Alta)

### 1. Environment Detection & Configuration
- [ ] **Corporate vs Personal Detection**
  - Prompt interactivo durante inicialización
  - Configuraciones específicas por entorno
  - Variables de proxy para entornos corporativos
  - Emails diferenciados

### 2. Secrets Management
- [ ] **Bitwarden CLI / macOS Keychain Integration** (1Password deprecated)
  - Configurar aliases y funciones útiles
  - Scripts para gestión de secrets
  - Integración con SSH keys

### 3. Advanced Package Management
- [ ] **APT Integration (Linux)**
  - Lista de paquetes esenciales
  - Actualización automática de repositorios
  - Snap packages support

### 4. Development Environment
- [ ] **Python Environment**
  - pyenv integration
  - pipx installation and configuration
  - Virtual environment management
  
- [ ] **Node.js Environment**
  - nvm/fnm integration
  - Global npm packages
  - Yarn configuration

### 5. SSH Configuration
- [ ] **SSH Config Template**
  - Template para ~/.ssh/config (XDG: ~/.config/ssh/config)
  - Host-specific configurations
  - Jump host configurations
  
- [ ] **SSH Key Management**
  - Automatic SSH key generation
  - SSH agent integration (macOS Keychain)
  - Platform-specific key algorithms

## 🔮 Funcionalidades Futuras (Prioridad Media)

### Editor Configuration
- [ ] **Vim/Neovim Config**
  - Basic vim configuration
  - Plugin management
  - Language server integration

- [ ] **VS Code Settings**
  - Settings sync template
  - Extension list management
  - Workspace configurations

### Terminal & Tools
- [ ] **Terminal Emulator Config**
  - Alacritty configuration
  - iTerm2 preferences (macOS)
  - Windows Terminal settings (if needed)

- [ ] **Additional CLI Tools**
  - lazygit, bottom, broot, dust, glow
  - Advanced tool configurations
  - Custom functions and aliases

### System Preferences
- [ ] **macOS Defaults**
  - System preferences automation
  - Dock and Finder configurations
  - Keyboard and trackpad settings

- [ ] **Linux Desktop Integration**
  - GNOME/KDE settings
  - Desktop environment specific configs

## 🌟 Funcionalidades Avanzadas (Prioridad Baja)

### Automation & Scripts
- [ ] **Dotfiles Maintenance**
  - Update scripts for packages
  - Health check commands
  - Backup and restore functionality

### Security & Privacy
- [ ] **GPG Configuration**
  - GPG key management
  - Git signing configuration
  - Encryption preferences

### Monitoring & Observability
- [ ] **System Monitoring**
  - Basic monitoring aliases
  - Log aggregation helpers
  - Performance monitoring tools

### Multi-Machine Sync
- [ ] **Machine-Specific Configurations**
  - Machine profiles (work-laptop, home-desktop, etc.)
  - Conditional feature flags
  - Remote configuration management

## 📋 Implementation Guidelines

### Branch Strategy
- Crear branch feature por cada funcionalidad mayor
- Mergear a main cuando esté completamente testado
- Tags para versiones estables

### Testing Strategy
- Probar en usuario `testing@localhost` antes de mergear
- Verificar tanto en macOS como Linux cuando sea posible
- Documentar casos edge y soluciones

### Documentation
- Actualizar CLAUDE.md con nuevos comandos/funcionalidades
- Mantener README.md actualizado
- Comentar templates complejos

## 🎯 Hitos Principales

### Milestone 1: Core Shell Experience (COMPLETADO ✅)
- ✅ One-liner installation
- ✅ Advanced shell configuration
- ✅ Modern tools integration
- ✅ Package management

### Milestone 2: Environment Management (ACTUAL)
- Corporate/Personal detection
- Bitwarden / Keychain integration
- SSH configuration

### Milestone 3: Development Ready
- Python + Node.js environments
- Editor configurations
- Advanced development tools

### Milestone 4: Production Ready
- Todas las funcionalidades core implementadas
- Documentación completa
- Scripts de mantenimiento

---

*Este roadmap es un documento vivo que se actualizará según las necesidades y prioridades.*