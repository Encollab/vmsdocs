---
title: "Text Management"
description: "Configurable text types for narrative vehicle information"
category: "vehicle-management"
tags: ["text", "notes", "comments", "documentation", "narrative"]
order: 8
icon: "text-fields"
---

# Text Management

## Overview

The text management system enables organizations to capture and organize various types of narrative information about vehicles. From internal notes to customer communications, configurable text types provide structured ways to document information that doesn't fit into standard fields.

## How It Works

Text management operates through configurable text types that define categories of narrative information. Each text entry links to a vehicle record and carries metadata about its type, purpose, and creation context.

### Text Structure
- Text type classification
- Content storage (unlimited length)
- Vehicle association
- Metadata (creator, timestamp)
- Version tracking

## Key Features

### Text Type Configuration
- Create custom text categories
- Assign icons for visual identification
- Set description templates
- Define access permissions
- Configure display rules

### Text Categories

**Internal Documentation**
- Technical notes
- Condition assessments
- Special handling instructions
- Internal comments

**Customer Communication**
- Customer requests
- Communication history
- Special requirements
- Delivery instructions

**Compliance Notes**
- Regulatory annotations
- Inspection notes
- Compliance observations
- Exception documentation

**Service Information**
- Service recommendations
- Repair notes
- Maintenance observations
- Technical bulletins

## Benefits

- **Flexibility**: Capture any narrative information
- **Organization**: Structured categorization of text
- **Searchability**: Find vehicles by text content
- **Context**: Maintain information context with metadata
- **History**: Track text changes over time

## Configuration Options

### Text Type Setup
```yaml
Internal Note:
  icon: "note"
  entity: "VEHICLE"
  access: "internal"
  searchable: true

Customer Request:
  icon: "message"
  entity: "VEHICLE"
  access: "all"
  required: false

Inspection Comment:
  icon: "checklist"
  entity: "VEHICLE"
  access: "service"
  template: "Inspected on: [DATE]"
```

## Use Cases

### Sales Process
- Document customer preferences
- Note special requests
- Record negotiation points
- Capture delivery requirements

### Service Operations
- Document symptoms described by customer
- Note technician observations
- Record recommended services
- Capture parts ordering notes

### Compliance
- Document exception approvals
- Record inspection findings
- Note regulatory requirements
- Capture audit observations

## Integration

### Search Integration
- Full-text search across all text fields
- Filter vehicles by text content
- Include in advanced queries
- Export with vehicle data

### Reporting
- Include text in reports
- Analyze text patterns
- Track text usage
- Monitor compliance notes

## Best Practices

1. **Consistent Types**: Use standard text types across organization
2. **Clear Guidelines**: Define when each type should be used
3. **Regular Review**: Periodically review and clean up old text
4. **Access Control**: Set appropriate permissions by type
5. **Templates**: Use templates for consistent formatting

## Related Features

- [Core Vehicle Records](/features/vehicle-management/core-records)
- [Custom Fields](/features/vehicle-management/custom-fields)
- [Document Management](/features/vehicle-management/document-management)
- [Search and Lists](/features/vehicle-management/search-lists)