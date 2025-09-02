# Configuration System Cleanup Guide

Since the configuration system is being handled by a third-party solution, the following files and directories should be removed from the newvms codebase:

## Files to Remove

### Frontend Applications
```bash
# Remove configurator apps
rm -rf /Users/jorg/Node/encollab/packages/newvms/app/configurator/
rm -rf /Users/jorg/Node/encollab/packages/newvms/app/configuratorrules/
```

### Backend Services
```bash
# Remove configuration service files
rm /Users/jorg/Node/encollab/packages/newvms/srv/configurator.cds
rm /Users/jorg/Node/encollab/packages/newvms/srv/configurator.js
rm /Users/jorg/Node/encollab/packages/newvms/srv/constraint-resolver-test.js
```

### Database Entities to Remove from `/db/vms.cds`
Remove the following entities and their references:
- `ConfigurationTemplates`
- `TemplateOptions`
- `OptionGroups`
- `Options`
- `Constraints`
- `ConfigurationSessions`
- Any associations to these entities from other entities

### Package.json Scripts to Remove
Remove the following npm scripts from `/Users/jorg/Node/encollab/packages/newvms/package.json`:
- `"watch-configurator"`
- `"watch-configuratorrules"` (if exists)

### Test Data to Review
Check and remove configuration-related test data from:
- `/db/data/` - Any CSV files related to configuration entities

## Code References to Update

### 1. Check Vehicle Service (`/srv/vehicle-service.cds`)
Remove any references to configuration entities or services

### 2. Update CLAUDE.md
Remove references to configuration system in:
- `/Users/jorg/Node/encollab/packages/newvms/CLAUDE.md`

### 3. Update app/services.cds
Remove configuration service mappings

## Verification Steps

After cleanup:
1. Run `npm start` to ensure the application still starts
2. Check that no broken references exist
3. Verify that vehicle management still works without configuration dependencies
4. Update any integration tests that might reference configuration

## Alternative Integration

Document how the third-party configuration system will integrate:
1. API endpoints for configuration data
2. Authentication/authorization approach
3. Data synchronization strategy
4. Error handling for external service failures

## Backup Recommendation

Before removing files:
```bash
# Create a backup branch
git checkout -b backup/configuration-system
git add .
git commit -m "Backup: Configuration system before removal"

# Then switch back and remove files
git checkout main
```

## Notes

- The configuration system appears to be loosely coupled, so removal should be straightforward
- Main concern is ensuring no hidden dependencies in vehicle or warranty services
- Consider keeping the business logic documentation for future reference or migration