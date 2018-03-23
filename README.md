# terraform talk

A repo to share a little code example and the presentation itself.

## Part00

The following environment variables are required as provider configuration:

```
export DIGITALOCEAN_TOKEN="<your token>"
export DNSIMPLE_TOKEN="<your token>"
export DNSIMPLE_ACCOUNT="<your token>"
```

If these variables are present, you should be able to run `terraform plan`, `terraform apply` and
`terraform destroy` in the `part00` directory.
