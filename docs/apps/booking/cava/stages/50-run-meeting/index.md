---
stage: 20
---

# Heads-up 1

```yaml States
  - stage: headsup1 # Logistics
    type: timecontraint
    name: Heads Up
    outputs: 
      - instruction: 
    tasks:
      # To support attendees with special needs, we need to know about them in advance
      # Special food ... 
      # Special support ...
      # Special equipment ...
      # Special room setup ...
      - send selfservice link:
          who: system
          when: 3 days before


```
