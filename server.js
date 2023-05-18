import pg from "pg";
import express from "express";
import dotenv from "dotenv";
dotenv.config();

const app = express();
app.use(express.json());
app.use(express.static("public"));

const db = new pg.Pool({
  connectionString: process.env.DATABASE_URL,
});

app.get("/api/users", (req, res) => {
  db.query("SELECT * FROM users").then((data) => {
    res.send(data.rows);
  });
});

app.post("/api/users", (req, res) => {
  const { first_name, last_name } = req.body;
  db.query("INSERT INTO users (first_name,last_name) VALUES ($1,$2)", [
    first_name,
    last_name,
  ])
    .then((result) => {
      res.status(200).send(result.rows[0]);
    })
    .catch((error) => {
      res.status(500).send(error);
    });
});
app.patch("/api/users/:id", (req, res) => {
  const id = Number(req.params.id);
  const { first_name, last_name } = req.body;

  db.query(
    "UPDATE users SET first_name = COALESCE($1, first_name), last_name = COALESCE($2, last_name) WHERE id = $3 RETURNING *",
    [first_name, last_name, id]
  ).then((result) => {
    if (result.rows.length === 0) {
      res.sendStatus(404);
    } else {
      res.send(result.rows[0]);
    }
  });
});

app.delete("/api/todo/:id", (req, res) => {
  const id = Number(req.params.id);
  db.query("DELETE FROM todo WHERE id = $1 RETURNING *", [id]).then(
    (result) => {
      res.send(result.rows[0]);
    }
  );
});

app.listen(3001, () => {
  console.log("listening on port 3001");
});
