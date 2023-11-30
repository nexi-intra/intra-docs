---
stage: 10
---

# Planning

```yaml States
- stage: planning # Agenda and goals
    type: sequential
    name: Planning  
    inputs:
      - suggestion:
    outputs: 
      - agenda:
      - invitation:
    tasks:
      - prepare agenda:
          who: secretary
      - approve agenda:       
          who: chair
      - prepare invitation:
          who: secretary
      - reserve resources:
          who: secretary  
      - invite attendees:
          who: secretary
    conditions:
      pending:  
        receive confirmations:

      final:
        confirm resource:
        
```