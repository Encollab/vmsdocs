---
title: "Core Vehicle Records"
description: "Comprehensive vehicle data management with standard and custom fields"
category: "vehicle-management"
tags: ["vehicle-data", "records", "lifecycle", "partners"]
order: 1
icon: "car"
---

# Core Vehicle Records

## Overview

The vehicle management system maintains comprehensive records for each vehicle throughout its entire lifecycle. From initial registration to final disposition, every vehicle has a complete data profile that captures identification, financial, temporal, and relationship information.

## How It Works

Each vehicle record serves as a central repository of information, linking to multiple business entities and maintaining both current and historical data. The system supports both new and used vehicles with appropriate tracking mechanisms for each type.

### Vehicle Identification
- **Internal Vehicle Number**: System-generated unique identifier
- **External Vehicle Number**: Customer-facing vehicle identifier  
- **VIN**: Vehicle Identification Number for manufacturer tracking
- **Equipment Number**: Additional equipment tracking codes
- **Batch Numbers**: Production batch associations

### Financial Information
- **Gross Pricing**: Vehicle value with currency specifications
- **Currency Management**: Multi-currency support for international operations
- **Mileage Tracking**: Current odometer readings with history

### Temporal Data
- **Registration Date**: Official vehicle registration timestamp
- **Production Timestamp**: Manufacturing date and time
- **Status Timestamp**: Last status change tracking
- **Archive Management**: Lifecycle completion handling

### Business Partners
Each vehicle maintains relationships with multiple partners:
- **Vendor**: Supplying dealer or manufacturer
- **Customer**: Current owner or lessee
- **Sales Order Customer**: Original purchaser
- **End Customer**: Ultimate user in multi-party transactions

## Key Features

- Complete vehicle lifecycle tracking from production to retirement
- Multi-partner relationship management
- Used vehicle flagging with specific handling rules
- Archive capabilities for completed lifecycles
- Integration with all related modules (warranty, budget, configuration)

## Benefits

- **Single Source of Truth**: One comprehensive record eliminates data discrepancies
- **Complete History**: Full lifecycle visibility supports better decision-making
- **Partner Transparency**: Clear ownership and transaction chains
- **Regulatory Compliance**: Comprehensive data for audit and compliance requirements

## Configuration

Vehicle records can be extended through:
- Custom fields for organization-specific data
- Configurable text types for various narratives
- Document attachments for supporting materials
- Field controls for data governance

## Related Features

- [Vehicle Models](/features/vehicle-management/vehicle-models)
- [Custom Fields](/features/vehicle-management/custom-fields)
- [Field Controls](/features/vehicle-management/field-controls)
- [Document Management](/features/vehicle-management/document-management)