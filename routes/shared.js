module.exports = {
  pagesQuery: "SELECT * FROM `pages` WHERE status = 1 ORDER BY id ASC;",
  authorsQuery: "SELECT * FROM `authors`;",
  genresQuery: "SELECT * FROM `genres` ORDER BY id ASC;",
  keywordsQuery: "SELECT * FROM `keywords` WHERE page_id=1;"
};