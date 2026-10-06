const express = require("express");
const { Pool } = require("pg");

const app = express();
app.use(express.json());
const pool = new Pool(); // reads PGHOST, PGUSER, PGPASSWORD, PGDATABASE

app.get("/api/health", (_req, res) => res.json({ ok: true }));

app.get("/api/menu", async (_req, res) => {
  try {
    const { rows } = await pool.query(
      "SELECT id, category, name, description, price FROM menu_items ORDER BY category, sort"
    );
    res.json(rows);
  } catch (e) {
    console.error(e);
    res.status(500).json({ error: "Could not load the menu." });
  }
});

app.post("/api/reservations", async (req, res) => {
  const { name, phone, guests, date, time, notes } = req.body || {};
  const n = parseInt(guests, 10);
  if (!name || !phone || !date || !time || !(n >= 1 && n <= 12)) {
    return res.status(400).json({ error: "Please fill in name, phone, date, time and 1-12 guests." });
  }
  const when = new Date(`${date}T${time}`);
  if (isNaN(when) || when < new Date()) {
    return res.status(400).json({ error: "Please choose a date and time in the future." });
  }
  try {
    const { rows } = await pool.query(
      `INSERT INTO reservations (name, phone, guests, reserved_at, notes)
       VALUES ($1,$2,$3,$4,$5) RETURNING id`,
      [name.trim(), phone.trim(), n, `${date} ${time}`, (notes || "").trim()]
    );
    res.status(201).json({ id: rows[0].id });
  } catch (e) {
    console.error(e);
    res.status(500).json({ error: "Could not save your reservation. Please try again." });
  }
});

app.listen(3000, () => console.log("API listening on :3000"));
