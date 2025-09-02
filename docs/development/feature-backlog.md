# Feature Backlog

Implementation checklist for remaining VMS features, organized by priority and module.

## Priority Levels

- **Critical** - Core business functions
- **Important** - Enhanced functionality  
- **Nice-to-have** - Additional features

## Implementation Status Overview

| Module | Status | Remaining Work |
|--------|--------|---------------|
| Vehicle Management | 80% | Custom actions, integrations |
| Warranty Management | 90% | Analytics, reporting |
| Budget Management | 100% | Complete |
| Recall Campaigns | 100% | Complete |
| Service Operations | 40% | Service orders, workshop management |
| Customer Management | 20% | CRM features, portal |
| Procurement & Sales | 0% | Full implementation needed |
| Inventory Operations | 0% | Full implementation needed |

## Detailed Implementation Tasks

## Procurement & Sales Module

### Purchase Order Management

#### Backend Tasks
```javascript
// 1. Create entities in /db/procurement.cds
entity PurchaseOrders {
  key ID: UUID;
  orderNumber: String(20) @mandatory;
  supplier: Association to BusinessPartners;
  orderDate: Date;
  status: String enum { DRAFT; SENT; CONFIRMED; DELIVERED };
  items: Composition of many PurchaseOrderItems;
  totalAmount: Decimal(15,2);
}

entity PurchaseOrderItems {
  key ID: UUID;
  order: Association to PurchaseOrders;
  material: String(40);
  quantity: Decimal(13,3);
  unitPrice: Decimal(15,2);
  totalPrice: Decimal(15,2);
}
```

#### Service Implementation
```javascript
// 2. Create service in /srv/procurement-service.cds
service ProcurementService {
  entity PurchaseOrders as projection on db.PurchaseOrders;
  entity PurchaseOrderItems as projection on db.PurchaseOrderItems;
  
  action confirmOrder(orderID: UUID) returns PurchaseOrders;
  action cancelOrder(orderID: UUID) returns PurchaseOrders;
}

// 3. Implement handlers in /srv/procurement-service.js
module.exports = cds.service.impl(async function() {
  const { PurchaseOrders } = this.entities;
  
  // Generate order number
  this.before('CREATE', 'PurchaseOrders', async (req) => {
    req.data.orderNumber = await generateOrderNumber();
    req.data.status = 'DRAFT';
  });
  
  // Confirm order action
  this.on('confirmOrder', async (req) => {
    const { orderID } = req.data;
    await UPDATE(PurchaseOrders).set({status: 'CONFIRMED'}).where({ID: orderID});
    return SELECT.from(PurchaseOrders).where({ID: orderID});
  });
});
```

#### Frontend Tasks
- [ ] Create Fiori Elements app in `/app/purchaseorders/`
- [ ] Configure manifest.json
- [ ] Add to launchpad
- [ ] Test CRUD operations

### Sales Order Processing

#### Implementation Checklist
- [ ] Create SalesOrders entity
- [ ] Create SalesOrderItems entity  
- [ ] Implement pricing calculation
- [ ] Add discount authorization
- [ ] Create approval workflow
- [ ] Implement credit check
- [ ] Build Fiori app
- [ ] Add vehicle reservation

### Invoicing

#### Incoming Invoices
- [ ] Create IncomingInvoices entity
- [ ] Implement three-way match
- [ ] Add approval workflow
- [ ] Create SAP posting

#### Outgoing Invoices  
- [ ] Create OutgoingInvoices entity
- [ ] Generate from sales order
- [ ] PDF generation
- [ ] Email distribution

## Inventory Operations Module

### Goods Movements

#### Core Entities
```javascript
// Create in /db/inventory.cds
entity GoodsMovements {
  key ID: UUID;
  movementType: String enum { RECEIPT; ISSUE; TRANSFER };
  movementDate: DateTime;
  vehicle: Association to Vehicles;
  referenceDoc: String(50);
  status: String enum { PLANNED; COMPLETED };
}
```

#### Implementation Tasks
- [ ] Goods receipt from PO
- [ ] Goods issue to customer
- [ ] Inter-location transfer
- [ ] Inventory level tracking
- [ ] SAP Material Document posting

### Stock Management

- [ ] Create StockLevels entity
- [ ] Implement reorder points
- [ ] Add automatic PO generation
- [ ] Create aging reports

## Service Operations Module

### Service Orders

#### Entity Definition
```javascript
entity ServiceOrders {
  key ID: UUID;
  orderNumber: String(20);
  vehicle: Association to Vehicles;
  customer: Association to BusinessPartners;
  serviceType: String enum { MAINTENANCE; REPAIR; INSPECTION };
  appointmentDate: DateTime;
  status: String enum { SCHEDULED; IN_PROGRESS; COMPLETED };
  laborItems: Composition of many ServiceLaborItems;
  partItems: Composition of many ServicePartItems;
}
```

#### Implementation Tasks
- [ ] Create service order entities
- [ ] Implement scheduling logic
- [ ] Add technician assignment
- [ ] Create service history
- [ ] Build service advisor dashboard

### Workshop Management

- [ ] Resource planning
- [ ] Bay allocation
- [ ] Technician workload
- [ ] Tool inventory

## Customer Management Module

### End Customer Management

#### Extended Entity
```javascript
extend entity BusinessPartners {
  customerType: String enum { RETAIL; FLEET; GOVERNMENT };
  loyaltyTier: String enum { BRONZE; SILVER; GOLD; PLATINUM };
  lifetimeValue: Decimal(15,2);
  preferredDealer: Association to Dealers;
}
```

#### Tasks
- [ ] Create customer 360 view
- [ ] Add interaction history
- [ ] Implement loyalty program
- [ ] Build customer portal
- [ ] Add GDPR features

### Lead Management

- [ ] Create Leads entity
- [ ] Implement scoring
- [ ] Add assignment rules
- [ ] Create conversion tracking

## Technical Improvements

### Performance Optimization

```sql
-- Add database indexes
CREATE INDEX idx_claims_vehicle ON Claims(vehicle_ID);
CREATE INDEX idx_claims_status ON Claims(claimStatus);
CREATE INDEX idx_vehicles_vin ON Vehicles(vin);
```

- [ ] Implement Redis caching
- [ ] Optimize queries
- [ ] Add connection pooling
- [ ] Implement lazy loading

### Security Enhancements

- [ ] Implement proper OAuth 2.0
- [ ] Add rate limiting
- [ ] Field-level encryption
- [ ] Security headers
- [ ] OWASP compliance

### Testing Coverage

```javascript
// Example unit test
describe('ClaimService', () => {
  test('should calculate warranty coverage', async () => {
    const claim = { damageDate: '2024-01-01', mileage: 10000 };
    const warranty = { months: 36, miles: 36000 };
    const coverage = await calculateCoverage(claim, warranty);
    expect(coverage).toBe(1.0); // 100% coverage
  });
});
```

- [ ] Unit tests (target 80%)
- [ ] Integration tests
- [ ] E2E test scenarios
- [ ] Load testing

## Implementation Roadmap

### Phase 1 (Weeks 1-4): Foundation
1. Purchase Order backend
2. Sales Order backend
3. Goods Movements backend
4. SAP Integration framework

### Phase 2 (Weeks 5-8): Core Features
1. Purchase Order UI
2. Sales Order UI
3. Goods Movements UI
4. End Customer Management

### Phase 3 (Weeks 9-12): Extended Features
1. Invoicing system
2. Service Order management
3. Workshop management
4. Basic analytics

### Phase 4 (Weeks 13-16): Polish
1. Performance optimization
2. Security enhancements
3. Testing coverage
4. Documentation

## Definition of Done

A feature is complete when:

- [ ] Code follows standards
- [ ] Unit tests pass (80% coverage)
- [ ] Integration tests pass
- [ ] Code review completed
- [ ] Documentation updated
- [ ] Accessible (WCAG 2.1 AA)
- [ ] Performance benchmarks met
- [ ] Deployed to test environment

## Quick Start for Developers

### To implement a new feature:

1. **Review requirements** in [Functional Specifications](../modules/index.md)
2. **Create entities** in `/db/domain.cds`
3. **Define service** in `/srv/service.cds`
4. **Implement logic** in `/srv/service.js`
5. **Add test data** in `/db/data/`
6. **Create UI** in `/app/appname/`
7. **Write tests** in `/test/`
8. **Update documentation**

### Useful Commands

```bash
# Start development server
npm start

# Run specific app
npm run watch-vehicles

# Run tests
npm test

# Deploy to Cloud Foundry
cf push
```

## Resources

- [Implementation Guide](implementation-guide.md)
- [API Reference](../integration/api-reference.md)
- [Best Practices](best-practices.md)
- [Testing Guide](testing.md)