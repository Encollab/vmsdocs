# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **documentation project** for restructuring and organizing the Vehicle Management System (VMS) documentation. The repository contains planning materials and todo lists for reorganizing existing VMS documentation into a coherent structure.

## Repository Purpose

The `vmsdocs` repository serves as a workspace for:
- Planning VMS documentation restructure
- Creating task lists and roadmaps for documentation work
- Organizing content outlines before implementation
- Functional documentation for VMS and Warranty system features

## Current Content

- `todo.md` - Original hierarchical outline of VMS documentation topics (archived)
- `/vms/` - Structured functional documentation organized by business area
- `/warranty/` - Comprehensive warranty system documentation (enterprise-level)

## Actual VMS Implementation

The VMS system consists of **9 implemented Fiori applications** built on SAP CAP:

### Core Vehicle Management (✅ Implemented)
- **Vehicles App** - Complete vehicle master data management with custom fields and configurations
- **Vehicle Models** - Managed through vehicle service with model associations

### Configuration System (✅ Implemented)  
- **Configurator App** - Vehicle configuration with templates, rules, options, and groups
- **Configuration Rules App** - Advanced rule management for vehicle configurations

### Warranty Management (✅ Implemented)
- **Warranty Claims App** - Complete claim processing with versioning support
- **Master Warranties App** - Warranty profile and condition management  
- **Claim Template Manager App** - Reusable claim template creation and management
- **Claim Versions App** - Comprehensive claim version tracking and history

### System Administration (✅ Implemented)
- **Custom Fields App** - Dynamic field extension system for vehicles and claims
- **Text Types App** - Multilingual text management across the system

## Documentation vs Implementation Status

### ✅ Accurately Documented (Implemented Features)
- `/vms/vehicle-management/` - Aligns with Vehicles app and vehicle entities
- `/vms/service-warranty/` - Partially aligns with warranty apps (needs expansion)

### ⚠️ Planned Features (Not Yet Implemented)
- `/vms/procurement-sales/` - Comprehensive documentation for future implementation
- `/vms/customer-management/` - Strategic documentation for CRM capabilities  
- `/vms/inventory-operations/` - Operational process documentation for future phases

### 📝 Missing Documentation (Implemented but Not Documented)
- Vehicle Configuration System (configurator and configuratorrules apps)
- Custom Fields Extension System (customfields app)
- Text Types Management (texttypes app)  
- Advanced Warranty Features (claim templates and versioning)
- System Administration (CAP services, data model, integrations)

## Technical Architecture

The implemented system uses:
- **SAP CAP (Cloud Application Programming)** - Backend services and data model
- **SAP Fiori Elements** - Frontend applications with annotations-based UI
- **SAP BTP** - Cloud platform deployment
- **CDS (Core Data Services)** - Entity modeling and service definitions
- **SQLite/SAP HANA** - Database layer
- **Node.js** - Runtime environment

## Documentation Structure Context

The todo.md file contains a hierarchical breakdown of VMS (Vehicle Management System) topics derived from SAP IS-A-VMS documentation, including:

**Core Areas:**
- Vehicle Master Data and Vehicle Models
- Vehicle Procurement and Sales processes
- Vendor/Customer and End Customer management
- Vehicle Actions and Configuration Management
- Warranty Claim Processing
- Technical Integration (Transaction Codes, BAdIs)

**Process Areas:**
- Make-to-Stock and Make-to-Order scenarios
- Sales processes (Reservations, Orders, Invoicing)
- Procurement processes (Purchase Orders, Incoming Invoices)
- Shipping and Delivery processes
- Goods Movements and Returns processing
- Service and Warranty processing

## Working with This Repository

This is a planning and documentation workspace, not a code repository. Tasks typically involve:
- Reviewing and restructuring documentation outlines
- Converting hierarchical topic lists into actionable documentation plans
- Creating roadmaps for documentation development
- Organizing content according to the custom VMS implementation needs

## Related Systems

This documentation planning relates to a larger Vehicle Management System implementation that includes:
- SAP CAP-based backend services
- Multiple Fiori/UI5 frontend applications
- Integration with S/4HANA systems
- Custom warranty claim processing
- Vehicle configuration management