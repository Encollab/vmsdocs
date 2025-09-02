# System Architecture

## Overview

VMS follows a modern, cloud-native architecture built on SAP Cloud Application Programming (CAP) model with microservices design principles.

## Architecture Layers

```mermaid
graph TB
    subgraph "Presentation Layer"
        FLP[SAP Fiori Launchpad]
        WEB[Web Browser]
        MOB[Mobile Browser]
    end
    
    subgraph "Application Layer"
        subgraph "Fiori Apps"
            VA[Vehicle Apps]
            WA[Warranty Apps]
            BA[Budget Apps]
            RA[Recall Apps]
        end
    end
    
    subgraph "Service Layer"
        subgraph "OData Services"
            VS[Vehicle Service]
            WS[Warranty Service]
            BS[Budget Service]
            RS[Recall Service]
            MS[Master Data Services]
        end
    end
    
    subgraph "Business Logic Layer"
        BL[CAP Business Logic]
        WF[Workflows]
        VAL[Validation Rules]
        CAL[Calculations]
    end
    
    subgraph "Data Layer"
        subgraph "Domain Models"
            VMD[VMS Domain]
            WMD[Warranty Domain]
            SMD[Shared Domain]
        end
        DB[(HANA Cloud)]
    end
    
    subgraph "Integration Layer"
        SAP[SAP S/4HANA]
        EXT[External Systems]
        API[API Gateway]
    end
    
    WEB --> FLP
    MOB --> FLP
    FLP --> VA
    FLP --> WA
    FLP --> BA
    FLP --> RA
    
    VA --> VS
    WA --> WS
    BA --> BS
    RA --> RS
    
    VS --> BL
    WS --> BL
    BS --> BL
    RS --> BL
    
    BL --> VMD
    BL --> WMD
    BL --> SMD
    
    VMD --> DB
    WMD --> DB
    SMD --> DB
    
    BL <--> API
    API <--> SAP
    API <--> EXT
```

## Component Architecture

### Frontend Components

```mermaid
graph LR
    subgraph "Fiori Launchpad"
        TILE[App Tiles]
        NAV[Navigation]
        PERS[Personalization]
        ROLE[Role Config]
    end
    
    subgraph "Fiori Elements Apps"
        LR[List Report]
        OP[Object Page]
        ALP[Analytical List]
        OVP[Overview Page]
    end
    
    subgraph "Custom UI5 Apps"
        CONF[Configurator]
        DASH[Dashboards]
    end
    
    TILE --> LR
    TILE --> OP
    TILE --> CONF
    ROLE --> TILE
```

### Service Architecture

```mermaid
graph TB
    subgraph "Service Endpoints"
        EP1[/odata/v4/vehicle/]
        EP2[/odata/v4/warranty/]
        EP3[/odata/v4/vehicle-budgets/]
        EP4[/odata/v4/recall-campaign/]
    end
    
    subgraph "Service Implementation"
        DRAFT[Draft Handling]
        ACT[Actions]
        FUNC[Functions]
        VAL[Validations]
    end
    
    subgraph "Service Features"
        AUTH[Authorization]
        CACHE[Caching]
        LOG[Logging]
        ERR[Error Handling]
    end
    
    EP1 --> DRAFT
    EP2 --> ACT
    EP3 --> FUNC
    EP4 --> VAL
    
    DRAFT --> AUTH
    ACT --> CACHE
    FUNC --> LOG
    VAL --> ERR
```

## Data Model Architecture

### Domain Structure

```mermaid
erDiagram
    VMS_DOMAIN {
        Vehicles entity
        VehicleModels entity
        VehicleTexts entity
        VehicleCustomFields entity
    }
    
    WARRANTY_DOMAIN {
        Claims entity
        ClaimItems entity
        ClaimVersions entity
        MasterWarranties entity
        ClaimTemplates entity
    }
    
    SHARED_DOMAIN {
        TextTypes entity
        CustomFields entity
        CodeLists entity
        Attachments entity
    }
    
    VMS_DOMAIN ||--o{ WARRANTY_DOMAIN : references
    VMS_DOMAIN ||--o{ SHARED_DOMAIN : uses
    WARRANTY_DOMAIN ||--o{ SHARED_DOMAIN : uses
```

### Entity Relationships

```mermaid
erDiagram
    Vehicles ||--o{ VehicleTexts : has
    Vehicles ||--o{ VehicleCustomFields : has
    Vehicles ||--o{ Claims : has
    Vehicles }o--|| VehicleModels : type
    
    Claims ||--o{ ClaimItems : contains
    Claims ||--o{ ClaimVersions : versions
    Claims ||--o{ ClaimTexts : has
    Claims }o--|| ClaimTemplates : from
    
    MasterWarranties ||--o{ ClaimTemplates : defines
    VehicleModels }o--o{ MasterWarranties : coverage
```

## Integration Architecture

### SAP S/4HANA Integration

```mermaid
sequenceDiagram
    participant VMS
    participant API
    participant S4H as S/4HANA
    
    Note over VMS,S4H: Master Data Sync
    S4H->>API: Material Change Event
    API->>VMS: Update Vehicle Models
    VMS->>VMS: Update Cache
    
    Note over VMS,S4H: Transaction Posting
    VMS->>API: Post Warranty Claim
    API->>S4H: Create FI Document
    S4H-->>API: Document Number
    API-->>VMS: Confirmation
```

### External System Integration

```mermaid
graph LR
    subgraph "VMS"
        INT[Integration Service]
        QUEUE[Message Queue]
        ADAPT[Adapters]
    end
    
    subgraph "External Systems"
        DMS[Document Management]
        EMAIL[Email Service]
        SMS[SMS Gateway]
        CONFIG[3rd Party Configurator]
    end
    
    INT --> QUEUE
    QUEUE --> ADAPT
    ADAPT <--> DMS
    ADAPT <--> EMAIL
    ADAPT <--> SMS
    ADAPT <--> CONFIG
```

## Security Architecture

### Authentication & Authorization

```mermaid
graph TB
    subgraph "Authentication"
        IDP[Identity Provider]
        SAML[SAML 2.0]
        OAuth[OAuth 2.0]
        JWT[JWT Tokens]
    end
    
    subgraph "Authorization"
        ROLES[Role Management]
        PERM[Permissions]
        FIELD[Field Security]
        ROW[Row-Level Security]
    end
    
    subgraph "Audit"
        LOG[Audit Logs]
        TRACK[Change Tracking]
        COMP[Compliance Reports]
    end
    
    IDP --> SAML
    SAML --> JWT
    OAuth --> JWT
    JWT --> ROLES
    ROLES --> PERM
    PERM --> FIELD
    PERM --> ROW
    FIELD --> LOG
    ROW --> LOG
    LOG --> TRACK
    TRACK --> COMP
```

## Deployment Architecture

### Cloud Deployment

```mermaid
graph TB
    subgraph "SAP BTP"
        subgraph "Cloud Foundry"
            APP[Application Runtime]
            SRV[Service Instances]
        end
        
        subgraph "Services"
            HANA[HANA Cloud]
            AUTH[Authorization Service]
            DEST[Destination Service]
            CONN[Connectivity Service]
        end
    end
    
    subgraph "External"
        S4H[S/4HANA]
        USR[Users]
    end
    
    USR --> APP
    APP --> SRV
    SRV --> HANA
    SRV --> AUTH
    SRV --> DEST
    DEST --> S4H
    SRV --> CONN
    CONN --> S4H
```

## Performance Architecture

### Caching Strategy

```mermaid
graph LR
    subgraph "Cache Layers"
        BROWSER[Browser Cache]
        CDN[CDN Cache]
        APP[Application Cache]
        DB[Database Cache]
    end
    
    subgraph "Cache Types"
        STATIC[Static Assets]
        META[Metadata]
        TRANS[Transactional]
        MASTER[Master Data]
    end
    
    STATIC --> BROWSER
    STATIC --> CDN
    META --> APP
    MASTER --> APP
    TRANS --> DB
```

## Development Architecture

### Development Flow

```mermaid
graph LR
    subgraph "Development"
        LOCAL[Local Dev]
        TEST[Test System]
        QA[QA System]
        PROD[Production]
    end
    
    subgraph "Tools"
        IDE[VS Code]
        GIT[Git Repository]
        CI[CI/CD Pipeline]
        MON[Monitoring]
    end
    
    IDE --> LOCAL
    LOCAL --> GIT
    GIT --> CI
    CI --> TEST
    TEST --> QA
    QA --> PROD
    PROD --> MON
```

## Scalability Considerations

### Horizontal Scaling
- Stateless services enable easy scaling
- Load balancing across instances
- Database connection pooling
- Caching reduces database load

### Vertical Scaling
- HANA Cloud auto-scaling
- Dynamic resource allocation
- Performance monitoring
- Capacity planning

## Technology Decisions

### Why SAP CAP?
- Native SAP integration
- Built-in best practices
- Rapid development
- Enterprise features out-of-box

### Why HANA Cloud?
- In-memory performance
- Native CAP integration
- Advanced analytics
- Scalability

### Why Fiori Elements?
- Consistent UX
- Rapid development
- Responsive design
- Accessibility compliance

## Next Steps

- Review [Technology Stack](technology.md) for detailed technologies
- Check [Security & Compliance](security.md) for security details
- See [Development Guide](../development/index.md) for development setup
- Explore [Integration Guide](../integration/index.md) for integration patterns