// File chua tham so cho cac moi truong tuong ung

enum Environment { dev, staging, prod }

class BuildConstants {
  static Map<String, dynamic> _config = _Config.devConstants;
  static var currentEnvironment = Environment.dev;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.prod:
        _config = _Config.prodConstants;
        currentEnvironment = Environment.prod;
        break;
      case Environment.dev:
        _config = _Config.devConstants;
        currentEnvironment = Environment.dev;
        break;
      case Environment.staging:
        _config = _Config.stagingConstants;
        currentEnvironment = Environment.staging;
        break;
    }
  }

  static get serverTYPE {
    return _config[_Config.serverTYPE];
  }

  static get serverAPI {
    return _config[_Config.serverAPI];
  }

  static get urlWeb {
    return _config[_Config.urlWeb];
  }
}

class _Config {
  static const serverTYPE = "SERVER_TYPE";
  static const serverAPI = "SERVER_API";
  static const urlWeb = "URL_WEB";

  static Map<String, dynamic> prodConstants = {
    serverTYPE: "prod",
    serverAPI: "",
    urlWeb: "",
  };

  static Map<String, dynamic> stagingConstants = {
    serverTYPE: "staging",
    serverAPI: "",
    urlWeb: "",
  };

  static Map<String, dynamic> devConstants = {
    serverTYPE: "dev",
    serverAPI: "",
    urlWeb: "",
  };
}
