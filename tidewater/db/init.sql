CREATE TABLE menu_items (
  id SERIAL PRIMARY KEY,
  category TEXT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  price NUMERIC(6,2) NOT NULL,
  sort INT NOT NULL DEFAULT 0
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  phone TEXT NOT NULL,
  guests INT NOT NULL CHECK (guests BETWEEN 1 AND 12),
  reserved_at TIMESTAMP NOT NULL,
  notes TEXT,
  created_at TIMESTAMP NOT NULL DEFAULT now()
);

INSERT INTO menu_items (category, name, description, price, sort) VALUES
('Starters', 'Oysters on ice', 'Six Pacific oysters, shallot vinegar, lemon', 18.00, 1),
('Starters', 'Grilled octopus', 'Charred over coals, smoked paprika, white bean purée', 16.00, 2),
('Starters', 'Chilled corn soup', 'Sweet corn, chive oil, crab', 11.00, 3),
('Mains', 'Whole sea bream', 'Roasted with fennel, capers and brown butter', 34.00, 1),
('Mains', 'Shrimp linguine', 'Garlic, chili, parsley, a splash of white wine', 24.00, 2),
('Mains', 'Mushroom risotto', 'Wild mushrooms, parmesan, thyme', 21.00, 3),
('Mains', 'Dry-aged ribeye', '300 g, bone marrow butter, watercress', 42.00, 4),
('Desserts', 'Lemon tart', 'Burnt meringue, olive oil', 9.00, 1),
('Desserts', 'Chocolate pot', 'Sea salt, whipped crème fraîche', 9.00, 2),
('Drinks', 'House lemonade', 'Mint, sparkling water', 5.00, 1),
('Drinks', 'Espresso', 'Single origin, roasted weekly', 3.50, 2),
('Drinks', 'Dry white, glass', 'Vermentino, Sardinia', 8.00, 3);
