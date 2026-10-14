SericeaPass 🍃

An atomic Linux desktop, built for my workflow.

SericeaPass is my personal Fedora-based atomic desktop project, designed around a clean, keyboard-driven workflow inspired by macOS and powered by a customizable window manager.

As a computer science student, I want an environment that stays out of my way: minimal, efficient, reproducible, and comfortable for both coding and everyday use.

✨ Philosophy
Atomic first — prioritize a stable, maintainable system with a predictable update workflow.
Keyboard-driven — navigate windows and manage workspaces without constantly reaching for the mouse.
macOS-inspired — a cohesive desktop experience with a focus on simplicity, consistency, and productivity.
Developer-focused — built for programming, studying, terminal workflows, and experimenting with Linux.
Personal by design — tailored to how I work, rather than trying to be a distribution for everyone.
🖥️ The Desktop

SericeaPass aims to combine the convenience of a desktop operating system with the flexibility of a tiling window manager.

A minimal, distraction-free desktop.
Keyboard-driven window management and workspaces.
A customized login experience using greetd and tuigreet.
A Fedora-based foundation with an emphasis on atomic system management.
A workflow designed for coding, multitasking, and daily use.
🛠️ Tech Stack
Component	Role
Fedora-based system	Base operating system
Atomic image workflow	Reproducible system configuration
systemd	Service management
greetd	Login manager
tuigreet	Terminal-based login interface
Window manager	Tiling and workspace management
GitHub Actions	Automated image builds

The exact desktop components and window manager configuration may evolve as the project develops.

🚀 Goals
Maintain a reproducible, atomic desktop image.
Build a seamless keyboard-driven workflow.
Create a cohesive macOS-inspired desktop experience.
Keep system configuration version-controlled.
Make updates and rollbacks predictable.
Optimize the environment for software development and university work.
🔧 Development
Prerequisites
Git
Podman or a compatible container build tool
An internet connection
Clone the repository
git clone https://github.com/nanda-kumudhan/sericeapass.git
cd sericeapass

Build the image
podman build -t sericeapass -f Containerfile .


This command builds the container image defined by the repository. Deploying it as a bootable atomic desktop may require additional image-building and installation tooling, depending on the underlying system architecture.

🧪 Project Status

SericeaPass is a personal project under active development. Configuration, desktop components, and system integration may change as I refine my workflow.

👨‍💻 About

I'm a computer science student building a Linux desktop that feels like my own: minimal like macOS, flexible like Linux, and designed around the way I code and study.

📄 License

A license has not yet been specified. See the repository for current licensing information.

Repository: nanda-kumudhan/sericeapass
