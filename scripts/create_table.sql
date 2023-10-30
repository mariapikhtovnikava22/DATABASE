CREATE TABLE Users (
    id          INTEGER      PRIMARY KEY AUTOINCREMENT,
    Username    VARCHAR (64) NOT NULL
                             UNIQUE,
    Password    VARCHAR (64) NOT NULL,
    PhoneNumber VARCHAR (13) NOT NULL,
    Email       VARCHAR (64) NOT NULL
                             UNIQUE,
    Address     VARCHAR (64) NOT NULL,
    FirstName   VARCHAR (64) NOT NULL,
    LastName    VARCHAR (64) NOT NULL,
    RoleId      INTEGER      REFERENCES Roles (id) ON DELETE CASCADE
);

CREATE TABLE Roles (
    id   INTEGER      PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR (64) NOT NULL
                      UNIQUE
);

CREATE TABLE Reviews (
    id      INTEGER        PRIMARY KEY AUTOINCREMENT,
    Text    VARCHAR (1024) NOT NULL,
    Time    DATETIME       NOT NULL,
    PizzaId INTEGER        REFERENCES Pizzas (Id) ON DELETE CASCADE,
    UserId  INTEGER        REFERENCES Users (Id) ON DELETE CASCADE
);

CREATE TABLE Pizzas (
    id      INTEGER      PRIMARY KEY AUTOINCREMENT,
    Name    VARCHAR (64) NOT NULL,
    Price   REAL         NOT NULL,
    Photo   BLOB         NOT NULL,
    SizesId INTEGER      REFERENCES Sizes (Id) ON DELETE CASCADE
);

CREATE TABLE Sizes (
    id      INTEGER      PRIMARY KEY AUTOINCREMENT,
    Diametr VARCHAR (64) NOT NULL
                         UNIQUE
);

CREATE TABLE Ingredients (
    id   INTEGER      PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR (64) NOT NULL
);

CREATE TABLE OrderItems (
    id      INTEGER PRIMARY KEY AUTOINCREMENT,
    Count   INTEGER NOT NULL,
    PizzaId INTEGER REFERENCES Pizzas (Id) ON DELETE CASCADE,
    OrderId INTEGER REFERENCES Orders (Id) ON DELETE SET NULL
);

CREATE TABLE Orders (
    id       INTEGER      PRIMARY KEY AUTOINCREMENT,
    UserName VARCHAR (64) NOT NULL,
    StateId               REFERENCES States (Id) ON DELETE CASCADE,
    PriceId               REFERENCES Prices (Id) ON DELETE SET NULL
);

CREATE TABLE Prices (
    id      INTEGER PRIMARY KEY AUTOINCREMENT,
    Price   REAL    NOT NULL,
    PromoId         REFERENCES Promocodes (Id) ON DELETE SET NULL
);

CREATE TABLE Promocodes (
    id   INTEGER      PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR (64) NOT NULL,
    Code INTEGER      NOT NULL
                      UNIQUE
);

CREATE TABLE States (
    id   INTEGER      PRIMARY KEY AUTOINCREMENT,
    Name VARCHAR (64) NOT NULL
                      UNIQUE
);

CREATE TABLE PizzaIngredients (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    PizzaId      INTEGER REFERENCES Pizzas (Id) ON DELETE CASCADE,
    IngredientId INTEGER REFERENCES Ingredients (Id) ON DELETE CASCADE,
    UNIQUE (
        PizzaId,
        IngredientId
    )
);
