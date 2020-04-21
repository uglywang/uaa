config_dir = "/etc/config"
secrets_dir = "/etc/secrets"
truststore_file = "/etc/truststore/uaa.pkcs12.truststore"

java_opts_list = [
  "-Djava.security.egd=file:/dev/./urandom",
  "-Dlogging.config={}/log4j2.properties".format(config_dir),
  "-Dlog4j.configurationFile={}/log4j2.properties".format(config_dir),
  "-DCLOUDFOUNDRY_CONFIG_PATH={}".format(config_dir),
  "-DSECRETS_DIR={}".format(secrets_dir),
  "-Djavax.net.ssl.trustStore={}".format(truststore_file),
  "-Djavax.net.ssl.trustStoreType=PKCS12",
  "-Djavax.net.ssl.trustStorePassword=changeit",
]

def java_opts(database_scheme):
  ret = "-Dspring_profiles={}".format(database_scheme or "hsqldb")
  for i in range(0, len(java_opts_list)):
    ret += " "
    ret += java_opts_list[i]
  end
  return ret
end
