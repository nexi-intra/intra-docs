---
title: Data Management Principles in the KOKSMAT Model
description: An overview of data management practices within the KOKSMAT model, focusing on synchronization, validation, and handling additional data.
sidebar_label: Data Management
---

## Introduction

Data management in the KOKSMAT model involves a systematic approach to handling data that is essential for the functioning of various applications within the system. This model ensures that data from external sources can be efficiently integrated, validated, and managed within KOKSMAT’s internal databases.

## Key Principles of Data Management in KOKSMAT

### Dependence on External Data Sources

KOKSMAT relies heavily on external data sources. Much of the data managed within KOKSMAT is not original or master data but is instead sourced from other systems. For example, a country record may be maintained in an external SharePoint list, and this data needs to be synchronized with KOKSMAT’s internal database.

### Synchronization with External Systems

To ensure that KOKSMAT’s databases remain up-to-date with changes made in external systems like SharePoint, synchronization processes are critical.

#### Synchronization Process

- **Triggering the Job:** When a change is detected in a SharePoint list (such as an addition, update, or deletion of a country record), a job is triggered within KOKSMAT.
- **Data Import:** The job synchronizes the data by replicating the relevant lists from SharePoint into an import table in KOKSMAT.

### Data Import and Validation Process

Once the data is imported into KOKSMAT, a validation process begins. This involves checking the data against existing records to ensure consistency and accuracy.

#### Handling Insertions, Updates, and Deletions

- **Insertions:** If a new identity is detected (e.g., a new country in the SharePoint list), the system will call the insert method to add this new entry to the country table within the KOKSMAT database.
- **Updates:** If changes are detected in an existing record, the system will apply these changes to maintain the integrity of the major data fields in the database.
- **Deletions:** If a record is deleted in SharePoint, KOKSMAT performs a soft delete, marking the record as inactive within its database rather than completely removing it.

### Handling Additional Data with the “Bag of Data” Concept

In some cases, there may be a need to store additional data related to a record that is not part of the standard fields. This is where the concept of a “bag of data” comes into play.

#### Using the “Bag of Data”

- **Storing Additional Information:** The “bag of data” is an attachment to a record in the KOKSMAT database that allows for the storage of supplementary information.
- **Updating Replicated Records:** When dealing with replicated records, users must use the “update bag” method instead of the standard create, update, and delete methods. This ensures that any extra information is properly stored and managed without disrupting the integrity of the replicated data.

### Data Access and Integration

KOKSMAT provides flexibility in how data can be accessed and integrated.

#### Accessing and Integrating Data

- **SQL Queries:** Users can pull data using any SQL statements.
- **Joining Data:** Users can join this data with other tables or datasets as needed, allowing for complex data analysis and reporting.

## Conclusion

The KOKSMAT model provides a robust framework for managing data sourced from external systems, ensuring that it is synchronized, validated, and integrated into internal databases with precision. The use of import tables, validation processes, and methods like the “bag of data” for handling supplementary information ensures that KOKSMAT can manage data efficiently while maintaining data integrity and flexibility.
