CREATE TABLE posts (
  id SERIAL PRIMARY KEY NOT NULL,
  expired_at timestamp without time zone,
  visible boolean DEFAULT false
);
COPY posts (expired_at, visible) FROM '/docker-entrypoint-initdb.d/data.csv' WITH CSV;
CREATE INDEX index_posts_on_expired_at ON posts USING btree (expired_at);
CREATE INDEX index_posts_on_visible ON posts USING btree (visible);
