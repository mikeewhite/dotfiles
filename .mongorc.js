// Override the prompt to add in the database name
prompt=function () {
  return db+'> ';
}

// Pretty print by default
DBQuery.prototype._prettyShell = true

// Opt-out of pretty print by default
DBQuery.prototype.unpretty = function () {
  this._prettyShell = false;
  return this;
}
