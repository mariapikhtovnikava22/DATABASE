CREATE TABLE Roles (
    id   SERIAL     PRIMARY KEY,
    Name VARCHAR (64) NOT NULL
                      UNIQUE
);

CREATE TABLE Users (
    id          sERIAL      PRIMARY KEY,
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

CREATE TABLE Sizes (
    id   SERIAL     PRIMARY KEY,
    Diametr VARCHAR (64) NOT NULL
                         UNIQUE
);

CREATE TABLE Pizzas (
    id   SERIAL     PRIMARY KEY,
    Name    VARCHAR (64) NOT NULL,
    Price   REAL         NOT NULL,
    SizesId INTEGER      REFERENCES Sizes (Id) ON DELETE CASCADE
);

CREATE TABLE Reviews (
    id   SERIAL     PRIMARY KEY,
    Text    VARCHAR (1024) NOT NULL,
    Time    TIMESTAMP      NOT NULL,
    PizzaId INTEGER        REFERENCES Pizzas (Id) ON DELETE CASCADE,
    UserId  INTEGER        REFERENCES Users (Id) ON DELETE CASCADE
);

CREATE TABLE Ingredients (
    id   SERIAL     PRIMARY KEY,
    Name VARCHAR (64) NOT NULL
);

CREATE TABLE States (
    id   SERIAL     PRIMARY KEY,
    Name VARCHAR (64) NOT NULL
                      UNIQUE
);

CREATE TABLE Promocodes (
    id   SERIAL     PRIMARY KEY,
    Name VARCHAR (64) NOT NULL,
    Code INTEGER      NOT NULL
                      UNIQUE
);

CREATE TABLE Prices (
    id   SERIAL     PRIMARY KEY,
    Price   REAL    NOT NULL,
    PromoId    INTEGER     REFERENCES Promocodes (Id) ON DELETE SET NULL
);

CREATE TABLE Orders (
    id   SERIAL     PRIMARY KEY,
    UserName VARCHAR (64) NOT NULL,
    StateId      INTEGER         REFERENCES States (Id) ON DELETE CASCADE,
    PriceId      INTEGER        REFERENCES Prices (Id) ON DELETE SET NULL
);

CREATE TABLE OrderItems (
    id   SERIAL     PRIMARY KEY,
    Count   INTEGER NOT NULL,
    PizzaId INTEGER REFERENCES Pizzas (Id) ON DELETE CASCADE,
    OrderId INTEGER REFERENCES Orders (Id) ON DELETE SET NULL
);


CREATE TABLE PizzaIngredients (
    id   SERIAL     PRIMARY KEY,
    PizzaId      INTEGER REFERENCES Pizzas (Id) ON DELETE CASCADE,
    IngredientId INTEGER REFERENCES Ingredients (Id) ON DELETE CASCADE,
    UNIQUE (
        PizzaId,
        IngredientId
    )
);
