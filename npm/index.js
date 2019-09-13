const fs = require("fs-extra");
const { localQodePath, localQtHome } = require("./config");

// return executable path of installed qode version
function getQodePath() {
  if (fs.existsSync(localQodePath)) {
    return localQodePath;
  } else {
    throw new Error(
      "Qode failed to install correctly, please delete node_modules/qode and try installing again"
    );
  }
}

module.exports = {
  qodePath: getQodePath(),
  qtHome: process.env.QT_INSTALL_DIR || localQtHome
};
