### PART 2 : Ans of the Questions
## Answers :-
## Section A: Limitations of RDBMS

Relational databases like MySQL work well when data follows a fixed and uniform structure. 
However, in FlexiMart’s expanding product catalog, products have highly diverse attributes. 
For example, laptops require attributes such as RAM, processor, and storage, while shoes need size, color, and material. 
In an RDBMS, this would require either adding many nullable columns or creating multiple related tables, increasing complexity.

Frequent schema changes are another limitation. 
Whenever a new product type is added, the table structure must be altered using ALTER TABLE commands, which is time-consuming and risky for large datasets.

Additionally, storing customer reviews as nested data is difficult in relational databases. 
Reviews must be stored in separate tables and joined using foreign keys, making queries slower and more complex. 
Thus, rigid schema design and poor handling of nested and evolving data make RDBMS less suitable for such use cases.


## Section B: Benefits of MongoDB (NoSQL)

MongoDB solves these problems by using a flexible, schema-less document model. 
Each product can store different attributes without affecting others. 
For example, electronics products can include a "specs" document, while shoes can include size and color fields, all within the same collection.

MongoDB also supports embedded documents, allowing customer reviews to be stored directly inside the product document. 
This makes data retrieval faster and simpler, as product details and reviews can be fetched in a single query.

Another key advantage is horizontal scalability. 
MongoDB supports sharding, which distributes data across multiple servers, enabling FlexiMart to handle growing product catalogs and high traffic efficiently.

Because MongoDB does not require predefined schemas, frequent changes such as adding new product types or attributes can be done without downtime, making it ideal for rapidly evolving business requirements.

## Section C: Trade-offs of Using MongoDB

One disadvantage of MongoDB is weaker support for complex transactions compared to relational databases. 
While MongoDB supports ACID transactions, they are less mature and more complex to manage across multiple documents.

Another drawback is data consistency enforcement. 
In MySQL, constraints such as foreign keys and unique keys are strictly enforced, ensuring high data integrity. 
MongoDB relies more on application-level validation, which can increase the risk of inconsistent data if not handled carefully.

Therefore, MongoDB offers flexibility and scalability at the cost of strict relational integrity and complex transaction handling.

