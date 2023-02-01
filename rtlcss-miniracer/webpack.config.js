const path = require("path");

module.exports = {
  devtool: false,
  mode: "production",
  entry: "rtlcss",
  output: {
    iife: false,
    libraryTarget: "var",
    library: "rtlcss",
    path: path.resolve(`${__dirname}/../`, "dist"),
  },
};
