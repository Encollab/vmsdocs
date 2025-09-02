#!/bin/bash

# Cleanup script to remove old uppercase documentation files
# These have been restructured into the docs/ folder with proper organization

echo "VMS Documentation Cleanup"
echo "========================="
echo ""
echo "The following files have been restructured into the docs/ folder"
echo "and can be safely removed:"
echo ""

# List files to be removed
echo "Files to remove:"
echo "- API_SERVICE_REFERENCE.md → docs/integration/api-reference.md"
echo "- APP_FUNCTIONALITY_GUIDE.md → docs/modules/*/index.md"
echo "- TECHNICAL_ARCHITECTURE.md → docs/platform/architecture.md"
echo "- FUNCTIONAL_SPECIFICATIONS.md → docs/configuration/*.md & docs/modules/*.md"
echo "- DEVELOPER_CHECKLISTS.md → docs/development/feature-backlog.md"
echo "- MARKETING_FEATURES.md → docs/platform/features.md"
echo "- IMPLEMENTATION_STATUS.md → docs/platform/implementation-status.md"
echo "- CLEANUP_CONFIGURATION.md → (temporary file, can be removed)"
echo "- DOCUMENTATION_STRUCTURE.md → (this cleanup guide, keep for reference)"
echo ""

# Files to keep
echo "Files to KEEP:"
echo "✓ CLAUDE.md (AI assistant instructions)"
echo "✓ README.md (main project readme)"
echo "✓ todo.md (original task list)"
echo "✓ wty.md (warranty notes)"
echo "✓ mkdocs.yml (site configuration)"
echo "✓ docs/ (entire folder - new documentation)"
echo ""

read -p "Do you want to proceed with cleanup? (y/n) " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Creating backup directory..."
    mkdir -p old-docs-backup
    
    echo "Moving old documentation to backup..."
    mv API_SERVICE_REFERENCE.md old-docs-backup/ 2>/dev/null
    mv APP_FUNCTIONALITY_GUIDE.md old-docs-backup/ 2>/dev/null
    mv TECHNICAL_ARCHITECTURE.md old-docs-backup/ 2>/dev/null
    mv FUNCTIONAL_SPECIFICATIONS.md old-docs-backup/ 2>/dev/null
    mv DEVELOPER_CHECKLISTS.md old-docs-backup/ 2>/dev/null
    mv MARKETING_FEATURES.md old-docs-backup/ 2>/dev/null
    mv IMPLEMENTATION_STATUS.md old-docs-backup/ 2>/dev/null
    mv CLEANUP_CONFIGURATION.md old-docs-backup/ 2>/dev/null
    
    echo ""
    echo "✅ Cleanup complete!"
    echo ""
    echo "Old files have been moved to: old-docs-backup/"
    echo "You can safely delete this backup folder once you've verified the new docs."
    echo ""
    echo "Your new documentation structure is in: docs/"
    echo "To serve the documentation site, run: mkdocs serve"
else
    echo "Cleanup cancelled."
fi