# Dotfiles-NG Roadmap

Este documento contiene la lista de funcionalidades planificadas para implementar en nuestro sistema de dotfiles basado en chezmoi.

## ✅ Funcionalidades Completadas

### Core Foundation
- [x] **Chezmoi Setup**: Configuración base con templates
- [x] **Platform Detection**: Detección automática de macOS/Linux
- [x] **Git Configuration**: Template multiplataforma con variables personalizadas
- [x] **XDG Compliance**: Implementación del XDG Base Directory Specification

### Shell Configuration
- [x] **Basic Shell Config**: Configuración básica de zsh
- [x] **Oh-My-Zsh Integration**: Instalación automática y configuración XDG-compliant
- [x] **Shell Plugins**: zsh-autosuggestions, zsh-syntax-highlighting
- [x] **Cross-platform Aliases**: Aliases comunes y específicos por plataforma

## 🚧 Próximas Funcionalidades (Prioridad Alta)

### 1. Environment Detection & Configuration
- [ ] **Corporate vs Personal Detection**
  - Prompt interactivo durante inicialización
  - Configuraciones específicas por entorno
  - Variables de proxy para entornos corporativos
  - Emails diferenciados

### 2. Secrets Management
- [ ] **1Password CLI Integration**
  - Configurar aliases y funciones útiles
  - Scripts para gestión de secrets
  - Integración con SSH keys

### 3. Package Management
- [ ] **Homebrew Integration (macOS)**
  - Detección e instalación automática
  - Lista de paquetes esenciales (Brewfile)
  - Gestión de cask applications
  
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
  - 1Password SSH agent integration
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

- [ ] **Modern CLI Tools**
  - bat, exa, fd, ripgrep configurations
  - fzf integration and key bindings
  - delta (git diff) configuration

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

### Milestone 1: Environment Management (Actual)
- Corporate/Personal detection
- 1Password integration
- Basic package management

### Milestone 2: Development Ready
- Python + Node.js environments
- SSH configuration completa
- Editor básico configurado

### Milestone 3: Production Ready
- Todas las funcionalidades core implementadas
- Documentación completa
- Scripts de mantenimiento

---

*Este roadmap es un documento vivo que se actualizará según las necesidades y prioridades.*