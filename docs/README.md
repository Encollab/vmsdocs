# VMS Documentation

This documentation site provides comprehensive information about the Vehicle Management System (VMS).

## Documentation Structure

```
docs/
├── index.md                 # Home page
├── getting-started/         # Quick start guides
├── platform/               # Platform overview and architecture
├── modules/                # Business module documentation
│   ├── vehicle-management/
│   ├── warranty-management/
│   ├── budget-management/
│   └── ...
├── configuration/          # Configuration guides
├── integration/           # Integration documentation
├── development/           # Developer resources
├── user-guide/           # End-user guides
├── analytics/            # Reporting and analytics
└── support/              # Support resources
```

## Building the Documentation Site

This documentation is designed to be served as a static website using any markdown documentation generator.

### Recommended Tools

#### MkDocs
```bash
# Install
pip install mkdocs mkdocs-material mkdocs-mermaid2-plugin

# Serve locally
mkdocs serve

# Build static site
mkdocs build
```

#### Docusaurus
```bash
# Initialize
npx create-docusaurus@latest docs-site classic

# Copy docs to docs/
cp -r docs/* docs-site/docs/

# Run locally
npm start
```

#### VitePress
```bash
# Install
npm add -D vitepress

# Run locally
npx vitepress dev docs

# Build
npx vitepress build docs
```

## Features Used

### Mermaid Diagrams
The documentation includes Mermaid diagrams for:
- System architecture
- Process flows
- Entity relationships
- State machines

### Markdown Features
- Tables for structured data
- Code blocks with syntax highlighting
- Task lists for checklists
- Links for navigation
- Emojis for visual indicators

## Navigation Structure

The documentation follows a hierarchical structure:

1. **Platform-level** - Overview and architecture
2. **Module-level** - Business functionality
3. **Task-level** - Specific how-to guides
4. **Reference-level** - API and configuration details

## Maintenance

### Adding New Pages
1. Create markdown file in appropriate folder
2. Update parent index.md with link
3. Follow naming convention (lowercase, hyphens)
4. Include navigation breadcrumbs

### Updating Content
1. Keep factual and current
2. Update implementation percentages
3. Maintain consistent formatting
4. Test all links

### Style Guide
- Use sentence case for headings
- Keep file names lowercase
- Use hyphens not underscores
- Include "Next Steps" sections
- Add related documentation links

## Quick Links

- [Home](index.md)
- [Getting Started](getting-started/index.md)
- [Platform Overview](platform/index.md)
- [Modules](modules/index.md)
- [Configuration](configuration/index.md)
- [Development](development/index.md)

## Contributing

To contribute to this documentation:

1. Follow the existing structure
2. Use consistent formatting
3. Test all code examples
4. Verify links work
5. Update indexes when adding pages

## License

This documentation is part of the VMS project.