load("@ytt:data", "data")
load("@ytt:base64", "base64")

def has_ca_certs(ca_certs):
  return type(ca_certs) == "list" and len(ca_certs) > 0
end

def render(ca_certs):
    ca_certs_files = dict()

    for i in range(len(ca_certs)):
        ca_certs_files["cert{}.pem".format(i)] = base64.encode(ca_certs[i])
    end

    return ca_certs_files
end
