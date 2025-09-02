# VMS Documentation

This repository contains the documentation for the Vehicle Management System (VMS).

## Documentation Website

The documentation is organized as a static website in the `docs/` folder.

### Quick Start

To view the documentation locally:

```bash
# Install MkDocs
pip install mkdocs mkdocs-material mkdocs-mermaid2-plugin

# Serve the documentation
mkdocs serve

# Open in browser
# http://localhost:8000
```

### Documentation Structure

- **[Getting Started](docs/getting-started/)** - New to VMS? Start here
- **[Platform Overview](docs/platform/)** - Architecture and features
- **[Modules](docs/modules/)** - Business module documentation
- **[Configuration](docs/configuration/)** - Setup and configuration guides
- **[Integration](docs/integration/)** - System integration documentation
- **[Development](docs/development/)** - Developer resources
- **[User Guides](docs/user-guide/)** - End-user documentation

## Repository Structure

```
vmsdocs/
├── docs/                 # Documentation content
│   ├── index.md         # Home page
│   ├── getting-started/ # Quick start guides
│   ├── platform/        # Platform documentation
│   ├── modules/         # Business modules
│   └── ...
├── mkdocs.yml           # MkDocs configuration
└── README.md            # This file
```

## Building Documentation

### For GitHub Pages
```bash
mkdocs gh-deploy
```

### For Static Hosting
```bash
mkdocs build
# Output in site/ folder
```

## Contributing

When adding or updating documentation:

1. Follow the existing folder structure
2. Use lowercase filenames with hyphens
3. Update the parent index.md file
4. Test locally with `mkdocs serve`
5. Ensure all links work

## License

This documentation is part of the VMS project.