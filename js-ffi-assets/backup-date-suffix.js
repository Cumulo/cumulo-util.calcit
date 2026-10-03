() => {
  const now = new Date();
  return path.join(String(now.getMonth() + 1), `${now.getDate()}-snapshot.edn`);
}
